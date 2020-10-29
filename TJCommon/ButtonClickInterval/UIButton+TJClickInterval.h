//
//  UIButton+TJClickInterval.h
//  TJCommons
//
//  Created by mac on 2020/10/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TJClickInterval)
/* 防止button重复点击，设置间隔 */
@property (nonatomic, assign) NSTimeInterval tj_ClickInterval;

@end

NS_ASSUME_NONNULL_END
