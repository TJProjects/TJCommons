//
//  UILabel+TJLabel.h
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (TJLabel)

#pragma mark new label
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont numberOfLines:(NSInteger)numberOfLines;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;

+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius numberOfLines:(NSInteger)numberOfLine;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLine;

+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth numberOfLines:(NSInteger)numberOfLine;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLine;

+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth textAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth numberOfLines:(NSInteger)numberOfLines;
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;

@end

NS_ASSUME_NONNULL_END
