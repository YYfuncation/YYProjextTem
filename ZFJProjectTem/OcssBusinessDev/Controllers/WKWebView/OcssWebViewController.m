//
//  OcssWebViewController.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/20.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "OcssWebViewController.h"

@interface OcssWebViewController ()<WKNavigationDelegate,WKUIDelegate>

@property (strong, nonatomic) WKWebView *wkWebView;

@end

@implementation OcssWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBaseBackButtonView];
    [self configUI];
}

- (void)configUI {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];

    [self.wkWebView addZFJProgressView:self.view];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[OcssTools smartURLForString:_urlStr] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:KTimeoutInterval];
    [self.wkWebView loadRequest:request];
}

- (void)backPreviousController{
    if (self.wkWebView.canGoBack) {
        [self.wkWebView goBack];
    }else {
        if(self.presentingViewController){
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if ([webView.URL.absoluteString hasPrefix:@"https://itunes.apple.com"]) {
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];
        decisionHandler(WKNavigationActionPolicyCancel);
    }else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    [MBProgressHUD showMBProgressHUDLoding:nil];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [MBProgressHUD removeMBProgressHUDLoding:nil];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [MBProgressHUD removeMBProgressHUDLoding:nil];
    [MBProgressHUD showError:@"加载失败"];
}

- (WKWebView *)wkWebView{
    if(_wkWebView == nil){
        _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - KNavBarHei)];
        _wkWebView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _wkWebView.backgroundColor = [UIColor whiteColor];
        _wkWebView.navigationDelegate = self;
        _wkWebView.UIDelegate = self;
    }
    return _wkWebView;
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
