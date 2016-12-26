//
//  MDHTTPManager.m
//  MyDiary
//
//  Created by Tebuy on 16/12/24.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "MDHTTPManager.h"

@implementation MDHTTPManager
+ (void)GetLocationWeatherWithLocation:(NSString *)location complete:(completeBlock)complete{
    LTHTTPSessionManager *manager = [LTHTTPSessionManager new];
    NSString *url = [NSString stringWithFormat:@"https://api.thinkpage.cn/v3/weather/now.json?key=r3aotyetp4dyiaai&location=%@&language=zh-Hans&unit=c",location];
     NSString *urlString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GETWithParameters:urlString parameters:nil complete:complete];
}
@end
