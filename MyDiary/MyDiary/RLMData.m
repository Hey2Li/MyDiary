//
//  RLMData.m
//  MyDiary
//
//  Created by Tebuy on 16/12/26.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "RLMData.h"

@implementation RLMData

//设置主键
//+ (NSString *)primaryKey{
//    return @"id";
//}
//设置默认值
+ (NSDictionary *)defaultPropertyValues{
    return @{@"titleName":@"name",@"diaryContent":@"diaryContent",@"diaryTime":[NSDate dateWithTimeIntervalSinceNow:0],@"diaryWeather":@"小雨",@"diaryNumber":@"23",@"diaryWeek":@"Friday"};
}
@end
