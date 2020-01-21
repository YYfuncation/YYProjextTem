//
//  OBCommon.h
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#ifndef OBCommon_h
#define OBCommon_h

//屏幕的宽高
#define ScreenWidth    [UIScreen mainScreen].bounds.size.width
#define ScreenHeight   [UIScreen mainScreen].bounds.size.height

#define WEAKBLOCK __weak typeof(self) weakSelf = self;

//单利
#define PersonInfo [ZFJPersoninfo manager]

//appSckeme:应用注册scheme
#define KAppScheme @"APPOBD"

//有没有刘海
#define IsHaveLiuHai ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896.0)
#define KNavBarHei (IsHaveLiuHai ? 88 : 64)
#define KTabBarHei (IsHaveLiuHai ? 83 : 49)

//RGB颜色
#define KTCColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KTCColorAp(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define KRandomColor KTCColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define KRandomColorAp(ap) KTCColorAp(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), ap)

//APP主色调
#define APPMainColor KTCColor(238, 52, 9)

//16进制颜色
#define UIColorWithHexA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:(a)]
#define UIColorWithHex(rgbValue)    UIColorWithHexA(rgbValue, 1.0)

//RootViewController
#define KRootViewController [UIApplication sharedApplication].delegate.window.rootViewController

#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\n方法名:%s 行数:%d 内容:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define setFrameY(view, newY) view.frame = CGRectMake(view.frame.origin.x, newY, view.frame.size.width, view.frame.size.height)
#define setFrameX(view, newX) view.frame = CGRectMake(newX, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define setFrameH(view, newH) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, newH)

#define W(view)    view.frame.size.width
#define H(view)    view.frame.size.height
#define X(view)    view.frame.origin.x
#define Y(view)    view.frame.origin.y

//路由转发父控制器
#define KRouter_FVC @"KRouter_FVC"

//路由转发webviewVC的url
#define KRouter_WebVC_URL @"KRouter_WebVC_URL"

//路由转发动画
#define KRouter_ONAnimationType @"KRouter_ONAnimationType"

//路由转发地址——PUSH
#define KRouterPush(vc_name) [NSString stringWithFormat:@"%@://%@/PushMainVC",KAppScheme,vc_name]

//网络请求超时时间
#define KTimeoutInterval 120.0

#endif /* OBCommon_h */
