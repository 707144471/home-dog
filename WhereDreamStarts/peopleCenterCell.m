//
//  peopleCenterCell.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/11.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "peopleCenterCell.h"

@implementation peopleCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _button=[UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _button.titleLabel.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_button];
        _button.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 15);
        _button.imageView.sd_layout.leftSpaceToView(_button, 0).topSpaceToView(_button, 5).widthIs(20).heightIs(20);
        _button.titleLabel.sd_layout.leftSpaceToView(_button.imageView, 3).topEqualToView(_button.imageView).rightSpaceToView(_button, 0).bottomEqualToView(_button.imageView);
        //[_button sd_setImageWithURL:[NSURL URLWithString:@"http://www.jituwang.com/uploads/allimg/150203/258887-1502031KP212.jpg"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"link"] forState:UIControlStateNormal];
        //_button.imageView.backgroundColor=[UIColor redColor];
        
        
        UIImageView *img=[[UIImageView alloc]init];
        img.image=[UIImage imageNamed:@"icon_right"];
        [self.contentView addSubview:img];
        img.sd_layout.rightSpaceToView(self.contentView, 10).topSpaceToView(self.contentView, 14).widthIs(22).heightIs(22);
        
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
