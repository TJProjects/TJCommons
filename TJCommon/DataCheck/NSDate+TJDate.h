//
//  NSDate+TJDate.h
//  TJCommons
//
//  Created by mac on 2020/10/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (TJDate)
/**
 *  date 时间
 *  timeStr 字符串  样式的时间。 即2015-07-15 15:00:00
 *  timeStamp 时间戳
 *  format 转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 */
#pragma mark 字符串转时间 timeStr->date
+ (NSDate *)TJ_dateFromString:(NSString *)timeStr format:(NSString *)format;
#pragma mark 时间戳转时间
+ (NSDate *)TJ_dateFromTimeStamp:(NSString *)timeStamp;
#pragma mark 时间转时间戳
+ (NSString *)TJ_timeStampFromData:(NSDate *)date;
#pragma mark 字符串转时间戳
+ (NSString *)TJ_timeStampFromString:(NSString *)timeStr format:(NSString *)format;
#pragma mark 时间转字符串
+ (NSString *)TJ_StringFromDate:(NSDate *)date format:(NSString *)format;
#pragma mark 时间戳转字符串
+ (NSString *)TJ_StringFromTimeStamp:(NSString *)timeStamp format:(NSString *)format;

#pragma mark 获取当前时间戳
+ (NSString *)TJ_getTimeStampNow;

#pragma mark 获取年月日
+ (NSString *)TJ_getYearMothDay:(NSString *)timeStamp;
+ (NSString *)TJ_getYearMothDay2:(NSString *)timeStamp;
+ (NSString *)TJ_getYearMothDayByDate:(NSDate *)date;
+ (NSString *)TJ_getYearMothDay2ByDate:(NSDate *)date;
#pragma mark 获取时分秒
+ (NSString *)TJ_getHourMinuteSecond:(NSString *)timeStamp;
+ (NSString *)TJ_getHourMinuteSecondByDate:(NSDate *)date;
#pragma mark 获取单独的 年月日时分秒
+ (NSString *)TJ_getYear:(NSString *)timeStamp;
+ (NSString *)TJ_getMoth:(NSString *)timeStamp;
+ (NSString *)TJ_getDay:(NSString *)timeStamp;
+ (NSString *)TJ_getHour:(NSString *)timeStamp;
+ (NSString *)TJ_getMinute:(NSString *)timeStamp;
+ (NSString *)TJ_getSecond:(NSString *)timeStamp;

+ (NSString *)TJ_getYearByDate:(NSDate *)date;
+ (NSString *)TJ_getMothByDate:(NSDate *)date;
+ (NSString *)TJ_getDayByDate:(NSDate *)date;
+ (NSString *)TJ_getHourByDate:(NSDate *)date;
+ (NSString *)TJ_getMinuteByDate:(NSDate *)date;
+ (NSString *)TJ_getSecondByDate:(NSDate *)date;

#pragma mark 判断是否是同一天
+ (BOOL)TJ_CheckDayByDate:(NSDate *)date1 data:(NSDate *)date2;
+ (BOOL)TJ_CheckDayByTimeStamp:(NSString *)timeStamp1 timeStamp:(NSString *)timeStamp2;
#pragma mark 获取两个时间相差几天
+ (NSInteger)TJ_getLessDayWithTimeStampStart:(NSString *)timeStamp1 end:(NSString *)timeStamp2;
+ (NSInteger)TJ_getLessDayWithDateStart:(NSDate *)date1 end:(NSDate *)date2;





@end

NS_ASSUME_NONNULL_END
