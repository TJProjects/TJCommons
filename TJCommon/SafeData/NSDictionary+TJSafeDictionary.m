//
//  NSDictionary+TJSafeDictionary.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "NSDictionary+TJSafeDictionary.h"
#import "NSObject+TJExchangeMethod.h"

@implementation NSDictionary (TJSafeDictionary)

+ (void)avoidCrashExchangeMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject TJ_exchangeClassMethodWithReplacedClass:[self class] replacedSel:@selector(dictionaryWithObjects:forKeys:count:) replaceSel:@selector(_NSDictionary_dictionaryWithObjects:forKeys:count:)];
    });
}
//
//+ (void)load {
//    [super load];
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [NSObject TJ_exchangeClassMethodWithReplacedClass:[self class] replacedSel:@selector(dictionaryWithObjects:forKeys:count:) replaceSel:@selector(_NSDictionary_dictionaryWithObjects:forKeys:count:)];
//    });
//}
+ (instancetype)_NSDictionary_dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt {
    id instance = nil;
    @try {
        instance = [self _NSDictionary_dictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self _NSDictionary_dictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}



@end
