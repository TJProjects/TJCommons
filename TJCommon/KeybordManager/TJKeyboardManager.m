//
//  TJKeyboardManager.m
//  OAK-Eye
//
//  Created by TJ on 2020/7/22.
//  Copyright © 2020 TJ. All rights reserved.
//

#import "TJKeyboardManager.h"
#import "TJCommons_define.h"

@interface TJKeyboardManager()
@property (nonatomic, assign)float keyboardChangeHeight;
@property (nonatomic, strong)UIView * _Nullable keyboardSubView;
@property (nonatomic, assign)float moreHeight;
@property (nonatomic, strong)NSDictionary *changeInfo;

@end

@implementation TJKeyboardManager

+ (instancetype)sharedInstance{
    static TJKeyboardManager *share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[self alloc] init];
    });
    return share;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.keyboardChangeHeight = 0;
        self.moreHeight = 0;
        self.changeInfo = [NSDictionary dictionary];
    }
    return self;
}
// 添加改变监听
- (void)addKeyboardShowViewChange {
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}
// 设置。不同的tag对应的除了输入框外需要上移的高度 @{@"100":80}
- (void)setChangeInfo:(NSDictionary *)info {
    self.changeInfo = info;
}
/**
 *  键盘将要显示
 *
 *  @param notification 通知
 */
- (void)keyboardWillShow:(NSNotification *)notification {
    self.keyboardSubView = nil;
    [self getSubViewWith:[self visibleViewController].view];
    if (self.keyboardSubView) {
        [self getMoreHeight];
        CGRect frame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGRect startRact = [self.keyboardSubView convertRect:self.keyboardSubView.bounds toView:[UIApplication sharedApplication].keyWindow];
//        NSLog(@"%lf %lf %lf",startRact.origin.y,startRact.size.height,frame.size.height);
        if (kHeight-startRact.origin.y-startRact.size.height - self.moreHeight > frame.size.height ) {
            self.keyboardChangeHeight = 0;
        } else {
            self.keyboardChangeHeight = frame.size.height - (kHeight-startRact.origin.y-startRact.size.height - self.moreHeight);
            [UIApplication sharedApplication].keyWindow.rootViewController.view.frame = CGRectMake(0, -self.keyboardChangeHeight, kWidth, kHeight);
        }
    }
}
//获取。对多变化的高度
- (void)getMoreHeight {
    self.moreHeight = 0;
    if (self.Block) {
        self.moreHeight = self.Block(self.keyboardSubView.tag);
    }
    if (self.moreHeight == 0) {
        if ([[self.changeInfo allKeys] containsObject:[NSString stringWithFormat:@"%ld",self.keyboardSubView.tag]]) {
            self.moreHeight = [[self.changeInfo objectForKey:[NSString stringWithFormat:@"%ld",self.keyboardSubView.tag]] floatValue];
        }
    }
}
//遍历查找 键盘的第一响应者
- (void)getSubViewWith:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:[UITextField class]]) {
            if ([subView isFirstResponder]) {
                self.keyboardSubView = subView;
                return;
            }
        } else if ([subView isKindOfClass:[UITextView class]]) {
            if ([subView isFirstResponder]) {
                self.keyboardSubView = subView;
                return;
            }
        } else {
            [self getSubViewWith:subView];
        }
    }
}

/**
 *  键盘将要隐藏
 *
 *  @param notification 通知
 */
- (void)keyboardWillHidden:(NSNotification *)notification {
    if (self.keyboardChangeHeight > 0) {
        [UIApplication sharedApplication].keyWindow.rootViewController.view.frame = CGRectMake(0, 0, kWidth, kHeight);
        self.keyboardChangeHeight = 0;
    }
    self.keyboardSubView = nil;
}
//获取当前展示的VC
- (UIViewController *)visibleViewController {
    UIViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    return [self getVisibleViewControllerFrom:rootViewController];
}
- (UIViewController *)getVisibleViewControllerFrom:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
