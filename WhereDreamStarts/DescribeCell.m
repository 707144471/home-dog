//
//  DescribeCell.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/15.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "DescribeCell.h"

@implementation DescribeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _ImgView=[[UIImageView alloc]init];
        [DataSource SetRoundedCorners:_ImgView Angle:6];
        _ImgView.contentMode =  UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_ImgView];
        _ImgView.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(self.contentView, 5).widthIs(60).bottomSpaceToView(self.contentView, 5);
        
        
        _titleLbl=[[MyLabel alloc]init];
        _titleLbl.font=[UIFont systemFontOfSize:16];
        _titleLbl.textColor=[DataSource colorWithHexString:@"000000"];
        [self.contentView addSubview:_titleLbl];
        _titleLbl.sd_layout.leftSpaceToView(_ImgView, 5).topEqualToView(_ImgView).rightSpaceToView(self.contentView, 0).heightIs(16);
        
        _content=[[MyLabel alloc]init];
        _content.font=[UIFont systemFontOfSize:14];
        _content.textColor=[DataSource colorWithHexString:@"737373"];
        _content.verticalAlignment=VerticalAlignmentTop;
        _content.numberOfLines=0;
        [self.contentView addSubview:_content];
        _content.sd_layout.leftEqualToView(_titleLbl).topSpaceToView(_titleLbl, 5).bottomEqualToView(_ImgView).rightSpaceToView(self.contentView, 10);

    }
    return self;
}
-(void)setModel:(DogIntroducedModel *)model{

    _ImgView.image=[UIImage imageNamed:model.Img];
    _titleLbl.text=model.title;
    _content.text=model.content;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
