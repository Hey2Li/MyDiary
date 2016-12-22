//
//  Tool.m
//  MyDiary
//
//  Created by Tebuy on 16/12/22.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "Tool.h"

@implementation Tool


//当前月份
+ (NSString *)montn{
    NSDateComponents *components = [[NSCalendar currentCalendar]components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    return
    @[@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"][[components month] - 1];
}
//当前天数
+ (NSInteger)day{
    NSDateComponents *components = [[NSCalendar currentCalendar]components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    return [components day];
}
//当前周
+ (NSString *)weekday{
    NSCalendar *calender = [NSCalendar currentCalendar];
    [calender setFirstWeekday:1];
    NSDateComponents *components = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    [components setDay:[self day]];
    NSDate *firstDayOfMonth = [calender dateFromComponents:components];
    NSUInteger firstWeekday = [calender ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonth];
    return @[@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday"][firstWeekday - 1];
}
//当前时间
+ (NSString *)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    return [formatter stringFromDate:[NSDate date]];
}
@end
