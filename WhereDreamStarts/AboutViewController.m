//
//  AboutViewController.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/15.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"关于狗狗百科";
    MyLabel *lbl=[[MyLabel alloc]init];
    lbl.font=[UIFont systemFontOfSize:16];
    lbl.textColor=[DataSource colorWithHexString:@"000000"];
    lbl.numberOfLines=0;
    [self.view addSubview:lbl];
    lbl.text=@"尊敬的用户您好:\n  我们着手为您打造一款为狗狗服务的";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
