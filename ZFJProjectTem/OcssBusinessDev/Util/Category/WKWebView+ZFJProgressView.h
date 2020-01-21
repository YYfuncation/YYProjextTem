//
//  WKWebView+ZFJProgressView.h
//  poseidon
//
//  Created by 张福杰 on 2018/11/28.
//  Copyright © 2018 张福杰. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (ZFJProgressView)

/**
 为WKWebView添加头部进度条

 @param fatherView 父视图
 */
- (void)addZFJProgressView:(UIView *)fatherView;

//WKWebView是否添加过进度条
@property (nonatomic, assign) BOOL isAddProgress;

@end

NS_ASSUME_NONNULL_END
