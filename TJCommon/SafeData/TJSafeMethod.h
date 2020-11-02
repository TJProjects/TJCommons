//
//  TJSafeMethod.h
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJSafeMethod : NSObject

#pragma mark 判断是否为空值
BOOL kIsEmptyValue(id value);
#pragma mark 过滤value中的空值 强制转为字符串
NSString *kSafeStringValue(id value);
#pragma mark 过滤value中的空值、判断类型 返回字典类型
NSDictionary *kSafeDictValue(id value);
#pragma mark 过滤value中的空值、判断类型 返回数组类型
NSArray *kSafeArrayValue(id value);
#pragma mark 过滤value中的空值、判断类型 其他类型转为String
id kSafeValue(id value);

#pragma mark 校验时间戳，返回正常时间戳 单位秒
NSString *kSafeTimeStamp(NSString * timeStamp);


@end

NS_ASSUME_NONNULL_END
