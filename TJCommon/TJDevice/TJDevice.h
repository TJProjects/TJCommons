//
//  TJDevice.h
//  TJCommons
//
//  Created by mac on 2020/11/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJDevice : NSObject

// app的bundle Identifier信息
+ (NSString *)bundleID;
//app版本号 @"1.0.1"
+ (NSString *)appVersion;
//app Build号
+ (NSString *)appBuild;
// 获取App显示名
+ (NSString *)appName;
//手机名称
+ (NSString *)phoneName;
//系统名称 @"iOS"
+ (NSString *)systemName;
//系统版本 @"13.2"
+ (NSString *)systemVersion;
//UUID：
+ (NSString *)UUID;
//电池电量
+ (CGFloat)batteryLevel;
//总内存
+ (long long)physicalMemory;
//当前语言  en
+ (NSString *)deviceLanguage;
//当前国家  en_US
+ (NSString *)deviceCountry;
// 设备类型 @"iPhone", @"iPod touch"
+ (NSString *)deviceType;
// 地方型号  （国际化区域名称）
+ (NSString *)deviceLocalizedModel;

//设备型号
+ (NSString *)deviceModel;
/**
 本方法是得到 UUID 后存入系统中的 keychain 的方法
 不用添加 plist 文件
 程序删除后重装,仍可以得到相同的唯一标示
 但是当系统升级或者刷机后,系统中的钥匙串会被清空,此时本方法失效
 */
+(NSString *)getDeviceIDInKeychain;

@end

NS_ASSUME_NONNULL_END
