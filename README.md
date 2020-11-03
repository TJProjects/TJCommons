# TJCommons

使用方法      
pod 'TJCommons', :tag => 'version', :git=> 'https://github.com/TJProjects/TJCommons.git'

//崩溃数据检测 开启     
[TJCommon avoidALLCrashExchangeMothed];

//处理键盘弹出变化    
//开启监听     
[[TJKeyboardManager sharedInstance] addKeyboardShowViewChange];      
// 设置特殊的输入框。上移的高度    
[[TJKeyboardManager sharedInstance] setChangeInfo:@{@"100":@"50"}];   
// 返回 特殊的输入框。上移的高度 blok的优先级最高     
[TJKeyboardManager sharedInstance].Block = ^float(NSInteger tag) {      
    return 0;     
};    

//常用宏定义   
#import "TJCommons_define.h"

//工厂类的处理    
#import "UIButton+TJButton.h" 
#import "UILabel+TJLabel.h" 
#import "UIView+TJView.h" 
#import "UITableView+TJTableView.h" 
#import "UIViewController+TJViewController.h" 

// 常用的文字计算。时间计算 字典解析 
#import "NSString+TJString.h" 
#import "NSDate+TJDate.h" 
#import "NSDictionary+TJDictionary.h" 

// button 重复点击 
#import "UIButton+TJClickInterval.h" 

// image 处理 
#import "UIImage+TJImage.h" 

//常用文件处理 
#import "TJFile.h" 

//常用设备信息 
#import "TJDevice.h" 
