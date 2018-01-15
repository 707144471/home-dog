//
//  ChongDingXiangViewController.h
//
//  Created by apple2 on 2018/1/11.
//  Copyright © 2018年 yuanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChongDingXiangBlock)(NSURL *url, NSError *error);
typedef void(^ErrorBlock)(NSError *error);
@interface ChongDingXiangViewController : UIViewController

+ (void)initWithPath:(NSString *)urlStr completion:(ChongDingXiangBlock)completion error:(ErrorBlock)errorBlock;
@end
