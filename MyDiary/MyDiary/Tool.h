//
//  Tool.h
//  MyDiary
//
//  Created by Tebuy on 16/12/22.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

/**
 当前时间

 @return NSString
 */
+ (NSString *)time;

/**
 当前天数

 @return NSInteger
 */
+ (NSInteger)day;

/**
 当前周几

 @return NSString
 */
+ (NSString *)weekday;

/**
 当前月份

 @return NSString
 */
+ (NSString *)montn;



@end
