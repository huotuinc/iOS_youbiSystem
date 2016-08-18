//
//  UserLoginTool.h
//  fanmore---
//
//  Created by lhb on 15/5/21.
//  Copyright (c) 2015年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface UserLoginTool : NSObject

/*账户网络请求Get*/

+ (void)loginRequestPostWithFile:(NSString *)urlStr action:(NSString *)action parame:(NSMutableDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure withFileKey:(NSString *)key;

@end
