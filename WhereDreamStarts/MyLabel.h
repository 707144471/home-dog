//
//  MyLabel.h
//  wenbenjuzuo
//
//  Created by 123 on 2017/9/28.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,VerticalAlignment){
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom
};
@interface MyLabel : UILabel

@property (nonatomic,assign) VerticalAlignment verticalAlignment;

@end
