//
//  UIColor+color.h
//  poseidon
//
//  Created by ZFJ on 16/3/2.
//  Copyright © 2016年 张福杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (color)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(CGFloat )alpha;

@end
