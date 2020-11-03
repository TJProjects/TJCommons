//
//  TJKeyboardManager.h
//  OAK-Eye
//
//  Created by TJ on 2020/7/22.
//  Copyright © 2020 TJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef float(^TJKeyboardManagerMoreHeightBlock)(NSInteger tag);

NS_ASSUME_NONNULL_BEGIN

@interface TJKeyboardManager : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (id)copy NS_UNAVAILABLE; // 没有遵循协议可以不写
- (id)mutableCopy NS_UNAVAILABLE; // 没有遵循协议可以不写

+ (instancetype)sharedInstance;

@property (nonatomic, copy) TJKeyboardManagerMoreHeightBlock Block;

// 添加改变监听
- (void)addKeyboardShowViewChange;
// 设置。不同的tag对应的除了输入框外需要上移的高度 @{@"100":80}
- (void)setChangeInfo:(NSDictionary *)info;
//获取当前展示的VC
- (UIViewController *)visibleViewController;

@end

NS_ASSUME_NONNULL_END
