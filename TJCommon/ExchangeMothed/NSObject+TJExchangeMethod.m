//
//  NSObject+TJExchangeMethod.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "NSObject+TJExchangeMethod.h"
#import <objc/runtime.h>
#import "TJCommons_define.h"

@implementation NSObject (TJExchangeMethod)

/**
 交换两个对象方法的实现
 
 @param replacedClass 被替换方法的类
 @param replacedSel 被替换的方法编号
 @param replaceSel 用于替换的方法编号
 */
+ (void)TJ_exchangeMethodWithReplacedClass:(Class)replacedClass replacedSel:(SEL)replacedSel replaceSel:(SEL)replaceSel {
    if (!replacedClass) {
        NSLog(@"交换对象方法 error 对象类型");
        return;
    }
    if (!replacedSel) {
        NSLog(@"交换对象方法 error 原始方法");
        return;
    }
    if (!replaceSel) {
        NSLog(@"交换对象方法 error 替换方法");
        return;
    }
    
    Method replacedMethod = class_getInstanceMethod(replacedClass, replacedSel);
    Method replaceMethod = class_getInstanceMethod(replacedClass, replaceSel);
    
    //加一层保护措施，如果添加成功，则表示该方法不存在于本类，而是存在于父类中，不能交换父类的方法,否则父类的对象调用该方法会crash；添加失败则表示本类存在该方法
    BOOL addMethod = class_addMethod(replacedClass, replacedSel, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod));
    if (addMethod){
        //添加方法实现IMP成功后，再将原有的实现替换到replaceMethod方法上，从而实现方法的交换，并且未影响到父类方法的实现
        class_replaceMethod(replacedClass, replaceSel, method_getImplementation(replaceMethod), method_getTypeEncoding(replacedMethod));
    }else{
        //添加失败，调用交互两个方法的实现
        method_exchangeImplementations(replacedMethod, replaceMethod);
    }
}
+ (void)TJ_exchangeMethodWithReplacedSel:(SEL)replacedSel replaceSel:(SEL)replaceSel {
    [self TJ_exchangeMethodWithReplacedClass:[self class] replacedSel:replacedSel replaceSel:replaceSel];
}
//交换类方法
+ (void)TJ_exchangeClassMethodWithReplacedClass:(Class)replacedClass replacedSel:(SEL)replacedSel replaceSel:(SEL)replaceSel {
    if (!replacedClass) {
        NSLog(@"交换类方法 error 对象类型");
        return;
    }
    if (!replacedSel) {
        NSLog(@"交换类方法 error 原始方法");
        return;
    }
    if (!replaceSel) {
        NSLog(@"交换类方法 error 替换方法");
        return;
    }
    Method replacedMethod = class_getClassMethod(replacedClass, replacedSel);
    Method replaceMethod = class_getClassMethod(replacedClass, replaceSel);
    method_exchangeImplementations(replacedMethod, replaceMethod);
}

/**
 *  获取堆栈主要崩溃精简化的信息<根据正则表达式匹配出来>
 *
 *  @param callStackSymbols 堆栈主要崩溃信息
 *
 *  @return 堆栈主要崩溃精简化的信息
 */

+ (NSString *)getMainCallStackSymbolMessageWithCallStackSymbols:(NSArray<NSString *> *)callStackSymbols {
    //mainCallStackSymbolMsg的格式为   +[类名 方法名]  或者 -[类名 方法名]
    __block NSString *mainCallStackSymbolMsg = nil;
    //匹配出来的格式为 +[类名 方法名]  或者 -[类名 方法名]
    NSString *regularExpStr = @"[-\\+]\\[.+\\]";
    NSRegularExpression *regularExp = [[NSRegularExpression alloc] initWithPattern:regularExpStr options:NSRegularExpressionCaseInsensitive error:nil];
    for (int index = 2; index < callStackSymbols.count; index++) {
        NSString *callStackSymbol = callStackSymbols[index];
        [regularExp enumerateMatchesInString:callStackSymbol options:NSMatchingReportProgress range:NSMakeRange(0, callStackSymbol.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            if (result) {
                NSString* tempCallStackSymbolMsg = [callStackSymbol substringWithRange:result.range];
                //get className
                NSString *className = [tempCallStackSymbolMsg componentsSeparatedByString:@" "].firstObject;
                className = [className componentsSeparatedByString:@"["].lastObject;
                NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(className)];
                //filter category and system class
                if (![className hasSuffix:@")"] && bundle == [NSBundle mainBundle]) {
                    mainCallStackSymbolMsg = tempCallStackSymbolMsg;
                }
                *stop = YES;
            }
        }];
        if (mainCallStackSymbolMsg.length) {
            break;
        }
    }
    return mainCallStackSymbolMsg;
}

/**
 *  提示崩溃的信息(控制台输出、通知)
 *
 *  @param exception   捕获到的异常
 */
+ (void)TJ_ErrorException:(NSException *)exception {
    //堆栈数据
    NSArray *callStackSymbolsArr = [NSThread callStackSymbols];
    //获取在哪个类的哪个方法中实例化的数组  字符串格式 -[类名 方法名]  或者 +[类名 方法名]
    NSString *mainCallStackSymbolMsg = [self getMainCallStackSymbolMessageWithCallStackSymbols:callStackSymbolsArr];
    if (mainCallStackSymbolMsg == nil) {
        mainCallStackSymbolMsg = @"TJCommons_崩溃== carchClass search error";
    }
    NSString *logErrorMessage = [NSString stringWithFormat:@"TJCommons_崩溃===== className:%@ name:%@ reason:%@",mainCallStackSymbolMsg,exception.name, exception.reason];
    NSLog(@"%@",logErrorMessage);
    [[NSNotificationCenter defaultCenter] postNotificationName:kTJCrashNotification object:nil userInfo:@{
        @"errorName":exception.name,
        @"errorReason":exception.reason,
        @"className":mainCallStackSymbolMsg,
        @"classMethod":@"",
    }];
}


@end
