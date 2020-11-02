//
//  NSDate+TJDate.m
//  TJCommons
//
//  Created by mac on 2020/10/28.
//

#import "NSDate+TJDate.h"

static NSDateFormatter *dateFormatter;

// yyyy-MM-dd HH:mm:ss

@implementation NSDate (TJDate)
+ (NSDateFormatter *)defaultFormatter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
    });
    return dateFormatter;
}
#pragma mark 字符串转是时间戳 string->date
+ (NSDate *)TJ_dateFromString:(NSString *)timeStr format:(NSString *)format {
    NSDateFormatter *dateFormatter = [NSDate defaultFormatter];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:timeStr];
    return date;
}
#pragma mark 时间戳转时间
+ (NSDate *)TJ_dateFromTimeStamp:(NSString *)timeStamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp integerValue]];
    return date;
}
#pragma mark 时间转时间戳
+ (NSString *)TJ_timeStampFromData:(NSDate *)date {
    return [NSString stringWithFormat:@"%lf",[date timeIntervalSince1970]];
}
#pragma mark 时间字符串转时间戳
+ (NSString *)TJ_timeStampFromString:(NSString *)timeStr format:(NSString *)format {
    NSDate *date = [NSDate TJ_dateFromString:timeStr format:format];
    return [NSDate TJ_timeStampFromData:date];
}
#pragma mark 时间转字符串
+ (NSString *)TJ_StringFromDate:(NSDate *)date format:(NSString *)format {
    NSDateFormatter* dateFormat = [NSDate defaultFormatter];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate:date];
}
#pragma mark 时间戳转字符串
+ (NSString *)TJ_StringFromTimeStamp:(NSString *)timeStamp format:(NSString *)format {
    NSDate *date = [NSDate TJ_dateFromTimeStamp:timeStamp];
    return [NSDate TJ_StringFromDate:date format:format];
}

#pragma mark 获取当前时间戳
+ (NSString *)TJ_getTimeStampNow {
    return [NSDate TJ_timeStampFromData:[NSDate date]];
}

#pragma mark 获取年月日
+ (NSString *)TJ_getYearMothDay:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"yyyy-MM-dd"];
}
+ (NSString *)TJ_getYearMothDay2:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"yyyy年MM月dd日"];
}
+ (NSString *)TJ_getYearMothDayByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"yyyy-MM-dd"];
}
+ (NSString *)TJ_getYearMothDay2ByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"yyyy年MM月dd日"];
}
#pragma mark 获取时分秒
+ (NSString *)TJ_getHourMinuteSecond:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"HH:mm:ss"];
}
+ (NSString *)TJ_getHourMinuteSecondByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"HH:mm:ss"];
}
#pragma mark 获取单独的 年月日时分秒
+ (NSString *)TJ_getYear:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"yyyy"];
}
+ (NSString *)TJ_getMoth:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"MM"];
}
+ (NSString *)TJ_getDay:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"dd"];
}
+ (NSString *)TJ_getHour:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"HH"];
}
+ (NSString *)TJ_getMinute:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"mm"];
}
+ (NSString *)TJ_getSecond:(NSString *)timeStamp {
    return [NSDate TJ_StringFromTimeStamp:timeStamp format:@"ss"];
}
+ (NSString *)TJ_getYearByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"yyyy"];
}
+ (NSString *)TJ_getMothByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"MM"];
}
+ (NSString *)TJ_getDayByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"dd"];
}
+ (NSString *)TJ_getHourByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"HH"];
}
+ (NSString *)TJ_getMinuteByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"mm"];
}
+ (NSString *)TJ_getSecondByDate:(NSDate *)date {
    return [NSDate TJ_StringFromDate:date format:@"ss"];
}
#pragma mark 判断是否是同一天
+ (BOOL)TJ_CheckDayByDate:(NSDate *)date1 data:(NSDate *)date2 {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comp1 = [calendar components:unitFlag fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlag fromDate:date2];
    return (([comp1 day] == [comp2 day]) && ([comp1 month] == [comp2 month]) && ([comp1 year] == [comp2 year]));
}
+ (BOOL)TJ_CheckDayByTimeStamp:(NSString *)timeStamp1 timeStamp:(NSString *)timeStamp2 {
    NSDate *date1 = [NSDate TJ_dateFromTimeStamp:timeStamp1];
    NSDate *date2 = [NSDate TJ_dateFromTimeStamp:timeStamp2];
    return [NSDate TJ_CheckDayByDate:date1 data:date2];
}
#pragma mark 获取两个时间相差几天
+ (NSInteger)TJ_getLessDayWithTimeStampStart:(NSString *)timeStamp1 end:(NSString *)timeStamp2 {
    NSInteger day = [timeStamp2 integerValue]/60/60/24 - [timeStamp1 integerValue]/60/60/24;
    return day;
}
+ (NSInteger)TJ_getLessDayWithDateStart:(NSDate *)date1 end:(NSDate *)date2 {
    NSString *timeStamp1 = [NSDate TJ_timeStampFromData:date1];
    NSString *timeStamp2 = [NSDate TJ_timeStampFromData:date2];
    NSInteger day = [timeStamp2 integerValue]/60/60/24 - [timeStamp1 integerValue]/60/60/24;
    return day;
}




@end
