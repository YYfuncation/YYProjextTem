//
//  BaseViewController.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setBaseBackButtonView{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.backgroundColor = KRandomColor;
    backBtn.frame = CGRectMake(0, 0, 25, 25);
    [backBtn setImage:[UIImage imageNamed:@"NavLeftBack"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    [backBtn addTarget:self action:@selector(backPreviousController) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backBtnPushClickNavBar:)]];
}

- (void)backBtnPushClickNavBar:(UITapGestureRecognizer *)tap{
    CGPoint tapPoint = [tap locationInView:self.navigationController.navigationBar];
    if (tapPoint.x <= ScreenWidth * 0.15){
        [self backPreviousController];
    }
}

- (void)backPreviousController{
    if (self.presentingViewController){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
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
