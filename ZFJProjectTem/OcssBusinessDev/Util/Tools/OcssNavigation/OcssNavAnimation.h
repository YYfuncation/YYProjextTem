//
//  OcssNavAnimation.h
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OcssNavAnimationType) {
    AnimationeDefaultType = 0,
    AnimationeTopType = 1,
    AnimationeCoverType = 2,
    AnimationRotateType = 3
};

@interface OcssNavAnimation : NSObject

/**
 Operation
 */
@property (nonatomic,assign) UINavigationControllerOperation operation;

/**
 动画类型
 */
@property (nonatomic,assign) OcssNavAnimationType animationType;

@end
