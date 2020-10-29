//
//  NSString+TJString.m
//  TJCommons
//
//  Created by mac on 2020/10/28.
//

#import "NSString+TJString.h"

@implementation NSString (TJString)
#pragma mark - 获取文字高度
+ (CGFloat)TJ_getHeightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width {
    NSDictionary *attrs = @{NSFontAttributeName :font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    // 计算文字占据的宽高
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    return ceilf(size.height);
}
+ (CGFloat)TJ_getHeightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width lineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = lineSpacing;
    NSDictionary *dic = @{ NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle };
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return  ceilf(size.height);
}
#pragma mark - 获取文字宽
+ (CGFloat)TJ_getWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height {
    NSDictionary *attrs = @{NSFontAttributeName:font};
    CGSize maxSize = CGSizeMake(MAXFLOAT, height);
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    // 计算文字占据的宽高
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    return ceilf(size.width);
}


#pragma mark - 判断是否为 数字字母组合
+ (BOOL)TJ_checkPassword:(NSString *)password {
    NSString *pattern = @"^[0-9A-Za-z]{6,18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}
#pragma mark - 判断是否是手机号
+ (BOOL)TJ_checkPhoneNum:(NSString *)phoneNumber {
    //中国电信号段为：133、149、153、173、177。还有180、181、189、199。
    //中国联通号段：130、131、132、145、155、156、166、171、175、176、185、186、166。
    //中国移动号段：134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、172、178、182、183、184、187、188、198。
    NSString *MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|6[6]|7[0-35-9]|8[0-9]|9[89])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:phoneNumber]) {
        return YES;
    } else {
        return NO;
    }
}


#pragma mark - 获取拼接gitString
+ (NSString *)TJ_getUrlWithUrl:(NSString *)url info:(nullable NSDictionary *)info {
    NSString *result = @"";
    result = [result stringByAppendingFormat:@"%@?",url];
    if (info) {
        for (NSString *key in [info allKeys]) {
            result = [result stringByAppendingFormat:@"%@=%@&",key,[info objectForKey:key]];
        }
    }
    result = [result substringToIndex:result.length-1];
    return result;
}


@end
