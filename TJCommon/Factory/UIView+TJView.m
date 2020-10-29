//
//  UIView+TJView.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "UIView+TJView.h"

@implementation UIView (TJView)

#pragma mark new view
+ (UIView *)TJ_viewWithBgColor:(nullable UIColor *)bgColor {
    return [self TJ_viewWithBgColor:bgColor cornerRadius:0 borderColor:nil borderWidth:0];
}
+ (UIView *)TJ_viewWithBgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius {
    return [self TJ_viewWithBgColor:bgColor cornerRadius:cornerRadius borderColor:nil borderWidth:0];
}
+ (UIView *)TJ_viewWithBorderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    return [self TJ_viewWithBgColor:nil cornerRadius:0 borderColor:borderColor borderWidth:borderWidth];
}
+ (UIView *)TJ_viewWithBgColor:(nullable UIColor *)bgColor cornerRadius:(CGFloat)cornerRadius borderColor:(nullable UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    UIView *view = [UIView new];
    if (bgColor) {
        view.backgroundColor = bgColor;
    }
    if (cornerRadius > 0) {
        view.layer.cornerRadius = cornerRadius;
    }
    if (borderColor) {
        view.layer.borderColor = [borderColor CGColor];
    }
    if (borderWidth > 0) {
        view.layer.borderWidth = borderWidth;
    }
    return view;
}
#pragma mark xib加载view
+ (instancetype)TJ_XibName:(NSString *)name {
    return [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject];
}
+ (instancetype)TJ_BundleName:(NSString *)bundleName xibName:(NSString *)name {
    //拿到自己创建的bundle
    NSBundle *bundle = [NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle",bundleName]]];
    //加载view
    return [[bundle loadNibNamed:name owner:nil options:nil] lastObject];
}
#pragma mark view 渐变色
- (void)TJ_GradientsStartColor:(UIColor *)startColor end:(UIColor *)endColor {
    //渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    [self TJ_GradientsStartColor:startColor endColor:endColor startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 1)];
}
- (void)TJ_GradientsStartColor:(UIColor *)startColor endColor:(UIColor *)endColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    //  创建 CAGradientLayer 对象
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    //  设置 gradientLayer 的 Frame
    gradientLayer.frame = self.bounds;
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(id)startColor.CGColor,
                             (id)endColor.CGColor];
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    //  添加渐变色到创建的 UIView 上去
    [self.layer addSublayer:gradientLayer];
}


@end
