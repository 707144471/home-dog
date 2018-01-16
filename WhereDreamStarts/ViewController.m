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
#import "DescribeCell.h"
#import "AdaptiveViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_arrayType;
    NSArray *_modelArray;//内容描述
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
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)] ;
    titleLabel.text = @"家有萌宠";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
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

    
    [DataSource addModelArrayDatas_block:^(NSMutableArray *dogArray) {
        _modelArray=dogArray;
        [_tableView reloadData];
    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 150;
    }else if (indexPath.row==1){
        return 70;
    }
    return 70;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _modelArray.count+2;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row>1) {
        //进入寿命排行
        self.hidesBottomBarWhenPushed=YES;
        AdaptiveViewController *Adaptive=[[AdaptiveViewController alloc]init];
        if (_modelArray.count>indexPath.row-2) {
            Adaptive.model=_modelArray[indexPath.row-2];
        }
        if (indexPath.row==2) {
            Adaptive.titleStr=@"寿命排行";
        }else if (indexPath.row==3){
            Adaptive.titleStr=@"世界犬种智商排行";
        }else if (indexPath.row==4){
            Adaptive.titleStr=@"驯养常识";
        }else if (indexPath.row==5){
            Adaptive.titleStr=@"医疗常识";
        }else if (indexPath.row==6){
            Adaptive.titleStr=@"学习才艺";
        }else if (indexPath.row==7){
            Adaptive.titleStr=@"生活习性";
        }
        
        [self.navigationController pushViewController:Adaptive animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }

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
        Cell_init(@"DescribeCell", DescribeCell)
        if (_modelArray.count>indexPath.row-2) {
            cell.model=_modelArray[indexPath.row-2];
        }
        return cell;
    }

}
#pragma mark 用户点击贴吧或者简介执行该方法
-(void)onTieBaYiYuanClick:(UIButton *)btn{
    NSString *urlString;
    if (btn.tag==1) {
        //贴吧
        urlString =@"http://tieba.baidu.com/f?kw=%B9%B7%B9%B7&fr=ala0&tpl=5";
    }else if (btn.tag==2){
        //宠物医院
        urlString=@"https://baike.baidu.com/item/%E7%8B%97/85474?fr=aladdin";
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
