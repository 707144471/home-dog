//
//  homeCell.h
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/13.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *dogPhoto;
@property(nonatomic,strong)MyLabel *dogName;
@property(nonatomic,copy)NSString *stringName;
@property(nonatomic,strong)dogModel *model;
@end
