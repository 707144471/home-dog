//
//  ViewController.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/11.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "ViewController.h"
#import "JYJSliderMenuTool.h"
#import "homeReusableView.h"
#import "homeCell.h"
#import "homeTableViewCell.h"
#import "ScrollViewCell.h"
#import "IntroductionCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_arrayType;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[DataSource colorWithHexString:@"f5f5f5"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout =UIRectEdgeNone;
    // 这个方法是为了，不让隐藏状态栏的时候出现view上移
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"狗狗百科";
    [self setupNav];
    [self CreateAClassificationTable];

    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark 进入个人中心
- (void)profileCenter {
    // 展示个人中心
    //[JYJSliderMenuTool showWithRootViewController:self];
    [DataSource goPeopleCenter:self];
}
#pragma mark 添加左右按钮
- (void)setupNav {
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -15;
    UIButton *profileButton = [[UIButton alloc] init];
    // 设置按钮的背景图片
    [profileButton setImage:[UIImage imageNamed:@"icon_paidui_s"] forState:UIControlStateNormal];
    [profileButton setImage:[UIImage imageNamed:@"icon_paidui_s"] forState:UIControlStateHighlighted];
    // 设置按钮的尺寸为背景图片的尺寸
    profileButton.frame = CGRectMake(0, 0, 44, 44);
    //监听按钮的点击
    [profileButton addTarget:self action:@selector(profileCenter) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *profile = [[UIBarButtonItem alloc] initWithCustomView:profileButton];
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, profile];
    
}

#pragma mark 创建分类表格
-(void)CreateAClassificationTable{
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 200;
    }else if (indexPath.row==1){
        return 70;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        Cell_init(@"acrollViewcell", ScrollViewCell)
        return cell;
    }else if (indexPath.row==1){
        Cell_init(@"IntroductionCell", IntroductionCell)
        [cell.tieBaBtn addTarget:self action:@selector(onTieBaYiYuanClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.yiYuanBtn addTarget:self action:@selector(onTieBaYiYuanClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
        
    }else{
        Cell_init(@"nullcell", NULLCell)
        return cell;
    }

}
#pragma mark 用户点击贴吧或者医院执行该方法
-(void)onTieBaYiYuanClick:(UIButton *)btn{
    NSString *urlString;
    if (btn.tag==1) {
        //贴吧
        urlString =@"http://tieba.baidu.com/f?kw=%B9%B7%B9%B7&fr=ala0&tpl=5";
    }else if (btn.tag==2){
        //宠物医院
        urlString=@"https://baike.baidu.com/item/%E5%AE%A0%E7%89%A9%E5%8C%BB%E9%99%A2/8711885?fr=aladdin";
    }
    self.hidesBottomBarWhenPushed=YES;
    WebViewController *webCtrl=[[WebViewController alloc]init];
    webCtrl.urlString=urlString;
    [self.navigationController pushViewController:webCtrl animated:YES];
    self.hidesBottomBarWhenPushed=NO;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
