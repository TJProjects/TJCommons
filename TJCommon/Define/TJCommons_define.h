//
//  TJCommons_define.h
//  TJCommons
//
//  Created by mac on 2020/10/27.
//

#ifndef TJCommons_define_h
#define TJCommons_define_h

#pragma mark -  NSLog在release下不输出
#ifdef DEBUG
#define NSLog(formater,...) NSLog((@"\n[文件名:%s] " " 函数名:%s" "代码行数:%d\n" formater),[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define NSLog(...) /* */
#endif
//nslog 输入参数不全时 用MyLog
#define kMyLog(format, ...) printf("文件名: <%s 代码行数:(%d) >\n函数名: %s \n%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )

#define kAAWeakSelf(type) autoreleasepool{} __weak typeof(type) weak##type = type;
#define kAAStrongSelf(type) autoreleasepool{} __strong typeof(type) type = weak##type;

#define kWeakSelf(type) @kAAWeakSelf(type);
#define kStrongSelf(type) @kAAStrongSelf(type);

// 崩溃发生 拦截的消息通知
#define kTJCrashNotification @"k_TJ_Carsh_Notification"

#pragma mark -  常用宽高
#define kWidth ([UIScreen mainScreen].bounds.size.width)
#define kHeight ([UIScreen mainScreen].bounds.size.height)
//相对宽高
#define kRelativeWH(a) ([UIScreen mainScreen].bounds.size.width*(a/375.0))

#define kStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 44.0 : 20.0)
#define kNavBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 88.0 : 64.0)
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 83.0 : 49.0)
#define kTabBarBottom ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 34.0 : 0)

#pragma mark -  文字字体
//超细字体
#define kFontSys_UltraLight(s) [UIFont systemFontOfSize:s weight:UIFontWeightUltraLight]
//纤细字体
#define kFontSys_Thin(s) [UIFont systemFontOfSize:s weight:UIFontWeightThin]
//亮字体
#define kFontSys_Light(s) [UIFont systemFontOfSize:s weight:UIFontWeightLight]
//常规字体
#define kFontSys_Regular(s) [UIFont systemFontOfSize:s weight:UIFontWeightRegular]
//介于Regular和Semibold之间
#define kFontSys_Medium(s) [UIFont systemFontOfSize:s weight:UIFontWeightMedium]
//半粗字体
#define kFontSys_Semibold(s) [UIFont systemFontOfSize:s weight:UIFontWeightSemibold]
//加粗字体
#define kFontSys_Bold(s) [UIFont systemFontOfSize:s weight:UIFontWeightBold]
//介于Bold和Black之间
#define kFontSys_Heavy(s) [UIFont systemFontOfSize:s weight:UIFontWeightHeavy]
//最粗字体(理解)
#define kFontSys_Black(s) [UIFont systemFontOfSize:s weight:UIFontWeightBlack]
//自定义字体大小
#define kFontName(name,s) [UIFont fontWithName:name size:s]
//设定字体大小和宽度
#define kFontWeight(w,s) [UIFont monospacedDigitSystemFontOfSize:s weight:w]

#pragma mark -  取色值相关的方法
#define kRamdomColor [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1]

#define kRGB(r,g,b)          [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:1.f]

#define kRGBW(w)          [UIColor colorWithRed:(w)/255.f \
green:(w)/255.f \
blue:(w)/255.f \
alpha:1.f]

#define kRGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:(a)]

#define kRGB_OF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define kRGBA_OF(rgbValue)   [UIColor colorWithRed:((float)(((rgbValue) & 0xFF000000) >> 24))/255.0 \
green:((float)(((rgbValue) & 0x00FF0000) >> 16))/255.0 \
blue:((float)(rgbValue & 0x0000FF00) >> 8)/255.0 \
alpha:((float)(rgbValue & 0x000000FF))/255.0]

#define kRGBAOF(v, a)        [UIColor colorWithRed:((float)(((v) & 0xFF0000) >> 16))/255.0 \
green:((float)(((v) & 0x00FF00) >> 8))/255.0 \
blue:((float)(v & 0x0000FF))/255.0 \
alpha:a]

#pragma mark -  判断当前的iPhone设备/系统版本
// 判断是否为iPhone
#define kIsIphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// 判断是否为iPad
#define kIsIpad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
// 判断是否为ipod
#define kIsIpod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

#pragma mark -  判断系统版本
// 获取系统版本
#define kSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
// 判断高于版本
#define kIsHigherVersion(v) (([[[UIDevice currentDevice] systemVersion] floatValue] >= v)? (YES):(NO))

#pragma mark -  回调主线程执行的代码
#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif

#pragma mark -  沙盒目录文件路径
// 获取沙盒主目录路径
#define kPath_Home NSHomeDirectory()
//获取沙盒 Document
#define kPath_Document [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Library
#define kPath_Library [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject]
//获取沙盒 Cache
#define kPath_Cache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//获取temp
#define kPath_Temp NSTemporaryDirectory()

//由角度转换弧度 由弧度转换角度
#define kDegreesToRadian(x)  (M_PI * (x) /180.0)
#define kRadianToDegrees(radian)  (radian*180.0)/(M_PI)
//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages]objectAtIndex:0])

//常用缩写
#define kApplication  [UIApplication sharedApplication]
#define kKeyWindow  [UIApplication sharedApplication].keyWindow
#define kAppDelegate  [UIApplication sharedApplication].delegate
#define kUserDefaults  [NSUserDefaults standardUserDefaults]
//获取通知中心
#define kNotificationCenter [NSNotificationCenter defaultCenter]
//快速发通知
#define kPost_Notify(_notificationName, _obj, _userInfoDictionary) [[NSNotificationCenter defaultCenter] postNotificationName: _notificationName object: _obj userInfo: _userInfoDictionary];
//添加观察者
#define kAdd_Observer(_observer, _notificationName, _observerSelector, _obj) [[NSNotificationCenter defaultCenter] addObserver:_observer selector:@selector(_observerSelector) name:_notificationName object: _obj];
//移除观察者
#define kRemove_Observer(_observer) [[NSNotificationCenter defaultCenter] removeObserver: _observer];
//本地文件加载
#define kLoadImage(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define kLoadArray(file,type) [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define kLoadDict(file,type) [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

#endif /* TJCommons_define_h */
