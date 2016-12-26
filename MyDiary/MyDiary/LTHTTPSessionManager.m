//
//  LTHTTPSessionManager.m
//  TwMall
//
//  Created by TaiHuiTao on 16/6/15.
//  Copyright © 2016年 TaiHuiTao. All rights reserved.
//

#import "LTHTTPSessionManager.h"

//解析数据返回错误
NSString *const kParseResponseError = @"解析数据失败";
NSString *const kHttpRequestFailure = @"网络连接错误";
//返回参数key值
NSString *const kKeyResult = @"error_code";
NSString *const kKeyMessage = @"error_msg";
NSString *const kKeyData = @"data";
NSString *const kKeyModelList = @"modellist";

@implementation LTHTTPSessionManager

- (instancetype)init{
    if (self = [super init]) {
        //将本地cookie放在网络请求header
        NSArray * cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey:@"kcookie"]];
        NSHTTPCookieStorage * cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (NSHTTPCookie * cookie in cookies){
            [cookieStorage setCookie: cookie];
        }
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    }
    return self;
}
+ (instancetype)manager{
    return [[self alloc]init];
}

- (NSURLSessionDataTask *)POSTWithParameters:(NSString *)url parameters:(id)parameters complete:(completeBlock)complete{
    return [super POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
        NSLog(@"url:%@",url);
        NSLog(@"parameters:%@",parameters);
        NSLog(@"responseObject:%@",responseObject);
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            complete(LTHttpResultFailure, kParseResponseError, nil);
        }else if([responseObject[kKeyResult] isEqualToString:@"ERROR"]){
            complete(LTHttpResultFailure, responseObject[kKeyMessage], nil);
        }else{
            complete(LTHttpResultSuccess, responseObject[kKeyMessage], responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
        NSLog(@"url:%@",url);
        NSLog(@"parameters:%@",parameters);
        NSLog(@"error:%@",error);
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode == 200) {
            complete(LTHttpResultFailure, kParseResponseError, nil);
        }else{
            complete(LTHttpResultFailure, kHttpRequestFailure, nil);
        }
    }];
}

- (NSURLSessionDataTask *)GETWithParameters:(NSString *)url parameters:(id)parameters complete:(completeBlock)complete{
    return [super GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
        NSLog(@"url:%@",url);
        NSLog(@"parameters:%@",parameters);
        NSLog(@"responseObject:%@",responseObject);
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            complete(LTHttpResultFailure, kParseResponseError, nil);
        }else if([responseObject[kKeyResult] isEqualToString:@"ERROR"]){
            complete(LTHttpResultFailure, responseObject[kKeyMessage], nil);
        }else{
            complete(LTHttpResultSuccess, responseObject[kKeyMessage], responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
        NSLog(@"url:%@",url);
        NSLog(@"parameters:%@",parameters);
        NSLog(@"error:%@",error);
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode == 200) {
            complete(LTHttpResultFailure, kParseResponseError, nil);
        }else{
            complete(LTHttpResultFailure, kHttpRequestFailure, nil);
        }
    }];
}


- (NSURLSessionDataTask *)PUTWithParameters:(NSString *)url parameters:(id)parameters complete:(completeBlock)complete{
    return [super PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
        NSLog(@"url:%@",url);
        NSLog(@"parameters:%@",parameters);
        NSLog(@"responseObject:%@",responseObject);
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            complete(LTHttpResultFailure, kParseResponseError, nil);
        }else if([responseObject[kKeyResult] isEqualToString:@"ERROR"]){
            complete(LTHttpResultFailure, responseObject[kKeyMessage], nil);
        }else{
            complete(LTHttpResultSuccess, responseObject[kKeyMessage], responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
        NSLog(@"url:%@",url);
        NSLog(@"parameters:%@",parameters);
        NSLog(@"error:%@",error);
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode == 200) {
            complete(LTHttpResultFailure, kParseResponseError, nil);
        }else{
            complete(LTHttpResultFailure, kHttpRequestFailure, nil);
        }
    }];
}


- (NSURLSessionDataTask *)DELTEWithParameters:(NSString *)url parameters:(id)parameters complete:(completeBlock)complete{
    return [super DELETE:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
        NSLog(@"url:%@",url);
        NSLog(@"parameters:%@",parameters);
        NSLog(@"responseObject:%@",responseObject);
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            complete(LTHttpResultFailure, kParseResponseError, nil);
        }else if([responseObject[kKeyResult] isEqualToString:@"ERROR"]){
            complete(LTHttpResultFailure, responseObject[kKeyMessage], nil);
        }else{
            complete(LTHttpResultSuccess, responseObject[kKeyMessage], responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
        NSLog(@"url:%@",url);
        NSLog(@"parameters:%@",parameters);
        NSLog(@"error:%@",error);
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode == 200) {
            complete(LTHttpResultFailure, kParseResponseError, nil);
        }else{
            complete(LTHttpResultFailure, kHttpRequestFailure, nil);
        }
    }];
}

@end
