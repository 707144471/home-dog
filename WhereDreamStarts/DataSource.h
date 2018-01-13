//
//  DataSource.h
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/12.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dogModel.h"
@interface DataSource : NSObject

#pragma mark 首页球体获取数据
+(void)getDogBreeds_block:(void(^)(NSMutableArray *typeArray))block;
#pragma mark -颜色值
+(UIColor *)colorWithHexString:(NSString *)color;
#pragma mark 设置圆角
+(void)SetRoundedCorners:(UIView *)view Angle:(float)Angle;
#pragma mark 获取狗狗列表数据
+(void)getDogsList:(dogModel *)model index:(NSInteger)idx block:(void(^)(NSMutableArray *dogArray))block;
@end
