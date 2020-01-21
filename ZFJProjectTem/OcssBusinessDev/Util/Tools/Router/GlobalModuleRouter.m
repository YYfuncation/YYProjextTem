//
//  GlobalModuleRouter.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "GlobalModuleRouter.h"
#import "OcssWebViewController.h"

@implementation GlobalModuleRouter

+ (void)load{
    [MGJRouter registerURLPattern:KRouterPush(@"TestViewController") toHandler:^(NSDictionary *routerParameters) {
        UIViewController *father_vc = routerParameters[MGJRouterParameterUserInfo][KRouter_FVC];
        NSAssert(father_vc != nil, @"VC不能为空!");
        
        NSString *title = routerParameters[MGJRouterParameterUserInfo][@"title"];
 
        OcssNavAnimationType animationType = [routerParameters[MGJRouterParameterUserInfo][KRouter_ONAnimationType] integerValue];
        OcssNavViewController *navigationVC = (OcssNavViewController *)father_vc.navigationController;
        navigationVC.animationType = animationType;
        UIViewController *vc = [[NSClassFromString(@"TestViewController") alloc] init];
        vc.title = title;
        [navigationVC pushViewController:vc animated:YES];
     }];
    
    [MGJRouter registerURLPattern:KRouterPush(@"OcssWebViewController") toHandler:^(NSDictionary *routerParameters) {
        UIViewController *father_vc = routerParameters[MGJRouterParameterUserInfo][KRouter_FVC];
        NSAssert(father_vc != nil, @"VC不能为空!");
        
        NSString *urlStr = routerParameters[MGJRouterParameterUserInfo][KRouter_WebVC_URL];
        NSAssert(urlStr != nil, @"urlStr不能为空!");
        
        NSString *title = routerParameters[MGJRouterParameterUserInfo][@"title"];
        
        OcssNavAnimationType animationType = [routerParameters[MGJRouterParameterUserInfo][KRouter_ONAnimationType] integerValue];
        OcssNavViewController *navigationVC = (OcssNavViewController *)father_vc.navigationController;
        navigationVC.animationType = animationType;
        OcssWebViewController *vc = [[OcssWebViewController alloc] init];
        vc.urlStr = urlStr;
        vc.title = title;
        [navigationVC pushViewController:vc animated:YES];
    }];
}

@end
