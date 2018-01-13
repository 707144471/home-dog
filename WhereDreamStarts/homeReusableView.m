//
//  homeReusableView.m
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/13.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "homeReusableView.h"

@implementation homeReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        _name=[[UILabel alloc]init];
        _name.textColor=[DataSource colorWithHexString:@"737373"];
        _name.font=[UIFont systemFontOfSize:14];
        _name.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_name];
        _name.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, 0).bottomSpaceToView(self, 0).rightSpaceToView(self, 0);
        
    }
    return self;
    
}
@end
