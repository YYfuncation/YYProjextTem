//
//  AFNetWorkManager.h
//  OcssBusiness
//
//  Created by 张福杰 on 2019/6/20.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFNetWorkManager : NSObject

+ (void)requestDataBaseWithURLByPOST:(NSString *)urlStr parameters:(id)parameters completed:(void(^)(id responseObject))completed;

@end

NS_ASSUME_NONNULL_END
