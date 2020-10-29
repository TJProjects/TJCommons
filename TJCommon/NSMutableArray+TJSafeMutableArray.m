//
//  NSMutableArray+TJSafeMutableArray.m
//  TJCommons
//
//  Created by mac on 2020/10/28.
//

#import "NSMutableArray+TJSafeMutableArray.h"
#import "NSObject+TJExchangeMethod.h"

@implementation NSMutableArray (TJSafeMutableArray)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class _NSArrayM = NSClassFromString(@"__NSArrayM");
        // objectsAtIndexes:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayM replacedSel:@selector(objectAtIndex:) replaceSel:@selector(_NSArrayM_objectAtIndex:)];
        //objectAtIndexedSubscript:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayM replacedSel:@selector(objectAtIndexedSubscript:) replaceSel:@selector(_NSArrayM_objectAtIndexedSubscript:)];
        //setObject:atIndexedSubscript:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayM replacedSel:@selector(setObject:atIndexedSubscript:) replaceSel:@selector(_NSArrayM_setObject:atIndexedSubscript:)];
        //removeObjectAtIndex:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayM replacedSel:@selector(removeObjectAtIndex:) replaceSel:@selector(_NSArrayM_removeObjectAtIndex:)];
        //insertObject:atIndex:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayM replacedSel:@selector(insertObject:atIndex:) replaceSel:@selector(_NSArrayM_insertObject:atIndex:)];
        //getObjects:range:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayM replacedSel:@selector(getObjects:range:) replaceSel:@selector(_NSArrayM_getObjects:range:)];
        
    });
}
#pragma mark - objectAtIndex:
- (id)_NSArrayM_objectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self _NSArrayM_objectAtIndex:index];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        return object;
    }
}
#pragma mark - objectAtIndexedSubscript:
- (id)_NSArrayM_objectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self _NSArrayM_objectAtIndexedSubscript:index];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        return object;
    }
}
#pragma mark -  array set object at index  (get object from array)
- (void)_NSArrayM_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    @try {
        [self _NSArrayM_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    }
    @finally {
        
    }
}
#pragma mark - removeObjectAtIndex:
- (void)_NSArrayM_removeObjectAtIndex:(NSUInteger)index {
    @try {
        [self _NSArrayM_removeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    }
    @finally {
        
    }
}
#pragma mark - insertObject:atIndex: (set方法)
- (void)_NSArrayM_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self _NSArrayM_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    }
    @finally {
        
    }
}
#pragma mark - getObjects:range:
- (void)_NSArrayM_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self _NSArrayM_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        
    }
}
@end
