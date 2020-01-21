//
//  AFNetWorkManager.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/20.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "AFNetWorkManager.h"
#import "RequestManager.h"

@implementation AFNetWorkManager

+ (void)requestDataBaseWithURLByPOST:(NSString *)urlStr parameters:(id)parameters completed:(void(^)(id responseObject))completed{
#warning ------待完善------
    AFHTTPSessionManager *manager = [RequestManager getManager];
    [manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (completed){
            completed(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completed){
            completed(nil);
        }
    }];
}

@end
