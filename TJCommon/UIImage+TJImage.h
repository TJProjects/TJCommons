//
//  UIImage+TJImage.h
//  TJCommons
//
//  Created by mac on 2020/10/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (TJImage)

#pragma mark 压缩图片
//综合压缩图片到指定大小
+ (UIImage *)TJ_compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;
//压缩图片质量到指定大小
+ (UIImage *)TJ_compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength;
//压缩图片宽高到指定大小
+ (UIImage *)TJ_compressImageSize:(UIImage *)image toByte:(NSUInteger)maxLength;

#pragma mark 截取view生成image
+ (UIImage *)TJ_getImageFromView:(UIView *)view;

#pragma mark 图片合成
//图片加水印 在指定图片上添加另一张图片
+ (UIImage *)TJ_composeImageWithImage:(UIImage *)image waterImage:(UIImage *)waterImage waterImageRect:(CGRect)imageRect;
//图片加文字 把指定文本合成到图片上
+ (UIImage *)TJ_composeImageWithImage:(UIImage *)image text:(NSString *)text textPoint:(CGPoint)point attributedString:(NSDictionary * )attributed;
#pragma mark 图片剪裁
+ (UIImage *)TJ_cutImageWithImage:(UIImage *)image rect:(CGRect)rect;
#pragma mark 生成二维码
+ (UIImage *)TJ_QRImageWith:(NSString *)str size:(CGSize)size;
+ (UIImage *)TJ_QRImageWith:(NSString *)str size:(CGSize)size centerImage:(UIImage *)centerImage;
+ (CIImage *)TJ_newQRImageWithString:(NSString *)str;
+ (UIImage *)TJ_changeQRImageWith:(CIImage *)image size:(CGSize)size;



@end

NS_ASSUME_NONNULL_END
