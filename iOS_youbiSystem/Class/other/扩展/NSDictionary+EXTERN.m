//
//  NSDictionary+EXTERN.m
//  fanmore---
//
//  Created by lhb on 15/5/29.
//  Copyright (c) 2015年 HT. All rights reserved.
//  进行字典asig参数的拼接

#import "NSDictionary+EXTERN.h"
#import "MD5Encryption.h"


@implementation NSDictionary (EXTERN)



+ (NSString *)asignWithMutableDictionary:(NSMutableDictionary *)dict{
    
    //计算asign参数
    NSArray * arr = [dict allKeys];
    [arr enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString * cc = [dict objectForKey:obj];
        if (cc.length==0) {
            //            NSLog(@"%@",cc);
            [dict removeObjectForKey:obj];
        }
        
    }];
    //计算asign参数
    arr = [dict allKeys];
    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
        return [obj1 compare:obj2] == NSOrderedDescending;
    }];
    NSMutableString * signCap = [[NSMutableString alloc] init];
    //进行asign拼接
    for (NSString * dicKey in arr) {
        [signCap appendString:[NSString stringWithFormat:@"%@=%@&",dicKey,[dict valueForKey:dicKey]]];
    }
    NSString * aa = [signCap substringToIndex:signCap.length-1];
    NSString * cc  = [NSString stringWithFormat:@"%@%@",aa,HTYMRSCREAT];
    NSString *temp = [NSString stringWithCString:[cc  UTF8String] encoding:NSUTF8StringEncoding];
    return [MD5Encryption md5by32:temp];
}


//+ (NSString *)asignByWeiXinPayMutableDictionary:(NSMutableDictionary *)dict{
//    //计算asign参数
//    NSArray * arr = [dict allKeys];
//    arr = [arr sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
//        return [obj1 compare:obj2] == NSOrderedDescending;
//    }];
//    NSMutableString * signCap = [[NSMutableString alloc] init];
//    //进行asign拼接
//    for (NSString * dicKey in arr) {
//        [signCap appendString:[NSString stringWithFormat:@"%@&%@",dicKey,[dict valueForKey:dicKey]]];
//    }
//    NSString * aaa= [signCap substringToIndex:signCap.length];
//    [NSString stringWithFormat:@"%@&%@",aaa,WeiXinPaySigNkey];
//    
//    return nil;
//}
@end
