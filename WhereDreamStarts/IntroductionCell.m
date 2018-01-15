//
//  IntroductionCell.m
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/14.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "IntroductionCell.h"

@implementation IntroductionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _tieBaBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _tieBaBtn.tag=1;
        [self.contentView addSubview:_tieBaBtn];
        _tieBaBtn.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(self.contentView, 10).widthIs(WIDTH/2-20).bottomSpaceToView(self.contentView, 10);
        [_tieBaBtn setTitle:@"狗狗贴吧" forState:UIControlStateNormal];
        [_tieBaBtn setBackgroundImage:[UIImage imageNamed:@"001"] forState:UIControlStateNormal];
        _tieBaBtn.imageView.contentMode =  UIViewContentModeScaleAspectFill;
        [DataSource SetRoundedCorners:_tieBaBtn Angle:5];
        [_tieBaBtn setTitleColor:[DataSource colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        _tieBaBtn.titleLabel.font=[UIFont systemFontOfSize:16];
        //阴影颜色
        _tieBaBtn.titleLabel.shadowColor = [UIColor blackColor];
        
        
        _yiYuanBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _yiYuanBtn.tag=2;
        [self.contentView addSubview:_yiYuanBtn];
        _yiYuanBtn.sd_layout.rightSpaceToView(self.contentView, 10).topSpaceToView(self.contentView, 10).widthIs(WIDTH/2-20).bottomSpaceToView(self.contentView, 10);
        [_yiYuanBtn setTitle:@"狗狗简介" forState:UIControlStateNormal];
        _yiYuanBtn.imageView.contentMode =  UIViewContentModeScaleAspectFill;
        [_yiYuanBtn setBackgroundImage:[UIImage imageNamed:@"003"] forState:UIControlStateNormal];
        [DataSource SetRoundedCorners:_yiYuanBtn Angle:5];
        [_yiYuanBtn setTitleColor:[DataSource colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        _yiYuanBtn.titleLabel.font=[UIFont systemFontOfSize:16];
        //阴影颜色
        _yiYuanBtn.titleLabel.shadowColor = [UIColor blackColor];
        
    }
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
