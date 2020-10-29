//
//  UIButton+TJClickInterval.m
//  TJCommons
//
//  Created by mac on 2020/10/29.
//

#import "UIButton+TJClickInterval.h"
#import <objc/runtime.h>

static const char *UIButton_tj_ClickInterval = "UIButton_TJ_tj_ClickInterval";
static const char *UIButton_tj_ClickTime = "UIButton_TJ_tj_ClickTime";

@implementation UIButton (TJClickInterval)

- (NSTimeInterval )tj_ClickInterval{
    return [objc_getAssociatedObject(self, UIButton_tj_ClickInterval) doubleValue];
}

- (void)setTj_ClickInterval:(NSTimeInterval)tj_ClickInterval{
    objc_setAssociatedObject(self, UIButton_tj_ClickInterval, @(tj_ClickInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval )tj_ClickTime{
    return [objc_getAssociatedObject(self, UIButton_tj_ClickTime) doubleValue];
}

- (void)setTj_ClickTime:(NSTimeInterval)tj_ClickTime{
    objc_setAssociatedObject(self, UIButton_tj_ClickTime, @(tj_ClickTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //获取这两个方法
        Method systemMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
        SEL sysSEL = @selector(sendAction:to:forEvent:);
        
        Method myMethod = class_getInstanceMethod(self, @selector(tj_sendAction:to:forEvent:));
        SEL mySEL = @selector(tj_sendAction:to:forEvent:);
        
        //添加方法进去
        BOOL didAddMethod = class_addMethod(self, sysSEL, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
        //如果方法已经存在 交换两个方法
        if (didAddMethod) {
            class_replaceMethod(self, mySEL, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        }else{
            method_exchangeImplementations(systemMethod, myMethod);
        }
        /*-----以上主要是实现两个方法的互换,load是gcd的只shareinstance，保证执行一次-------*/
    });
}
- (void)tj_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    //判断时间差
    if (NSDate.date.timeIntervalSince1970 - self.tj_ClickTime < self.tj_ClickInterval) {
        return;
    }
    //记录时间
    if (self.tj_ClickInterval > 0) {
        self.tj_ClickTime = NSDate.date.timeIntervalSince1970;
    }
    //执行点击事件
    [self tj_sendAction:action to:target forEvent:event];
}



@end
