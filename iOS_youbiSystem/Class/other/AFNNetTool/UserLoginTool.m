//
//  UserLoginTool.m
//  fanmore---
//
//  Created by lhb on 15/5/21.
//  Copyright (c) 2015年 HT. All rights reserved.
//

#import "UserLoginTool.h"
#import <AFNetworking.h>
#import "NSDictionary+EXTERN.h"


@interface UserLoginTool()

@end



@implementation UserLoginTool


+ (void)loginRequestPostWithFile:(NSString *)urlStr action:(NSString *) action parame:(NSMutableDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure withFileKey:(NSString *)key{
    
    
    NSString *time = apptimesSince1970;
    NSMutableDictionary * paramsOption = [NSMutableDictionary dictionary];
    paramsOption[@"action"] = action;
    paramsOption[@"_timestamp"] = time;
    paramsOption[@"_hottag"] =@"1";
    paramsOption[@"_md5"] = [MD5Encryption md5by32:DeviceNo];
    
    if (params != nil) {
        [paramsOption addEntriesFromDictionary:params];
    }

    NSString *sign = [NSDictionary asignWithMutableDictionary:paramsOption];  //计算asign
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:action forHTTPHeaderField:@"action"];
    [manager.requestSerializer setValue:sign forHTTPHeaderField:@"sign"];
    [manager.requestSerializer setValue:time forHTTPHeaderField:@"_timestamp"];
    [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"_hottag"];
    [manager.requestSerializer setValue:[MD5Encryption md5by32:DeviceNo] forHTTPHeaderField:@"_md5"];
    
    
    [manager POST:urlStr parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}



@end
