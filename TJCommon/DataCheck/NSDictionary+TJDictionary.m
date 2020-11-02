//
//  NSDictionary+TJDictionary.m
//  TJCommons
//
//  Created by mac on 2020/11/2.
//

#import "NSDictionary+TJDictionary.h"

@implementation NSDictionary (TJDictionary)

#pragma mark - 通过key获取value
+ (NSArray *)TJ_getAllValueForKey:(NSString *)key data:(id)data {
    NSMutableArray *result = [NSMutableArray array];
    if ([data isKindOfClass:[NSDictionary class]]) {
        if ([[data allKeys] containsObject:key]) {
            [result addObject:[data objectForKey:key]];
        }
        for (id value in [data allValues]) {
            [result addObjectsFromArray:[self TJ_getAllValueForKey:key data:value]];
        }
    } else if ([data isKindOfClass:[NSArray class]]) {
        for (id value in data) {
            [result addObjectsFromArray:[self TJ_getAllValueForKey:key data:value]];
        }
    }
    return result;
}
#pragma mark - 通过key修改value
+ (id )TJ_ModifyValueForKey:(NSString *)key value:(id)value data:(id)data {
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:data];
        for (id keys in [data allKeys]) {
            if ([keys isEqual:key]) {
                [dict setValue:value forKey:key];
            } else {
                [dict setValue:[self TJ_ModifyValueForKey:key value:value data:[data objectForKey:keys]] forKey:keys];
            }
        }
        return  dict;
    } else if ([data isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:data];
        NSInteger num = array.count;
        for (NSInteger i = 0; i < num; i++) {
            id values = [data objectAtIndex:i];
            [array removeObjectAtIndex:i];
            [array insertObject:[self TJ_ModifyValueForKey:key value:value data:values] atIndex:i];
        }
        return array;
    }
    return data;
}
#pragma mark - 通过key value 修改 value
+ (id )TJ_ModifyValueForKey:(NSString *)key value:(id)value mValue:(id)mValue data:(id)data {
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:data];
        for (id keys in [data allKeys]) {
            if ([keys isEqual:key] && [[data objectForKey:key] isEqual:value]) {
                [dict setValue:mValue forKey:key];
            } else {
                [dict setValue:[self TJ_ModifyValueForKey:key value:value mValue:mValue data:[data objectForKey:keys]] forKey:keys];
            }
        }
        return  dict;
    } else if ([data isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:data];
        NSInteger num = array.count;
        for (NSInteger i = 0; i < num; i++) {
            id values = [data objectAtIndex:i];
            [array removeObjectAtIndex:i];
            [array insertObject:[self TJ_ModifyValueForKey:key value:value mValue:mValue data:values] atIndex:i];
        }
        return array;
    }
    return data;
}
#pragma mark - 通过key value 修改成另外的 key value
+ (id )TJ_ModifyValueForKey:(NSString *)key value:(id)value mKey:(NSString *)mKey mValue:(id)mValue data:(id)data {
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:data];
        for (id keys in [data allKeys]) {
            if ([keys isEqual:key] && [[data objectForKey:key] isEqual:value]) {
                [dict removeObjectForKey:key];
                [dict setValue:mValue forKey:mKey];
            } else {
                [dict setValue:[self TJ_ModifyValueForKey:key value:value mKey:mKey mValue:mValue data:[data objectForKey:keys]] forKey:keys];
            }
        }
        return  dict;
    } else if ([data isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:data];
        NSInteger num = array.count;
        for (NSInteger i = 0; i < num; i++) {
            id values = [data objectAtIndex:i];
            [array removeObjectAtIndex:i];
            [array insertObject:[self TJ_ModifyValueForKey:key value:value mKey:mKey mValue:mValue data:values] atIndex:i];
        }
        return array;
    }
    return data;
}
#pragma mark - 通过数组的下标 和值  修改成另外的值
+ (id )TJ_ModifyValueForIndex:(NSInteger)index value:(id)value mValue:(id)mValue data:(id)data {
    if ([data isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:data];
        for (id keys in [data allKeys]) {
            [dict setValue:[self TJ_ModifyValueForIndex:index value:value mValue:mValue data:[data objectForKey:keys]] forKey:keys];
        }
        return  dict;
    } else if ([data isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:data];
        NSInteger num = array.count;
        for (NSInteger i = 0; i < num; i++) {
            id values = [data objectAtIndex:i];
            [array removeObjectAtIndex:i];
            if (i == index && [values isEqual:value]) {
                [array insertObject:mValue atIndex:i];
            } else {
                [array insertObject:[self TJ_ModifyValueForIndex:index value:value mValue:mValue data:values] atIndex:i];
            }
        }
        return array;
    }
    return data;
}

@end
