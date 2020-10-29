//
//  NSString+TJString.h
//  TJCommons
//
//  Created by mac on 2020/10/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TJString)
#pragma mark - 获取文字高度
+ (CGFloat)TJ_getHeightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;
+ (CGFloat)TJ_getHeightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
#pragma mark - 获取文字宽
+ (CGFloat)TJ_getWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height;

#pragma mark - 判断是否为 数字字母组合
+ (BOOL)TJ_checkPassword:(NSString *)password;
#pragma mark - 判断是否是手机号
+ (BOOL)TJ_checkPhoneNum:(NSString *)phoneNumber;

#pragma mark - 获取拼接gitString
+ (NSString *)TJ_getUrlWithUrl:(NSString *)url info:(nullable NSDictionary *)info;

@end

NS_ASSUME_NONNULL_END
