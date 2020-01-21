//
//  RequestManager.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/20.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "RequestManager.h"

@implementation RequestManager

+ (AFHTTPSessionManager *)getManager{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    manager.responseSerializer = response;
    manager.requestSerializer.timeoutInterval = 120.0f;
    manager.requestSerializer  = [AFJSONRequestSerializer serializer];

    NSString *timestamp = [NSString stringWithFormat:@"%.0f",[[OcssTools getTheTimestamp] floatValue] * 1000];
    //平台
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"platform"];
    //版本
    [manager.requestSerializer setValue:[[UIDevice currentDevice] systemVersion] forHTTPHeaderField:@"version"];
    //时间戳
    [manager.requestSerializer setValue:timestamp forHTTPHeaderField:@"timestamp"];
    //设备
    [manager.requestSerializer setValue:[[UIDevice currentDevice] model] forHTTPHeaderField:@"devicetype"];
    
    return manager;
}

@end
