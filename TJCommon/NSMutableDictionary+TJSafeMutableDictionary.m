//
//  NSMutableDictionary+TJSafeMutableDictionary.m
//  TJCommons
//
//  Created by mac on 2020/10/28.
//

#import "NSMutableDictionary+TJSafeMutableDictionary.h"
#import "NSObject+TJExchangeMethod.h"

@implementation NSMutableDictionary (TJSafeMutableDictionary)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class _NSDictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        //setObject:forKey:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSDictionaryM replacedSel:@selector(setObject:forKey:) replaceSel:@selector(_NSDictionaryM_setObject:forKey:)];
        //setObject:forKeyedSubscript:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSDictionaryM replacedSel:@selector(setObject:forKeyedSubscript:) replaceSel:@selector(_NSDictionaryM_setObject:forKeyedSubscript:)];
        //removeObjectForKey:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSDictionaryM replacedSel:@selector(removeObjectForKey:) replaceSel:@selector(_NSDictionaryM_removeObjectForKey:)];
    });
}
#pragma mark - setObject:forKey:
- (void)_NSDictionaryM_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    @try {
        [self _NSDictionaryM_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    }
    @finally {
        
    }
}
#pragma mark - setObject:forKeyedSubscript:
- (void)_NSDictionaryM_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    @try {
        [self _NSDictionaryM_setObject:obj forKeyedSubscript:key];
    }
    @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    }
    @finally {
        
    }
}
#pragma mark - removeObjectForKey:
- (void)_NSDictionaryM_removeObjectForKey:(id)aKey {
    @try {
        [self _NSDictionaryM_removeObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    }
    @finally {
        
    }
}

@end
