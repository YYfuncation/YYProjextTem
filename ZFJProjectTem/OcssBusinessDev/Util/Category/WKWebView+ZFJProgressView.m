//
//  WKWebView+ZFJProgressView.m
//  poseidon
//
//  Created by 张福杰 on 2018/11/28.
//  Copyright © 2018 张福杰. All rights reserved.
//

#import "WKWebView+ZFJProgressView.h"
//#include <objc/runtime.h>

const static void *ZFJProgressViewString = &ZFJProgressViewString;

static NSString *isAddProgressKey = @"isAddProgressKey";

@implementation WKWebView (ZFJProgressView)

/**
 为WKWebView添加头部进度条
 
 @param fatherView 父视图
 */
- (void)addZFJProgressView:(UIView *)fatherView{
    self.isAddProgress = YES;
    
    [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    if ([self progressView] == nil) {
        UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, fatherView.frame.size.width, 0)];
        progressView.tintColor = APPMainColor;
        progressView.trackTintColor = [UIColor whiteColor];
        objc_setAssociatedObject(self, ZFJProgressViewString, progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [fatherView addSubview:progressView];
    }
    //将进度条置于浏览器上方
    [fatherView insertSubview:self belowSubview:self.progressView];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (object == self && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

- (UIProgressView *)progressView{
    UIProgressView *progressView = objc_getAssociatedObject(self, ZFJProgressViewString);
    return progressView;
}

- (void)setIsAddProgress:(BOOL)isAddProgress{
    objc_setAssociatedObject(self, &isAddProgressKey, [NSNumber numberWithBool:isAddProgress], OBJC_ASSOCIATION_COPY);
}

- (BOOL)isAddProgress{
    return objc_getAssociatedObject(self, &isAddProgressKey);
}

- (void)dealloc{
    if(self.isAddProgress){
        [self removeObserver:self forKeyPath:@"estimatedProgress"];
    }
}

@end
