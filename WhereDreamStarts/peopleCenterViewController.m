//
//  peopleCenterViewController.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/11.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "peopleCenterViewController.h"
#import "myHeadView.h"
#import "peopleCenterCell.h"
@interface peopleCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView *_tableView;
    NSArray *_nameArray;
}
@end

@implementation peopleCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _nameArray=@[@"我的账单",@"我的房间",@"我的管家",@"客服",@"系统设置"];
    [self setUI];

    
    
    // Do any additional setup after loading the view.
}
-(void)setUI{
    _tableView=[[UITableView alloc]init];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _tableView.frame = self.view.bounds;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _nameArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 183;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    myHeadView *view=[[myHeadView alloc]init];
    view.weight=self.view.bounds.size.width;
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *string=@"indexPath";
    peopleCenterCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell=[[peopleCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    [cell.button setTitle:_nameArray[indexPath.row] forState:UIControlStateNormal];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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