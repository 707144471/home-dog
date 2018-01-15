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
    NSArray *_urlArray;
}
@end

@implementation peopleCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _nameArray=@[@"狗民网",@"宠物中国",@"乐乐地带",@"关于狗狗百科"];
    _urlArray=@[@"http://bbs.goumin.com/",@"http://bbs.chinapet.com/",@"http://club.lelezone.com/",@""];
    [self setUI];

    
    
    // Do any additional setup after loading the view.
}
-(void)setUI{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
    view.weight=self.view.bounds.size.width-100;
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *string=@"indexPath";
    peopleCenterCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell=[[peopleCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    if (indexPath.row==3) {
        //[cell.button setImage:[UIImage imageNamed:@"icon_set_mine"] forState:UIControlStateNormal];
    }
    [cell.button setTitle:_nameArray[indexPath.row] forState:UIControlStateNormal];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row<3) {
        WebViewController *webCtrl=[[WebViewController alloc]init];
        webCtrl.urlString=_urlArray[indexPath.row];
        webCtrl.redirect=YES;
        [self.navigationController pushViewController:webCtrl animated:YES];
    }
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
