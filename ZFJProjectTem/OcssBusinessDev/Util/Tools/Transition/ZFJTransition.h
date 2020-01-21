//
//  ZFJTransition.h
//  poseidon
//
//  Created by ZFJ on 2017/3/24.
//  Copyright © 2017年 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ZFJTransitionGestureRecognizerTypePan,
    ZFJTransitionGestureRecognizerTypeScreenEdgePan,
} ZFJTransitionGestureRecognizerType;

@interface ZFJTransition : NSObject

+ (void)validatePanPackWithZFJTransitionGestureRecognizerType:(ZFJTransitionGestureRecognizerType)type;

@end

@interface UIView(__ZFJTransition)

@property (nonatomic, assign) BOOL disableZFJTransition;

@end

@interface UINavigationController(DisableZFJTransition)

- (void)enabledZFJTransition:(BOOL)enabled;

@end
