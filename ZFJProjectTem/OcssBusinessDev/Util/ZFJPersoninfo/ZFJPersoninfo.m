//
//  ZFJPersoninfo.m
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/19.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJPersoninfo.h"

@implementation ZFJPersoninfo

static ZFJPersoninfo *person;

+ (ZFJPersoninfo *)manager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        person = [[super allocWithZone:NULL]init];
    });
    return person;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [ZFJPersoninfo manager];
}

- (id)copyWithZone:(struct _NSZone *)zone{
    return [ZFJPersoninfo manager];
}

- (void)resetPersonInfo{
    
}

- (void)applicationDidReceiveMemoryWarning{
    
}

@end
