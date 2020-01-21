//
//  OcssNavAnimation.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "OcssNavAnimation.h"

@interface OcssNavAnimation ()<UIViewControllerAnimatedTransitioning>{
    UIView *_coverView;
}

@end

@implementation OcssNavAnimation

- (instancetype)init{
    if(self == [super init]){
        self.operation = UINavigationControllerOperationNone;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    
    if(self.animationType == AnimationeTopType){
        
        [containerView addSubview:toViewController.view];
        
        CGRect fromViewStartFrame = [transitionContext initialFrameForViewController:fromViewController];
        CGRect toViewEndFrame = [transitionContext finalFrameForViewController:toViewController];
        CGRect fromViewEndFrame = fromViewStartFrame;
        CGRect toViewStartFrame = toViewEndFrame;
        
        if(self.operation == UINavigationControllerOperationPush){
            //PUSH
            toViewStartFrame.origin.y -= toViewEndFrame.size.height;
        }else if (self.operation == UINavigationControllerOperationPop){
            //POP
            fromViewEndFrame.origin.y -= fromViewStartFrame.size.height;
            [containerView sendSubviewToBack:toViewController.view];
        }
        //这里面 你可以自定义动画
        fromViewController.view.frame = fromViewStartFrame;
        toViewController.view.frame = toViewStartFrame;
        
        //动画
        CGFloat duration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:duration animations:^{
            fromViewController.view.frame = fromViewEndFrame;
            toViewController.view.frame = toViewEndFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }else if(self.animationType == AnimationeCoverType){
        [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        CATransform3D t = CATransform3DIdentity;
        t = CATransform3DRotate(t, M_PI / 2.0, 0.0, 1.0, 0.0);
        t.m34 = 1.0 / -2000;
        
        if (self.operation == UINavigationControllerOperationPush) {
            [self setAnchorPoint:CGPointMake(1.0, 0.5) forView:toViewController.view];
            [self setAnchorPoint:CGPointMake(0.0, 0.5) forView:fromViewController.view];
        } else if (self.operation == UINavigationControllerOperationPop) {
            [self setAnchorPoint:CGPointMake(0.0, 0.5) forView:toViewController.view];
            [self setAnchorPoint:CGPointMake(1.0, 0.5) forView:fromViewController.view];
        }
        
        fromViewController.view.layer.zPosition = 2.0;
        toViewController.view.layer.zPosition = 1.0;
        toViewController.view.layer.transform = t;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.layer.transform = t;
            toViewController.view.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL finished) {
            fromViewController.view.layer.zPosition = 0.0;
            toViewController.view.layer.zPosition = 0.0;
            [transitionContext completeTransition:YES];
        }];
    }else if (self.animationType == AnimationRotateType){
        UIView *fromSnapshot = [fromViewController.view snapshotViewAfterScreenUpdates:NO];
        fromSnapshot.frame = fromViewController.view.frame;
        [containerView insertSubview:fromSnapshot aboveSubview:fromViewController.view];
        [fromViewController.view removeFromSuperview];
        
        toViewController.view.frame = fromSnapshot.frame;
        [containerView insertSubview:toViewController.view belowSubview:fromSnapshot];
        
        CGFloat width = floorf(fromSnapshot.frame.size.width/2.0)+5.0;
        [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:0 animations:^{
            [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.20 animations:^{
                CATransform3D fromT = CATransform3DIdentity;
                fromT.m34 = 1.0 / -2000;
                fromT = CATransform3DTranslate(fromT, 0.0, 0.0, -590.0);
                fromSnapshot.layer.transform = fromT;
                
                CATransform3D toT = CATransform3DIdentity;
                toT.m34 = 1.0 / -2000;
                toT = CATransform3DTranslate(fromT, 0.0, 0.0, -600.0);
                toViewController.view.layer.transform = toT;
            }];
            [UIView addKeyframeWithRelativeStartTime:0.20 relativeDuration:0.20 animations:^{
                if (self.operation == UINavigationControllerOperationPush) {
                    fromSnapshot.layer.transform = CATransform3DTranslate(fromSnapshot.layer.transform, -width, 0.0, 0.0);
                    toViewController.view.layer.transform = CATransform3DTranslate(toViewController.view.layer.transform, width, 0.0, 0.0);
                } else if (self.operation == UINavigationControllerOperationPop) {
                    fromSnapshot.layer.transform = CATransform3DTranslate(fromSnapshot.layer.transform, width, 0.0, 0.0);
                    toViewController.view.layer.transform = CATransform3DTranslate(toViewController.view.layer.transform, -width, 0.0, 0.0);
                }
            }];
            [UIView addKeyframeWithRelativeStartTime:0.40 relativeDuration:0.20 animations:^{
                fromSnapshot.layer.transform = CATransform3DTranslate(fromSnapshot.layer.transform, 0.0, 0.0, -200);
                toViewController.view.layer.transform = CATransform3DTranslate(toViewController.view.layer.transform, 0.0, 0.0, 500);
            }];
            [UIView addKeyframeWithRelativeStartTime:0.60 relativeDuration:0.20 animations:^{
                CATransform3D fromT = fromSnapshot.layer.transform;
                CATransform3D toT = toViewController.view.layer.transform;
                if (self.operation == UINavigationControllerOperationPush) {
                    fromT = CATransform3DTranslate(fromT, floorf(width), 0.0, 200.0);
                    toT = CATransform3DTranslate(fromT, floorf(-(width*0.03)), 0.0, 0.0);
                } else if (self.operation == UINavigationControllerOperationPop) {
                    fromT = CATransform3DTranslate(fromT, floorf(-width), 0.0, 200.0);
                    toT = CATransform3DTranslate(fromT, floorf(width*0.03), 0.0, 0.0);
                }
                fromSnapshot.layer.transform = fromT;
                toViewController.view.layer.transform = toT;
            }];
            [UIView addKeyframeWithRelativeStartTime:0.80 relativeDuration:0.20 animations:^{
                toViewController.view.layer.transform = CATransform3DIdentity;
            }];
        } completion:^(BOOL finished) {
            [fromSnapshot removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    
}

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = oldOrigin.y - oldOrigin.y;
    
    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
}



@end
