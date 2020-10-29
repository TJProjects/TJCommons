//
//  UIButton+TJButton.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "UIButton+TJButton.h"

@implementation UIButton (TJButton)

#pragma mark - new button  Title
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont {
    return [self TJ_buttonWithTitle:title titleColor:titleColor titleFont:titleFont image:nil bgImage:nil bgColor:nil cornerRadius:0 borderColor:nil borderWidth:0];
}
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgImage:(nullable UIImage *)bgImage {
    return [self TJ_buttonWithTitle:title titleColor:titleColor titleFont:titleFont image:nil bgImage:bgImage bgColor:nil cornerRadius:0 borderColor:nil borderWidth:0];
}
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius {
    return [self TJ_buttonWithTitle:title titleColor:titleColor titleFont:titleFont image:nil bgImage:nil bgColor:bgColor cornerRadius:cornerRadius borderColor:nil borderWidth:0];
}
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    return [self TJ_buttonWithTitle:title titleColor:titleColor titleFont:titleFont image:nil bgImage:nil bgColor:nil cornerRadius:0 borderColor:borderColor borderWidth:borderWidth];
}
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    return [self TJ_buttonWithTitle:title titleColor:titleColor titleFont:titleFont image:nil bgImage:nil bgColor:bgColor cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth];
}
#pragma mark - new button  Image
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image {
    return [self TJ_buttonWithTitle:nil titleColor:nil titleFont:nil image:image bgImage:nil bgColor:nil cornerRadius:0 borderColor:nil borderWidth:0];
}
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image bgImage:(nullable UIImage *)bgImage {
    return [self TJ_buttonWithTitle:nil titleColor:nil titleFont:nil image:image bgImage:bgImage bgColor:nil cornerRadius:0 borderColor:nil borderWidth:0];
}
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius {
    return [self TJ_buttonWithTitle:nil titleColor:nil titleFont:nil image:image bgImage:nil bgColor:bgColor cornerRadius:cornerRadius borderColor:nil borderWidth:0];
}
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    return [self TJ_buttonWithTitle:nil titleColor:nil titleFont:nil image:image bgImage:nil bgColor:nil cornerRadius:0 borderColor:borderColor borderWidth:borderWidth];
}
+ (UIButton *)TJ_buttonWithImage:(nullable UIImage *)image bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    return [self TJ_buttonWithTitle:nil titleColor:nil titleFont:nil image:image bgImage:nil bgColor:bgColor cornerRadius:cornerRadius borderColor:borderColor borderWidth:0];
}
#pragma mark - new button All info
+ (UIButton *)TJ_buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont image:(nullable UIImage *)image bgImage:(nullable UIImage *)bgImage bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (titleFont) {
        button.titleLabel.font = titleFont;
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (bgImage) {
        [button setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    if (bgColor) {
        [button setBackgroundColor:bgColor];
    }
    if (cornerRadius > 0) {
        button.layer.cornerRadius = cornerRadius;
    }
    if (borderColor) {
        button.layer.borderColor = [borderColor CGColor];
    }
    if (borderWidth > 0) {
        button.layer.borderWidth = borderWidth;
    }
    return button;
}


@end
