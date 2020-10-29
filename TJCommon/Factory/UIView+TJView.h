//
//  UIView+TJView.h
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TJView)

#pragma mark new view 
+ (UIView *)TJ_viewWithBgColor:(nullable UIColor *)bgColor;
+ (UIView *)TJ_viewWithBgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius;
+ (UIView *)TJ_viewWithBorderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
+ (UIView *)TJ_viewWithBgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
#pragma mark xib加载view
+ (instancetype)TJ_XibName:(NSString *)name;
+ (instancetype)TJ_BundleName:(NSString *)bundleName xibName:(NSString *)name;
#pragma mark view 渐变色
- (void)TJ_GradientsStartColor:(UIColor *)startColor end:(UIColor *)endColor;
- (void)TJ_GradientsStartColor:(UIColor *)startColor endColor:(UIColor *)endColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
