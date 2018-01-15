//
//  ChongDingXiangViewController.m
//
//  Created by apple2 on 2018/1/11.
//  Copyright © 2018年 yuanxin. All rights reserved.
//

#import "ChongDingXiangViewController.h"

@interface ChongDingXiangViewController ()

@end

@implementation ChongDingXiangViewController

+ (void)initWithPath:(NSString *)urlStr completion:(ChongDingXiangBlock)completion error:(ErrorBlock)errorBlock{
    
    NSString*  urlString = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *quest = [NSMutableURLRequest requestWithURL:url];
    quest.HTTPMethod = @"GET";//设置get请求
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:quest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
//        NSLog(@"location2 code: %ld",res.statusCode);
//        NSLog(@"location2重定向之后的地址是: %@",res.URL);
        if (!data) {
            errorBlock(error);
        }else{
            completion(res.URL,error);
        }
    }];
    
    [task resume];
}

@end
