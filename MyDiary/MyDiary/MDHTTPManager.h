//
//  MDHTTPManager.h
//  MyDiary
//
//  Created by Tebuy on 16/12/24.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "LTHTTPSessionManager.h"

@interface MDHTTPManager : LTHTTPSessionManager

+ (void)GetLocationWeatherWithLocation:(NSString *)location complete:(completeBlock)complete;
@end
