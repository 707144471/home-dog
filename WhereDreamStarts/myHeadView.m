//
//  myHeadView.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/11.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "myHeadView.h"

@implementation myHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        _headBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_headBtn.imageView.layer setBorderColor:[[UIColor redColor]colorWithAlphaComponent:0.40].CGColor];
        [_headBtn.imageView.layer setBorderWidth:4];
        [_headBtn.imageView.layer setMasksToBounds:YES];
        _headBtn.imageView.layer.cornerRadius = 50;
        //设置图片不变形剪切出最适合的一段
        _headBtn.imageView.contentMode =  UIViewContentModeScaleAspectFill;
        _headBtn.imageView.clipsToBounds  = YES;
        _headBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        _headBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        [_headBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_headBtn];
        
        
    }
    return self;
}
-(void)setWeight:(float)weight{

    _headBtn.frame=CGRectMake((weight-150)/2, 25, 150, 133);
    _headBtn.imageView.sd_layout.leftSpaceToView(_headBtn, 25).topSpaceToView(_headBtn, 0).widthIs(100).heightIs(100);
    _headBtn.titleLabel.sd_layout.leftSpaceToView(_headBtn, 0).topSpaceToView(_headBtn.imageView, 3).widthIs(150).heightIs(33);
    //[_headBtn sd_setImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal];
    [_headBtn setImage:[UIImage imageNamed:@"touXiang"] forState:UIControlStateNormal];
    [_headBtn setTitle:@"狗狗百科" forState:UIControlStateNormal];
}
@end
