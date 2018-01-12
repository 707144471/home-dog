//
//  DataSource.h
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/12.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject


#pragma mark 首页球体获取数据
+(void)getDogBreeds_block:(void(^)(NSMutableArray *dogArray))block;
#pragma mark -颜色值
+(UIColor *)colorWithHexString:(NSString *)color;
@end
