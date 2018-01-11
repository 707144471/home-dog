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
        _button.imageView.sd_layout.leftSpaceToView(_button, 0).topSpaceToView(_button, 0).widthIs(30).heightIs(30);
        _button.titleLabel.sd_layout.leftSpaceToView(_button.imageView, 3).topEqualToView(_button.imageView).rightSpaceToView(_button, 0).bottomEqualToView(_button.imageView);
        //[_button sd_setImageWithURL:[NSURL URLWithString:@"http://www.jituwang.com/uploads/allimg/150203/258887-1502031KP212.jpg"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"icon_wendao_name"] forState:UIControlStateNormal];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
