//
//  TJCommon.m
//  TJCommons
//
//  Created by mac on 2020/10/29.
//

#import "TJCommon.h"
#import "NSArray+TJSafeArray.h"
#import "NSMutableArray+TJSafeMutableArray.h"
#import "NSDictionary+TJSafeDictionary.h"
#import "NSMutableDictionary+TJSafeMutableDictionary.h"
#import "NSObject+TJSafeMethod.h"

@implementation TJCommon

+ (void)avoidALLCrashExchangeMothed {
    [NSArray avoidCrashExchangeMethod];
    [NSMutableArray avoidCrashExchangeMethod];
    [NSDictionary avoidCrashExchangeMethod];
    [NSMutableDictionary avoidCrashExchangeMethod];
    [NSObject avoidCrashExchangeMethod];
}

@end
