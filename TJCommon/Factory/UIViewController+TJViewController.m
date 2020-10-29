//
//  UIViewController+TJViewController.m
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#import "UIViewController+TJViewController.h"

@implementation UIViewController (TJViewController)

#pragma mark storybord加载vc
+ (instancetype)TJ_StorybordWithId:(NSString *)vID {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [mainStoryBoard instantiateViewControllerWithIdentifier:vID];
}
+ (instancetype)TJ_StorybordName:(NSString *)StorybordName vID:(NSString *)vID {
    //将我们的storyBoard实例化，“Main”为StoryBoard的名称
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:StorybordName bundle:nil];
    //将第二个控制器实例化，"sid"为我们设置的控制器的ID
    return [mainStoryBoard instantiateViewControllerWithIdentifier:vID];
}
#pragma mark xib加载vc
+ (instancetype)TJ_XibName:(NSString *)name {
    return [[NSClassFromString(name) alloc] initWithNibName:name bundle:nil];
}
+ (instancetype)TJ_BundleName:(NSString *)bundleName xibName:(NSString *)name {
    //拿到自己创建的bundle
    NSBundle *bundle = [NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle",bundleName]]];
    //加载view
    return [[bundle loadNibNamed:name owner:nil options:nil] lastObject];
}

@end
