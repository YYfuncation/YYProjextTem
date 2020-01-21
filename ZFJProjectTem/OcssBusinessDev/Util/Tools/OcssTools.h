//
//  OcssTools.h
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/20.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OcssTools : NSObject

/**
 判断一个网址是http 还是https
 
 @param str 网址
 @return NSURL
 */
+ (NSURL *)smartURLForString:(NSString *)str;

/**
 获取时间戳
 
 @return 获取时间戳
 */
+ (NSString *)getTheTimestamp;

@end

NS_ASSUME_NONNULL_END
