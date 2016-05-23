//
//  DateUtil.m
//  ss
//
//  Created by tom.sun on 16/5/20.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import "DateUtil.h"
const static long SECONDS_PER_MINUTE = 60;
const static long SECONDS_PER_HOUR = 3600;
const static long SECONDS_PER_DAY = 86400;

@implementation DateUtil
/*!
 *  @brief  获取当前时间
 *
 *  @param format 时间格式
 *
 *  @return  当前时间
 */
- (NSString *)getCurrentTime:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:[NSDate date]];
}

/*!
 *  @brief  比较两个时间大小
 *
 *  @param localDate  本地时间
 *  @param serverDate server时间
 *
 *  @return 1（server时间比本地时间大）-1（server时间比本地时间小）0（相等）
 */
- (int)compareDate:(NSDate *)localDate withDate:(NSDate *)serverDate
{
    int ci;
    NSComparisonResult result = [localDate compare:serverDate];
    switch (result)
    {
            //serverDate比localDate大
        case NSOrderedAscending: ci=1; break;
            //serverDate比localDate小
        case NSOrderedDescending: ci=-1; break;
            //serverDate=localDate
        case NSOrderedSame: ci=0; break;
        default:  break;
    }
    return ci;
}

/*!
 *  @brief  根据返回的参数与当前时间的时间差描述
 *
 *  @param longTime  服务返回时间参数（时间戳）
 *  @param formatter 时间格式
 *
 *  @return 时间差描述
 */
- (NSString *)timeStringBetweenNow:(long)longTime withFormat:(NSString *)formatter
{
    long duration = [[NSDate date] timeIntervalSince1970] - longTime;
    if (duration < SECONDS_PER_MINUTE) {
        return [NSString stringWithFormat:@"%ld秒前",duration];
    } else if (duration < SECONDS_PER_HOUR) {
        return [NSString stringWithFormat:@"%ld分钟前",duration/SECONDS_PER_MINUTE];
    } else if (duration < SECONDS_PER_DAY) {
        return [NSString stringWithFormat:@"%ld小时前",duration/SECONDS_PER_HOUR];
    } else if (duration < (SECONDS_PER_DAY * 30)) {
        return [NSString stringWithFormat:@"%ld天前",duration/SECONDS_PER_DAY];
    } else {
        return [self formatterLongNSdate:longTime withFormat:formatter];
    }
}

/*!
 *  @brief  根据时间戳转成对应要求的时间
 *
 *  @param formatLongDate 时间戳
 *  @param formatter      时间格式
 *
 *  @return 时间
 */
- (NSString *)formatterLongNSdate:(long)formatLongDate withFormat:(NSString *)formatter
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:formatLongDate]];
}

/*!
 *  @brief  获取本周的开始和结束日期
 *
 *  @param formatter 日期形式
 *
 *  @return 开始日期-结束日期
 */
- (NSString *)getWeekBeginAndEnd:(NSString *)formatter
{
    NSString *resultStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSDate *date=[NSDate date];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];//设定周一为周首日 周日 是 “1”，周一是 “2”
    NSDateComponents *comps=[calendar components:(NSCalendarUnitWeekday|NSCalendarUnitWeekdayOrdinal) fromDate:date];
    NSInteger weekday=[comps weekday];
    NSInteger theWeekDay=weekday-1;
    NSDate *nowDate=[[NSDate alloc] init];
    if (theWeekDay==0) {//今天是星期天
        NSTimeInterval interval=24*60*60*6;//减6天
        NSDate *benginDate=[nowDate initWithTimeIntervalSinceNow:-interval];
        NSString *beginDateStr=[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:benginDate]];
        NSString *endDateStr=[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:date]];
        resultStr=[NSString stringWithFormat:@"%@ - %@",beginDateStr,endDateStr];
    }
    else{
        NSTimeInterval benginInterval=-(theWeekDay-1)*24*60*60;//向前 减的毫秒数
        NSTimeInterval endInterval=+(7-theWeekDay)*24*60*60;//向后 加的毫秒数
        NSDate *beginDate=[nowDate initWithTimeIntervalSinceNow:benginInterval];
        NSDate *endDate=[nowDate initWithTimeIntervalSinceNow:endInterval];
        NSString *beginDateStr=[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:beginDate]];
        NSString *endDateStr=[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:endDate]];
        resultStr=[NSString stringWithFormat:@"%@ - %@",beginDateStr,endDateStr];
    }
    return resultStr;
}
@end
