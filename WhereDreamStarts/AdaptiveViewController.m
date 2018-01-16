//
//  AdaptiveViewController.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/15.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "AdaptiveViewController.h"
#import "AdaptiveCell.h"
@interface AdaptiveViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_modelArray;//内容描述
}

@end

@implementation AdaptiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=self.titleStr;
    [self CreateAClassificationTable];
    // Do any additional setup after loading the view.
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

    return [tableView cellHeightForIndexPath:indexPath model:self.model.arrayModel[indexPath.row] keyPath:@"str" cellClass:[AdaptiveCell class] contentViewWidth:self.view.frame.size.width];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.model.arrayModel!=nil) {
        return self.model.arrayModel.count;
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Cell_init(@"adaotivecell", AdaptiveCell)
    if ([self.titleStr isEqualToString:@"寿命排行"]) {

        cell.str=[NSString stringWithFormat:@"第%ld名: %@",indexPath.row+1,self.model.arrayModel[indexPath.row]];
    }else if ([self.titleStr isEqualToString:@"世界犬种智商排行"]||[self.titleStr isEqualToString:@"驯养常识"]||[self.titleStr isEqualToString:@"医疗常识"]||[self.titleStr isEqualToString:@"学习才艺"]||[self.titleStr isEqualToString:@"生活习性"]){
        cell.str=[NSString stringWithFormat:@"%@",self.model.arrayModel[indexPath.row]];
    }
    return cell;
    
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
