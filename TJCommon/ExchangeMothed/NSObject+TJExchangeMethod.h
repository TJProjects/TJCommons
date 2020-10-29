//
//  NSObject+TJExchangeMethod.h
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TJExchangeMethod)

/**
 交换两个对象方法的实现
 
 @param replacedClass 被替换方法的类
 @param replacedSel 被替换的方法编号
 @param replaceSel 用于替换的方法编号
 */
+ (void)TJ_exchangeMethodWithReplacedClass:(Class)replacedClass replacedSel:(SEL)replacedSel replaceSel:(SEL)replaceSel;
//交换类方法
+ (void)TJ_exchangeClassMethodWithReplacedClass:(Class)replacedClass replacedSel:(SEL)replacedSel replaceSel:(SEL)replaceSel;

/**
 *  提示崩溃的信息(控制台输出、通知)
 *
 *  @param exception   捕获到的异常
 */
+ (void)TJ_ErrorException:(NSException *)exception;


@end

NS_ASSUME_NONNULL_END
