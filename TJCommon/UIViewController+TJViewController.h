//
//  UIViewController+TJViewController.h
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TJViewController)

#pragma mark storybord加载vc
+ (instancetype)TJ_StorybordWithId:(NSString *)vID;
+ (instancetype)TJ_StorybordName:(NSString *)StorybordName vID:(NSString *)vID;
#pragma mark xib加载vc
+ (instancetype)TJ_XibName:(NSString *)name;
+ (instancetype)TJ_BundleName:(NSString *)bundleName xibName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
