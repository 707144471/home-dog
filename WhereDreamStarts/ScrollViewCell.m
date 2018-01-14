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
        _scrollView.imageURLStringsGroup=@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515925117258&di=35a3ae431a5031e88bf540d65f30dde6&imgtype=0&src=http%3A%2F%2Ftupian.enterdesk.com%2Fuploadfile%2F2012%2F0712%2F20120712021519751.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515925150985&di=c4c9971821edefc6bba6c53404ffe2dd&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F3%2F544a2133b3049.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515925196630&di=d77562b6c7d2c122d0548267ac7ab4e5&imgtype=0&src=http%3A%2F%2Fpic35.photophoto.cn%2F20150507%2F0035035968823220_b.jpg"];
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
