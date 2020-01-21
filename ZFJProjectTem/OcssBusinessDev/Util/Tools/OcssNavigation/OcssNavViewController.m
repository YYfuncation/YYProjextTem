//
//  OcssNavViewController.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "OcssNavViewController.h"

@interface OcssNavViewController ()<UINavigationControllerDelegate>

@end

@implementation OcssNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataConfig];
}

- (void)dataConfig{
    self.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if(_animationType == AnimationeTopType || _animationType == AnimationeCoverType || _animationType == AnimationRotateType){
        OcssNavAnimation *ZFJAnimation = [[OcssNavAnimation alloc]init];
        ZFJAnimation.operation = operation;
        ZFJAnimation.animationType = _animationType;
        return (id)ZFJAnimation;
    }
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
