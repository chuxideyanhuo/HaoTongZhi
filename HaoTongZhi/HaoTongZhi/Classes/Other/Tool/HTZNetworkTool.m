//
//  HTZNetworkTool.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZNetworkTool.h"

@implementation HTZNetworkTool

+ (void)getUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *dictM = [self getFixedParams];
    dictM[@"params"] = params;
    dictM[@"sign"] = [self creatSignWithDictionary:dictM];
    HTZLog(@"dictM:%@",dictM);
    
    //1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //2.发送GET请求
    [mgr GET:url parameters:dictM progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postUrl:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *dictM = [self getFixedParams];
    dictM[@"params"] = params;
    dictM[@"sign"] = [self creatSignWithDictionary:dictM];
    HTZLog(@"dictM:%@",dictM);
    
    //1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //2.发送POST请求
    [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (NSMutableDictionary *)getFixedParams
{
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[@"app_key"] = @"app_ios";
    dictM[@"token"] = @"e4988309195cf1832d9c42acae2c3bc0";
    dictM[@"timestamp"] = [self dateFormat];
    dictM[@"format"] = @"json";
    dictM[@"version"] = @"1.0";
    return dictM;
}

+ (NSString *)dateFormat
{
    // 格式化时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate date];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

//+ (NSString *)creatSignWithDictionary:(NSMutableDictionary *)dictM
//{    NSMutableArray *array = [NSMutableArray array];
//    [dictM enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSString *joineString = [NSString stringWithFormat:@"%@=%@",key,obj];
//        [array addObject:joineString];
//    }];
//    NSArray *arrM = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        NSString *str1 = obj1;
//        NSString *str2 = obj2;
//        NSComparisonResult result = [str1 compare:str2];
//        return result == NSOrderedDescending;
//    }];
//
//    NSString *resultString = [NSString stringWithFormat:@"app_secret%@app_secret",[arrM componentsJoinedByString:@"&"]];
//    HTZLog(@"resultString:%@",resultString);
//    resultString = [[resultString md5] uppercaseString];
//    return resultString;
//}

+ (NSString *)creatSignWithDictionary:(NSMutableDictionary *)dictM
{
    NSArray *keys = [dictM allKeys];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortkeys = [keys sortedArrayUsingDescriptors:@[descriptor]];
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSString *key in sortkeys) {
        NSString *value = [NSString stringWithFormat:@"%@",dictM[key]];
        NSString *joineString = [NSString stringWithFormat:@"%@=%@",key,value];
        [arrM addObject:joineString];
    }
    NSString *resultString = [NSString stringWithFormat:@"app_secret%@app_secret",[arrM componentsJoinedByString:@"&"]];
    resultString = [[resultString md5] uppercaseString];
    return resultString;
}


@end
