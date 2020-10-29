//
//  NSObject+TJSafeMethod.h
//  TJCommons
//
//  Created by mac on 2020/10/28.
//

#import <Foundation/Foundation.h>
#import "TJAvoidCrashProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TJSafeMethod) <TJAvoidCrashProtocol>

@end

NS_ASSUME_NONNULL_END
