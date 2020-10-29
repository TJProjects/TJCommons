//
//  UIButton+TJButton.h
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TJButton)
#pragma mark - new button  Title
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont;
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgImage:(nullable UIImage *)bgImage;
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius;
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
#pragma mark - new button  Image
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image;
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image bgImage:(nullable UIImage *)bgImage;
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius;
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
#pragma mark - new button All info
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont image:(nullable UIImage *)image bgImage:(nullable UIImage *)bgImage bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
