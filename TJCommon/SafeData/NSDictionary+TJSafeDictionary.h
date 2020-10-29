//
//  NSDictionary+TJSafeDictionary.h
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import <Foundation/Foundation.h>
#import "TJAvoidCrashProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (TJSafeDictionary) <TJAvoidCrashProtocol>

@end

NS_ASSUME_NONNULL_END
