//
//  DescribeCell.h
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/15.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescribeCell : UITableViewCell
@property(nonatomic,strong)UIImageView *ImgView;
@property(nonatomic,strong)MyLabel *titleLbl;
@property(nonatomic,strong)MyLabel *content;
@property(nonatomic,strong)DogIntroducedModel *model;
@end
