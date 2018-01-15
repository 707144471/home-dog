//
//  AdaptiveCell.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/15.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "AdaptiveCell.h"

@implementation AdaptiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _content=[[MyLabel alloc]init];
        _content.textColor=[DataSource colorWithHexString:@"737373"];
        _content.numberOfLines=0;
        _content.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:_content];
    }
    return self;
}
-(void)setStr:(NSString *)str{

    _content.text=str;
    _content.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).autoHeightRatio(0);
    [self setupAutoHeightWithBottomView:_content bottomMargin:10];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
