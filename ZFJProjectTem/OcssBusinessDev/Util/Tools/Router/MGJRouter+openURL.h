//
//  MGJRouter+openURL.h
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/20.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "MGJRouter.h"

@interface MGJRouter (openURL)


/**
 打开一个视图控制器

 @param vc 当前VC
 @param targetVcName 目标跳转VC
 @param animationType 转场动画类型
 @param userInfo 路由信息
 @param completion 回调
 */
+ (void)openURLWithVC:(UIViewController *)vc targetVcName:(NSString *)targetVcName animationType:(OcssNavAnimationType)animationType userInfo:(NSDictionary *)userInfo completion:(void (^)(id result))completion;

/**
 打开一个视图控制器

 @param vc 当前VC
 @param targetVcName 目标跳转VC
 */
+ (void)openURLWithVC:(UIViewController *)vc targetVcName:(NSString *)targetVcName;

/**
 打开一个视图控制器

 @param vc 当前VC
 @param targetVcName 目标跳转VC
 @param animationType 转场动画类型
 */
+ (void)openURLWithVC:(UIViewController *)vc targetVcName:(NSString *)targetVcName animationType:(OcssNavAnimationType)animationType;

/**
 打开一个视图控制器

 @param vc 当前VC
 @param targetVcName 目标跳转VC
 @param userInfo 路由信息
 */
+ (void)openURLWithVC:(UIViewController *)vc targetVcName:(NSString *)targetVcName userInfo:(NSDictionary *)userInfo;

/**
 打开一个网页浏览器VC

 @param vc 当前VC
 @param urlStr 网址
 @param animationType 转场动画类型
 @param userInfo 路由信息
 @param completion 回调
 */
+ (void)openURLToWebViewWithVC:(UIViewController *)vc urlStr:(NSString *)urlStr animationType:(OcssNavAnimationType)animationType userInfo:(NSDictionary *)userInfo completion:(void (^)(id result))completion;

/**
 打开一个网页浏览器VC

 @param vc 当前VC
 @param urlStr 网址
 */
+ (void)openURLToWebViewWithVC:(UIViewController *)vc urlStr:(NSString *)urlStr;

/**
 打开一个网页浏览器VC

 @param vc 当前VC
 @param urlStr 网址
 @param userInfo 路由信息
 */
+ (void)openURLToWebViewWithVC:(UIViewController *)vc urlStr:(NSString *)urlStr userInfo:(NSDictionary *)userInfo;

/**
 打开一个网页浏览器VC

 @param vc 当前VC
 @param urlStr 网址
 @param animationType 转场动画类型
 */
+ (void)openURLToWebViewWithVC:(UIViewController *)vc urlStr:(NSString *)urlStr animationType:(OcssNavAnimationType)animationType;

@end
