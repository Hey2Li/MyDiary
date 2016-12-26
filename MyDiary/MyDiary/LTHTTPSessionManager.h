//
//  LTHTTPSessionManager.h
//  TwMall
//
//  Created by TaiHuiTao on 16/6/15.
//  Copyright © 2016年 TaiHuiTao. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

/**
 *  http返回状态码
 */
typedef enum{
    LTHttpResultFailure = 0,
    LTHttpResultSuccess
} LTHttpResult;

typedef void(^completeBlock)(LTHttpResult result, NSString *message, id data);

@interface LTHTTPSessionManager : AFHTTPSessionManager

- (NSURLSessionDataTask *)POSTWithParameters:(NSString *)url
                                  parameters:(id)parameters
                                    complete:(completeBlock)complete;

- (NSURLSessionDataTask *)GETWithParameters:(NSString *)url
                                  parameters:(id)parameters
                                    complete:(completeBlock)complete;

- (NSURLSessionDataTask *)PUTWithParameters:(NSString *)url
                                 parameters:(id)parameters
                                   complete:(completeBlock)complete;

- (NSURLSessionDataTask *)DELTEWithParameters:(NSString *)url
                                 parameters:(id)parameters
                                   complete:(completeBlock)complete;


@end
