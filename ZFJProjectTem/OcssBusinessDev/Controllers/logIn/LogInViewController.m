//
//  LogInViewController.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiConfig];
}

- (void)uiConfig{
    self.view.backgroundColor = KRandomColorAp(0.5);
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = KRandomColor;
    [self.view addSubview:button];
    
    button.whc_Width(150)
    .whc_Height(150)
    .whc_LeftSpace((ScreenWidth - 150)/2)
    .whc_TopSpace((ScreenHeight - 150)/2);
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [MGJRouter openURLToWebViewWithVC:self urlStr:@"zfj1128.blog.csdn.net" userInfo:@{@"title":@"博客"}];
    }];
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
