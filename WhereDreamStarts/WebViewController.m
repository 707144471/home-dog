//
//  WebViewController.m
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/14.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    if (self.urlString!=nil) {
        if ([self.urlString length]>0) {
            UIWebView *web=[[UIWebView alloc]init];
            web.backgroundColor=[UIColor whiteColor];
            web.delegate=self;
            [self.view addSubview:web];
            web.frame=self.view.bounds;
            [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
        }
    }
    
    // Do any additional setup after loading the view.
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始加载了");
    [FTIndicator showProgressWithmessage:@"正在加载"];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"结束加载了");
    [FTIndicator dismissProgress];
}



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [FTIndicator dismissProgress];
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
