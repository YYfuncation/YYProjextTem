//
//  MBProgressHUD+MBP.h
//  poseidon
//
//  Created by ZFJ on 16/2/29.
//  Copyright © 2016年 张福杰. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (MBP)

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

//渐隐提示框
+ (void)SHOWPrompttext:(NSString *)Text;
+ (void)SHOWPrompttext:(NSString *)Text comcpleteBlock:(void(^)(void))completed;
+ (void)SHOWPrompttextNeedClose:(NSString *)text;
+ (void)HIDEPrompttextByClose;

//loading视图
+ (void)showMBProgressHUDLoding:(NSString *)showText;
//移除MBProgressHUD等待视图
+ (void)removeMBProgressHUDLoding:(NSString *)endText;
//移除MBProgressHUD等待视图带回调
+ (void)removeMBProgressHUDLoding:(NSString *)endText comcpleteBlock:(void(^)(void))completed;


/**
 MBProgressHUD进度条

 @param showText 显示文字
 */
+ (void)showMBProgressHUDProgress:(NSString *)showText;

/**
 设置MBProgressHUD进度条值
 
 @param progress 进度
 */
+ (void)setMBProgressHUDProgress:(CGFloat)progress;

/**
 隐藏进度条
 
 @param animated animated
 @param completed 完成回调
 */
+ (void)hideMBProgressHUDProgress:(BOOL)animated completed:(void(^)(void))completed;

/**
 隐藏进度条
 
 @param animated animated
 */
+ (void)hideMBProgressHUDProgress:(BOOL)animated;

@end
