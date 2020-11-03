//
//  TJFile.m
//  TJCommons
//
//  Created by mac on 2020/11/3.
//

#import "TJFile.h"

@implementation TJFile
#pragma mark - 常用文件路径
//沙盒主文件路径
+ (NSString *)homePath {
    NSString *path = NSHomeDirectory();
    return path;
}
//NSDocument
+ (NSString *)documentsPath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray lastObject];
    return path;
}
//获取Library目录
+ (NSString *)libraryPath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray lastObject];
    return path;
}
//caches
+ (NSString *)cachesPath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray lastObject];
    return path;
}
//获取tmp目录路径
+ (NSString *)tempPath {
    NSString *path = NSTemporaryDirectory();
    return path;
}

#pragma mark - 常用文件方法
//判断当前文件或者文件夹是否存在
+ (BOOL)checkFileExist:(NSString *)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isExist = [manager fileExistsAtPath:path];
    if (isExist) {
        return YES;
    } else {
       return NO;
    }
}
//判断当前文件夹是否存在 不存在就创建文件夹
+ (NSString*)checkDirectoryExist:(NSString*)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isDir;
    BOOL ifExist = [manager fileExistsAtPath:path isDirectory:&isDir];
    if (!(isDir && ifExist)) {
        BOOL create = [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        if (!create) {
            NSLog(@"创建文件夹成功");
        }
    }
    return path;
}
//删除文件或者文件夹
+ (BOOL)delFile:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL isDel = [fileManager removeItemAtPath:path error:&error];
    if (isDel) {
        return YES;
    } else {
        NSLog(@"%@",error.localizedDescription);
        return NO;
    }
}
//获取文件大小 fb kb mb gb
+ (long long)getFileSizeAtPath:(NSString*)filePath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
//获取文件夹大小
+ (long long)getFolderSizeAtPath:(NSString*)folderPath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self getFileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}
//转换Size 单位
+ (NSString *)getSizeStringWith:(long long)fb  {
    NSString *result = @"";
    double num = (double)fb/1024.0;
    if (num/1024.0 > 1.0) {
        num = num/1024.0;
        if (num/1024.0 > 1.0) {
            result = [NSString stringWithFormat:@"%.2lfGB",num/1024.0];
        } else {
            result = [NSString stringWithFormat:@"%.2lfMB",num];
        }
    } else {
        result = [NSString stringWithFormat:@"%.2lfKB",num];
    }
    return result;
}
//获取文件创建日期
+ (NSDate * _Nullable)getFileCreationDate:(NSString *)filePath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileCreationDate];
    }
    return nil;
}
//获取文件修改日期
+ (NSDate * _Nullable)getFileModificationDate:(NSString *)filePath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileModificationDate];
    }
    return nil;
}
//获取文件类型
+ (NSString * _Nullable)getFileType:(NSString *)filePath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileType];
    }
    return nil;
}
//文件重命名
+ (BOOL)renameFile:(NSString *)path name:(NSString *)name {
    NSString *oldName = [[path componentsSeparatedByString:@"/"] lastObject];
    NSString *newPath = [path stringByReplacingOccurrencesOfString:oldName withString:name];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    if ([fileManager moveItemAtPath:path toPath:newPath error:&error]) {
        return YES;
    } else {
        NSLog(@"%@",error.localizedDescription);
        return NO;
    }
}

@end
