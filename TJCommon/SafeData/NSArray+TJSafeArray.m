//
//  NSArray+TJSafeArray.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "NSArray+TJSafeArray.h"
#import "NSObject+TJExchangeMethod.h"

@implementation NSArray (TJSafeArray)

+ (void)avoidCrashExchangeMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class _NSArray = NSClassFromString(@"NSArray");
        Class _NSArrayI = NSClassFromString(@"__NSArrayI");
        Class _NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class _NSArray0 = NSClassFromString(@"__NSArray0");
        
        //替换类方法
        //arrayWithObjects:count:  简写创建方法调用
        [NSObject TJ_exchangeClassMethodWithReplacedClass:_NSArray replacedSel:@selector(arrayWithObjects:count:) replaceSel:@selector(_NSArray_arrayWithObjects:count:)];
        
        //替换对象方法
        // objectsAtIndexes:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArray replacedSel:@selector(objectsAtIndexes:) replaceSel:@selector(_NSArray_objectsAtIndexes:)];
        //objectAtIndex:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayI replacedSel:@selector(objectAtIndex:) replaceSel:@selector(_NSArrayI_objectAtIndex:)];
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSSingleObjectArrayI replacedSel:@selector(objectAtIndex:) replaceSel:@selector(_NSSingleObjectArrayI_objectAtIndex:)];
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArray0 replacedSel:@selector(objectAtIndex:) replaceSel:@selector(_NSArray0_objectAtIndex:)];
        
        //objectAtIndexedSubscript:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayI replacedSel:@selector(objectAtIndexedSubscript:) replaceSel:@selector(_NSArrayI_objectAtIndexedSubscript:)];
        
        //getObjects:range:
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArray replacedSel:@selector(getObjects:range:) replaceSel:@selector(_NSArray_getObjects:range:)];
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayI replacedSel:@selector(getObjects:range:) replaceSel:@selector(_NSArrayI_getObjects:range:)];
        [NSObject TJ_exchangeMethodWithReplacedClass:_NSSingleObjectArrayI replacedSel:@selector(getObjects:range:) replaceSel:@selector(_NSSingleObjectArrayI_getObjects:range:)];
        
    });
}


//+ (void)load {
//    [super load];
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        Class _NSArray = NSClassFromString(@"NSArray");
//        Class _NSArrayI = NSClassFromString(@"__NSArrayI");
//        Class _NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
//        Class _NSArray0 = NSClassFromString(@"__NSArray0");
//        
//        //替换类方法
//        //arrayWithObjects:count:  简写创建方法调用
//        [NSObject TJ_exchangeClassMethodWithReplacedClass:_NSArray replacedSel:@selector(arrayWithObjects:count:) replaceSel:@selector(_NSArray_arrayWithObjects:count:)];
//        
//        //替换对象方法
//        // objectsAtIndexes:
//        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArray replacedSel:@selector(objectsAtIndexes:) replaceSel:@selector(_NSArray_objectsAtIndexes:)];
//        //objectAtIndex:
//        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayI replacedSel:@selector(objectAtIndex:) replaceSel:@selector(_NSArrayI_objectAtIndex:)];
//        [NSObject TJ_exchangeMethodWithReplacedClass:_NSSingleObjectArrayI replacedSel:@selector(objectAtIndex:) replaceSel:@selector(_NSSingleObjectArrayI_objectAtIndex:)];
//        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArray0 replacedSel:@selector(objectAtIndex:) replaceSel:@selector(_NSArray0_objectAtIndex:)];
//        
//        //objectAtIndexedSubscript:
//        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayI replacedSel:@selector(objectAtIndexedSubscript:) replaceSel:@selector(_NSArrayI_objectAtIndexedSubscript:)];
//        
//        //getObjects:range:
//        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArray replacedSel:@selector(getObjects:range:) replaceSel:@selector(_NSArray_getObjects:range:)];
//        [NSObject TJ_exchangeMethodWithReplacedClass:_NSArrayI replacedSel:@selector(getObjects:range:) replaceSel:@selector(_NSArrayI_getObjects:range:)];
//        [NSObject TJ_exchangeMethodWithReplacedClass:_NSSingleObjectArrayI replacedSel:@selector(getObjects:range:) replaceSel:@selector(_NSSingleObjectArrayI_getObjects:range:)];
//        
//    });
//}
#pragma mark - arrayWithObjects:count:
+ (instancetype)_NSArray_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    id instance = nil;
    @try {
        instance = [self _NSArray_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        for (int i = 0; i < cnt; i++) {
            if (objects[i]) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self _NSArray_arrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}
#pragma mark - objectsAtIndexes:
- (NSArray *)_NSArray_objectsAtIndexes:(NSIndexSet *)indexes {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self _NSArray_objectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        return returnArray;
    }
}
#pragma mark - objectAtIndex:
- (id)_NSArrayI_objectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self _NSArrayI_objectAtIndex:index];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        return object;
    }
}
- (id)_NSSingleObjectArrayI_objectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self _NSSingleObjectArrayI_objectAtIndex:index];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        return object;
    }
}
- (id)_NSArray0_objectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self _NSArray0_objectAtIndex:index];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        return object;
    }
}
#pragma mark - objectAtIndexedSubscript:
- (id)_NSArrayI_objectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self _NSArrayI_objectAtIndexedSubscript:index];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        return object;
    }
}
#pragma mark - getObjects:range:
- (void)_NSArray_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self _NSArray_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        
    }
}
- (void)_NSArrayI_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self _NSArrayI_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        
    }
}
- (void)_NSSingleObjectArrayI_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self _NSSingleObjectArrayI_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [NSObject TJ_ErrorException:exception];
    } @finally {
        
    }
}

@end
