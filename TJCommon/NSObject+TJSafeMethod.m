//
//  NSObject+TJSafeMethod.m
//  TJCommons
//
//  Created by mac on 2020/10/28.
//

#import "NSObject+TJSafeMethod.h"
#import "NSObject+TJExchangeMethod.h"
#import <objc/runtime.h>

@implementation NSObject (TJSafeMethod)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject TJ_exchangeMethodWithReplacedClass:[NSObject class] replacedSel:@selector(forwardingTargetForSelector:) replaceSel:@selector(my_forwardingTargetForSelector:)];
        // log info analyz
        [NSObject TJ_exchangeMethodWithReplacedClass:[NSObject class] replacedSel:@selector(description) replaceSel:@selector(TJ_description)];
        [NSObject TJ_exchangeMethodWithReplacedClass:[NSObject class] replacedSel:@selector(descriptionWithLocale:) replaceSel:@selector(TJ_descriptionWithLocale:)];
    });
}
- (id)my_forwardingTargetForSelector:(SEL)aSelector {
    
    // 获取NSObject的消息转发方法
    SEL sel = NSSelectorFromString(@"forwardingTargetForSelector:");
    Method method = class_getInstanceMethod(NSClassFromString(@"NSObject"), sel);
    // 获取当前类的消息转发方法
    Method _m = class_getInstanceMethod([self class],sel);
    
    // 类本身有没有实现消息转发流程
    BOOL transmit = method_getImplementation(_m) == method_getImplementation(method);
    
    // 有木有实现下一步消息转发流程
    if (transmit) {
        // 判断有没有实现第三步消息转发
        SEL sel1 = NSSelectorFromString(@"methodSignatureForSelector:");
        Method method1 = class_getInstanceMethod(NSClassFromString(@"NSObject"), sel1);
        
        Method _m1 = class_getInstanceMethod([self class], sel1);
        transmit = method_getImplementation(_m1) == method_getImplementation(method1);
        
        if (transmit) {
            // 创建一个新类
            NSString *errClassName = NSStringFromClass([self class]);
            NSString *errSel   = NSStringFromSelector(aSelector);
            NSLog(@"TJCommons_方法未实现崩溃 == className:%@ methodName:%@", errClassName, errSel);
            
            NSString *className = @"CrachClass";
            Class cls = NSClassFromString(className);
            /// 如果类不存在 动态创建一个类
            if (!cls) {
                Class superCls = [NSObject class];
                cls = objc_allocateClassPair(superCls, className.UTF8String, 0);
                /// 给类添加方法
                class_addMethod(cls, aSelector, (IMP)Crash, "@@:@");
                objc_registerClassPair(cls);
            }
            /// 如果类没有对应的方法，则动态添加一个
            if (!class_getInstanceMethod(NSClassFromString(className), aSelector)) {
                class_addMethod(cls, aSelector, (IMP)Crash, "@@:@");
            }
            /// 把消息转发到当前动态生成类的实例上
            return [[NSClassFromString(className) alloc] init];
        }
    }
    return [self my_forwardingTargetForSelector:aSelector];
}
static int Crash(id slf, SEL selector) {
    return 0;
}
#pragma mark - 文字信息解析
- (NSString *)TJ_description{
    NSString *description = [self TJ_description];
    description = [NSString stringWithCString:[description cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return description;
}
- (NSString *)TJ_descriptionWithLocale:(id)local{
    return [self description];
}

@end
