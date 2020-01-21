//
//  MGJRouter+openURL.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/20.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "MGJRouter+openURL.h"

@implementation MGJRouter (openURL)

+ (void)openURLWithVC:(UIViewController *)vc targetVcName:(NSString *)targetVcName{
    [MGJRouter openURLWithVC:vc targetVcName:targetVcName animationType:AnimationeDefaultType userInfo:nil completion:nil];
}

+ (void)openURLWithVC:(UIViewController *)vc targetVcName:(NSString *)targetVcName animationType:(OcssNavAnimationType)animationType{
    [MGJRouter openURLWithVC:vc targetVcName:targetVcName animationType:animationType userInfo:nil completion:nil];
}

+ (void)openURLWithVC:(UIViewController *)vc targetVcName:(NSString *)targetVcName userInfo:(NSDictionary *)userInfo{
    [MGJRouter openURLWithVC:vc targetVcName:targetVcName animationType:AnimationeDefaultType userInfo:userInfo completion:nil];
}

+ (void)openURLWithVC:(UIViewController *)vc targetVcName:(NSString *)targetVcName animationType:(OcssNavAnimationType)animationType userInfo:(NSDictionary *)userInfo completion:(void (^)(id result))completion{
    NSAssert(vc != nil, @"VC不能为空!");
    
    NSMutableDictionary *userInfo_new = [[NSMutableDictionary alloc] initWithDictionary:userInfo];
    [userInfo_new setObject:vc forKey:KRouter_FVC];
    [userInfo_new setObject:@(animationType) forKey:KRouter_ONAnimationType];
    
    [MGJRouter openURL:KRouterPush(targetVcName) withUserInfo:userInfo_new completion:completion];
}

+ (void)openURLToWebViewWithVC:(UIViewController *)vc urlStr:(NSString *)urlStr animationType:(OcssNavAnimationType)animationType userInfo:(NSDictionary *)userInfo completion:(void (^)(id result))completion{
    NSAssert(vc != nil, @"VC不能为空!");
    NSAssert(urlStr != nil, @"urlStr不能为空!");
    
    NSMutableDictionary *userInfo_new = [[NSMutableDictionary alloc] initWithDictionary:userInfo];
    [userInfo_new setObject:vc forKey:KRouter_FVC];
    [userInfo_new setObject:urlStr forKey:KRouter_WebVC_URL];
    [userInfo_new setObject:@(animationType) forKey:KRouter_ONAnimationType];
    
    [MGJRouter openURL:KRouterPush(@"OcssWebViewController") withUserInfo:userInfo_new completion:completion];
}

+ (void)openURLToWebViewWithVC:(UIViewController *)vc urlStr:(NSString *)urlStr{
    [MGJRouter openURLToWebViewWithVC:vc urlStr:urlStr animationType:AnimationeDefaultType userInfo:nil completion:nil];
}

+ (void)openURLToWebViewWithVC:(UIViewController *)vc urlStr:(NSString *)urlStr userInfo:(NSDictionary *)userInfo{
    [MGJRouter openURLToWebViewWithVC:vc urlStr:urlStr animationType:AnimationeDefaultType userInfo:userInfo completion:nil];
}

+ (void)openURLToWebViewWithVC:(UIViewController *)vc urlStr:(NSString *)urlStr animationType:(OcssNavAnimationType)animationType{
    [MGJRouter openURLToWebViewWithVC:vc urlStr:urlStr animationType:animationType userInfo:nil completion:nil];
}

@end
