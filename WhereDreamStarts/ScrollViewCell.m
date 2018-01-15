//
//  ScrollViewCell.m
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/14.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "ScrollViewCell.h"

@implementation ScrollViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _scrollView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 0, 0) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _scrollView.autoScroll=YES;
        _scrollView.autoScrollTimeInterval =5;
        _scrollView.pageControlDotSize=CGSizeMake(8, 8);
        _scrollView.currentPageDotColor=[DataSource colorWithHexString:@"#ffffff"];
        _scrollView.pageDotColor=[UIColor redColor];
        [self.contentView addSubview:_scrollView];
        _scrollView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
        _scrollView.imageURLStringsGroup=@[
                                           @"scroll001",
                                           @"scroll002",
                                           @"scroll004"];
    }
    return self;
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
