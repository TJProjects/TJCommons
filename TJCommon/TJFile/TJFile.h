//
//  TJFile.h
//  TJCommons
//
//  Created by mac on 2020/11/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TJFile : NSObject

#pragma mark - 常用文件路径
//沙盒主文件路径
+ (NSString *)homePath;
//NSDocument
+ (NSString *)documentsPath;
//caches
+ (NSString *)cachesPath;
//获取Library目录
+ (NSString *)libraryPath;
//获取tmp目录路径
+ (NSString *)tempPath;

#pragma mark - 常用文件方法
//判断当前文件或者文件夹是否存在
+ (BOOL)checkFileExist:(NSString *)path;
//判断当前文件夹是否存在 不存在就创建文件夹
+ (NSString*)checkDirectoryExist:(NSString*)path;
//删除文件或者文件夹
+ (BOOL)delFile:(NSString *)path;
//获取文件大小 fb kb mb gb
+ (long long)getFileSizeAtPath:(NSString*)filePath;
//获取文件夹大小
+ (long long)getFolderSizeAtPath:(NSString*)folderPath;
//转换Size 单位
+ (NSString *)getSizeStringWith:(long long)fb;
//获取文件创建日期
+ (NSDate * _Nullable)getFileCreationDate:(NSString *)filePath;
//获取文件修改日期
+ (NSDate * _Nullable)getFileModificationDate:(NSString *)filePath;
//获取文件类型
+ (NSString * _Nullable)getFileType:(NSString *)filePath;
//文件重命名
+ (BOOL)renameFile:(NSString *)path name:(NSString *)name;
//复制文件到指定路径
+ (BOOL)copyFile:(NSString *)path newPath:(NSString *)newPath;

@end

NS_ASSUME_NONNULL_END
