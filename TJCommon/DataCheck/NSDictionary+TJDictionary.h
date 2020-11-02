//
//  NSDictionary+TJDictionary.h
//  TJCommons
//
//  Created by mac on 2020/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (TJDictionary)

#pragma mark - 通过key获取所有的value
+ (NSArray *)TJ_getAllValueForKey:(NSString *)key data:(id)data;
#pragma mark - 通过key修改value
+ (id )TJ_ModifyValueForKey:(NSString *)key value:(id)value data:(id)data;
#pragma mark - 通过key value 修改 value
+ (id )TJ_ModifyValueForKey:(NSString *)key value:(id)value mValue:(id)mValue data:(id)data;
#pragma mark - 通过key value 修改成另外的 key value
+ (id )TJ_ModifyValueForKey:(NSString *)key value:(id)value mKey:(NSString *)mKey mValue:(id)mValue data:(id)data;

@end

NS_ASSUME_NONNULL_END
