//
//  AppDelegateTool.h
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegateTool : NSObject

/**
 AppDelegate配置文件

 @param application application
 */
+ (void)appConfigApplication:(UIApplication *)application;

/**
 键盘管理类
 */
+ (void)configureBoardManager;

/**
 设置根视图控制器
 */
+ (void)setRootViewController;

@end

NS_ASSUME_NONNULL_END
