//
//  MBProgressHUD+MBP.m
//  poseidon
//
//  Created by ZFJ on 16/2/29.
//  Copyright © 2016年 张福杰. All rights reserved.
//

#import "MBProgressHUD+MBP.h"

@implementation MBProgressHUD (MBP)

/**
 *  显示信息
 *
 *  @param text 信息内容
 *  @param icon 图标
 *  @param view 显示的视图
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hideAnimated:YES afterDelay:0.7];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success{
    [self showSuccess:success toView:nil];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view{
    [self show:success icon:@"success.png" view:view];
}

/**
 *  显示错误信息
 *
 */
+ (void)showError:(NSString *)error{
    [self showError:error toView:nil];
}

/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 *  @param view  需要显示信息的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

/**
 *  显示错误信息
 *
 *  @param message 信息内容
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message{
    return [self showMessage:message toView:nil];
}

/**
 *  显示一些信息
 *
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    //hud.dimBackground = YES;
    return hud;
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD{
    [self hideHUDForView:nil];
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

#pragma mark -渐隐提示框
+ (void)SHOWPrompttext:(NSString *)Text{
    if(Text == nil || Text.length == 0 || [Text containsString:@"请重新登录"]){
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        hud.label.text = Text;
        hud.margin = 10.f;
        hud.animationType = MBProgressHUDAnimationZoom;
        hud.mode = MBProgressHUDModeText;
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:1.5f];
    });
}

+ (void)SHOWPrompttextNeedClose:(NSString *)text{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        hud.tag = 2024;
        hud.label.text = text;
        hud.margin = 10.f;
        hud.animationType = MBProgressHUDAnimationZoom;
        hud.mode = MBProgressHUDModeText;
        hud.removeFromSuperViewOnHide = YES;
        //[hud hideAnimated:YES afterDelay:1.5f];
    });
}

+ (void)HIDEPrompttextByClose{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [window viewWithTag:2024];
        [hud hideAnimated:YES];
        hud = nil;
    });
}

#pragma mark - 渐隐提示框回调
+ (void)SHOWPrompttext:(NSString *)Text comcpleteBlock:(void(^)(void))completed{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:window];
    hud.label.text = Text;
    hud.margin = 10.f;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1.5f];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completed) {
            completed();
        }
    });
}

/**
 loading视图

 @param showText 加载的文字信息
 */
+ (void)showMBProgressHUDLoding:(NSString *)showText{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [window viewWithTag:1024];
        if(hud == nil){
            hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        }
        hud.label.text = showText;
        hud.animationType = MBProgressHUDAnimationZoom;
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.removeFromSuperViewOnHide = YES;
        hud.tag = 1024;
    });
}

/**
 移除MBProgressHUD等待视图

 @return 移除的文字信息
 */
#pragma mark -
+ (void)removeMBProgressHUDLoding:(NSString *)endText{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [window viewWithTag:1024];
        if(endText != nil && endText.length > 0){
            hud.label.text = endText;
        }
        [hud hideAnimated:YES];
        hud = nil;
    });
}

/**
 移除MBProgressHUD等待视图带回调

 @param endText 移除的文字信息
 @param completed 回调
 */
+ (void)removeMBProgressHUDLoding:(NSString *)endText comcpleteBlock:(void(^)(void))completed{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [window viewWithTag:1024];
    if(endText != nil && endText.length > 0){
        hud.label.text = endText;
    }
    [hud hideAnimated:YES afterDelay:1.0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completed) {
            completed();
        }
    });
    hud = nil;
}

/**
 MBProgressHUD进度条
 
 @param showText 显示文字
 */
+ (void)showMBProgressHUDProgress:(NSString *)showText{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [window viewWithTag:1024];
        if(hud == nil){
            hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        }
        hud.label.text = showText;
        hud.animationType = MBProgressHUDAnimationZoom;
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        hud.removeFromSuperViewOnHide = YES;
        hud.tag = 1024;
        [hud showAnimated:YES];
    });
}

/**
 设置MBProgressHUD进度条值
 
 @param progress 进度
 */
+ (void)setMBProgressHUDProgress:(CGFloat)progress{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [window viewWithTag:1024];
        if(progress >=0 && progress < 1.0){
            hud.progress = progress;
        }else{
            [hud hideAnimated:YES];
        }
    });
}

/**
 隐藏进度条

 @param animated animated
 @param completed 完成回调
 */
+ (void)hideMBProgressHUDProgress:(BOOL)animated completed:(void(^)(void))completed{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [window viewWithTag:1024];
        [hud hideAnimated:animated];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (completed) {
                completed();
            }
        });
    });
}

/**
 隐藏进度条
 
 @param animated animated
 */
+ (void)hideMBProgressHUDProgress:(BOOL)animated{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        MBProgressHUD *hud = [window viewWithTag:1024];
        [hud hideAnimated:animated];
    });
}










@end
