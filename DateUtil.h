//
//  DateUtil.h
//  ss
//
//  Created by tom.sun on 16/5/20.
//  Copyright © 2016年 tom.sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject
- (NSString *)getCurrentTime:(NSString *)format;
- (int)compareDate:(NSDate *)localDate withDate:(NSDate *)serverDate;
- (NSString *)timeStringBetweenNow:(long)longTime withFormat:(NSString *)formatter;
- (NSString *)formatterLongNSdate:(long)formatLongDate withFormat:(NSString *)formatter;
- (NSString *)getWeekBeginAndEnd:(NSString *)formatter;
@end
