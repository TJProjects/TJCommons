//
//  TJSafeMethod.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "TJSafeMethod.h"

@implementation TJSafeMethod

#pragma mark 判断是否为空值
BOOL kIsEmptyValue(id value) {
    if (value == nil || value == NULL) {
        return YES;
    } else if ([value isKindOfClass:[NSNull class]] || [value isMemberOfClass:[NSNull class]]) {
        return YES;
    } else if ([value isKindOfClass:[NSString class]] || [value isMemberOfClass:[NSString class]]) {
        if ([value isEqualToString:@"<null>"] || [value isEqualToString:@"(null)"] || [value isEqualToString:@"null"]) {
            return YES;
        }
    }
    return NO;
}
#pragma mark 过滤value中的空值 强制转为字符串
NSString *kSafeStringValue(id value) {
    if (kIsEmptyValue(value)) {
        return @"";
    } else if ([value isKindOfClass:[NSNumber class]] || [value isMemberOfClass:[NSNumber class]]) {
        return [value description];
    }
    return [NSString stringWithFormat:@"%@",value];
}
#pragma mark 过滤value中的空值、判断类型 返回字典类型
NSDictionary *kSafeDictValue(id value) {
    if (kIsEmptyValue(value)) {
        return [NSDictionary dictionary];
    } else if ([value isKindOfClass:[NSDictionary class]] || [value isMemberOfClass:[NSDictionary class]]) {
        return value;
    }
    return [NSDictionary dictionary];
}
#pragma mark 过滤value中的空值、判断类型 返回数组类型
NSArray *kSafeArrayValue(id value) {
    if (kIsEmptyValue(value)) {
        return [NSArray array];
    } else if ([value isKindOfClass:[NSArray class]] || [value isMemberOfClass:[NSArray class]]) {
        return value;
    }
    return [NSArray array];
}
#pragma mark 过滤value中的空值、判断类型 其他类型转为String
id kSafeValue(id value) {
    if (kIsEmptyValue(value)) {
        return @"";
    } else if ([value isKindOfClass:[NSNumber class]] || [value isMemberOfClass:[NSNumber class]]) {
        return [value description];
    } else if ([value isKindOfClass:[NSDictionary class]] || [value isMemberOfClass:[NSDictionary class]]) {
        return value;
    } else if ([value isKindOfClass:[NSArray class]] || [value isMemberOfClass:[NSArray class]]) {
        return value;
    }  else if ([value isKindOfClass:[NSString class]] || [value isMemberOfClass:[NSString class]]) {
        return value;
    }
    return [NSString stringWithFormat:@"%@",value];
}
#pragma mark 校验时间戳，返回正常时间戳 单位秒
NSString *kSafeTimeStamp(NSString * timeStamp) {
    NSString *time = [[timeStamp componentsSeparatedByString:@"."] firstObject];
    if (time.length == 10) {
        return timeStamp;
    } else if (time.length > 10) {
        NSInteger num = time.length - 10;
        double value = [timeStamp doubleValue];
        for (NSInteger i = 0; i < num; i++) {
            value = value*0.1;
        }
        return [NSString stringWithFormat:@"%lf",value];
    } else if (time.length < 10) {
        NSInteger num = 10 - time.length;
        double value = [timeStamp doubleValue];
        for (NSInteger i = 0; i < num; i++) {
            value = value*10;
        }
        return [NSString stringWithFormat:@"%lf",value];
    }
    return @"";
}

@end
