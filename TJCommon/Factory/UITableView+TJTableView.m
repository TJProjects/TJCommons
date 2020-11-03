//
//  UITableView+TJTableView.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "UITableView+TJTableView.h"
#import <objc/runtime.h>
#import "NSObject+TJExchangeMethod.h"

@implementation UITableView (TJTableView)

- (void)TJ_setDefault {
    //隐藏滚动条
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    //底部多出的线
    //header预设高度
    self.estimatedSectionHeaderHeight = 0;
    //footer预设高度
    self.estimatedSectionFooterHeight = 0;
    //头部20像素白条
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

@end
