//
//  AppDelegateTool.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "AppDelegateTool.h"
#import "IQKeyboardManager.h"
#import "ZFJTransition.h"
#import "LogInViewController.h"

@implementation AppDelegateTool

+ (void)appConfigApplication:(UIApplication *)application{
    [ZFJTransition validatePanPackWithZFJTransitionGestureRecognizerType:ZFJTransitionGestureRecognizerTypeScreenEdgePan];
    [[UINavigationBar appearance]setTintColor:APPMainColor];
    [[UITabBar appearance] setTranslucent:NO];
}

+ (void)configureBoardManager{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField = 10;
    manager.enableAutoToolbar = YES;
    manager.toolbarManageBehaviour = IQAutoToolbarBySubviews;
    manager.toolbarDoneBarButtonItemText = @"完成";
    manager.shouldToolbarUsesTextFieldTintColor = NO;
    manager.toolbarTintColor = APPMainColor;
}

+ (void)setRootViewController{
#warning 待完成-可以根据缓存的token来判断用户的登录状态，来设置不同的RootVC
    LogInViewController *lvc = [[LogInViewController alloc] init];
    OcssNavViewController *nvc = [[OcssNavViewController alloc]initWithRootViewController:lvc];
    [[UIApplication sharedApplication].delegate window].rootViewController = nvc;
}

@end
