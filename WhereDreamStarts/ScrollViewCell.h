//
//  ScrollViewCell.h
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/14.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewCell : UITableViewCell<SDCycleScrollViewDelegate>
@property(nonatomic,strong)SDCycleScrollView *scrollView;
@end
