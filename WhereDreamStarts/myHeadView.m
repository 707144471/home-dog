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
        [_headBtn.layer setBorderColor:[UIColor yellowColor].CGColor];
        [_headBtn.layer setBorderWidth:2];
        [_headBtn.layer setMasksToBounds:YES];
        _headBtn.layer.cornerRadius = 50;
        //设置图片不变形剪切出最适合的一段
        _headBtn.imageView.contentMode =  UIViewContentModeScaleAspectFill;
        _headBtn.imageView.clipsToBounds  = YES;
        [self addSubview:_headBtn];
        
        _headBtn.backgroundColor=[UIColor redColor];
        
    }
    return self;
}
-(void)setWeight:(float)weight{

    _headBtn.frame=CGRectMake((weight-100)/2, 25, 100, 100);
}
@end
