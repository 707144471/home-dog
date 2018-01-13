//
//  homeTableViewCell.m
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/13.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "homeTableViewCell.h"

@implementation homeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _name=[[UILabel alloc]init];
        _name.textColor=[DataSource colorWithHexString:@"000000"];
        _name.font=[UIFont systemFontOfSize:14];
        _name.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_name];
        _name.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0);
        
    }
    return self;
}
-(void)setModel:(dogModel *)model{
    _name.text=model.name;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
