//
//  WebViewController.h
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/14.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
//网址
@property(nonatomic,copy)NSString *urlString;
//是否需要重定向
@property(nonatomic,assign)BOOL redirect;
@end
