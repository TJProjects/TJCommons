//
//  UILabel+TJLabel.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "UILabel+TJLabel.h"

@implementation UILabel (TJLabel)
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:nil cornerRadius:0 borderColor:nil borderWidth:0 textAlignment:0 numberOfLines:1];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont textAlignment:(NSTextAlignment)textAlignment {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:nil cornerRadius:0 borderColor:nil borderWidth:0 textAlignment:textAlignment numberOfLines:1];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont numberOfLines:(NSInteger)numberOfLines {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:nil cornerRadius:0 borderColor:nil borderWidth:0 textAlignment:0 numberOfLines:numberOfLines];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:nil cornerRadius:0 borderColor:nil borderWidth:0 textAlignment:textAlignment numberOfLines:numberOfLines];
}

+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:bgColor cornerRadius:cornerRadius borderColor:nil borderWidth:0 textAlignment:0 numberOfLines:1];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius textAlignment:(NSTextAlignment)textAlignment {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:bgColor cornerRadius:cornerRadius borderColor:nil borderWidth:0 textAlignment:textAlignment numberOfLines:1];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius numberOfLines:(NSInteger)numberOfLine {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:bgColor cornerRadius:cornerRadius borderColor:nil borderWidth:0 textAlignment:0 numberOfLines:numberOfLine];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLine {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:bgColor cornerRadius:cornerRadius borderColor:nil borderWidth:0 textAlignment:textAlignment numberOfLines:numberOfLine];
}

+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:nil cornerRadius:0 borderColor:borderColor borderWidth:borderWidth textAlignment:0 numberOfLines:1];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth textAlignment:(NSTextAlignment)textAlignment {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:nil cornerRadius:0 borderColor:borderColor borderWidth:borderWidth textAlignment:textAlignment numberOfLines:1];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth numberOfLines:(NSInteger)numberOfLine {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:nil cornerRadius:0 borderColor:borderColor borderWidth:borderWidth textAlignment:0 numberOfLines:numberOfLine];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLine {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:nil cornerRadius:0 borderColor:borderColor borderWidth:borderWidth textAlignment:textAlignment numberOfLines:numberOfLine];
}

+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:bgColor cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth textAlignment:0 numberOfLines:1];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth textAlignment:(NSTextAlignment)textAlignment {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:bgColor cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth textAlignment:textAlignment numberOfLines:1];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth numberOfLines:(NSInteger)numberOfLines {
    return [self TJ_labelWithTitle:title titleColor:titleColor titleFont:titleFont bgColor:bgColor cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth textAlignment:0 numberOfLines:numberOfLines];
}
+ (UILabel *)TJ_labelWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:(nullable UIFont *)titleFont bgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [UILabel new];
    if (title) {
        label.text = title;
    }
    if (titleColor) {
        label.textColor = titleColor;
    }
    if (titleFont) {
        label.font = titleFont;
    }
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    if (cornerRadius > 0) {
        label.layer.cornerRadius = cornerRadius;
    }
    if (borderColor) {
        label.layer.borderColor = [borderColor CGColor];
    }
    if (borderWidth > 0) {
        label.layer.borderWidth = borderWidth;
    }
    if (textAlignment) {
        label.textAlignment = textAlignment;
    }
    label.numberOfLines = numberOfLines;
    return label;
}

@end
