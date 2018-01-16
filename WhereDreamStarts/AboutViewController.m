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
    self.title=@"关于家有爱宠";
    MyLabel *lbl=[[MyLabel alloc]init];
    lbl.font=[UIFont systemFontOfSize:14];
    lbl.textColor=[DataSource colorWithHexString:@"000000"];
    lbl.numberOfLines=0;
    [self.view addSubview:lbl];
    lbl.text=@"尊敬的用户您好:\n\n  我们是'家有爱宠'的开发者,我们在未来的时间里将极力打造一款关于家庭萌宠的APP,让您更贴切的了解您的宠物,更多精彩内容敬请期待!";
    lbl.sd_layout.leftSpaceToView(self.view, 20).topSpaceToView(self.view, 100).rightSpaceToView(self.view, 20).autoHeightRatio(0);
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
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
