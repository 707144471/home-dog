//
//  ClassificationViewController.m
//  WhereDreamStarts
//
//  Created by 韩少林 on 2018/1/14.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "ClassificationViewController.h"
#import "homeReusableView.h"
#import "homeCell.h"
#import "homeTableViewCell.h"
@interface ClassificationViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UITableView *_tableView;
    NSArray *_arrayDogs;
    NSArray *_arrayType;
    NSInteger _indexModel;
}
//瀑布流
@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation ClassificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[DataSource colorWithHexString:@"f5f5f5"];
    self.title=@"狗狗分类";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout =UIRectEdgeNone;
    // 这个方法是为了，不让隐藏状态栏的时候出现view上移
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.navigationController.navigationBar.translucent = NO;
    _indexModel=0;//初始显示第一个
    [self setupNav];
    [self CreateAClassificationTable];
    // Do any additional setup after loading the view.
}
#pragma mark 创建分类表格
-(void)CreateAClassificationTable{
    WEAKSELF
    [DataSource getDogBreeds_block:^(NSMutableArray *typeArray) {
        _arrayType=typeArray;
        [weakSelf relodDatas];
    }];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).widthIs(100);
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 15;
    //上
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(100, 0, self.view.frame.size.width-100, self.view.frame.size.height) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor=[DataSource colorWithHexString:@"f5f5f5"];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"123"];
    [self.collectionView registerClass:[homeReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellHeader"];
    [self.view addSubview:self.collectionView];
    self.collectionView.sd_layout.leftSpaceToView(_tableView, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_arrayType!=nil) {
        return _arrayType.count;
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _indexModel=indexPath.row;
    [self relodDatas];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *stringStr=@"indexPath";
    homeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:stringStr];
    if (!cell) {
        cell=[[homeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringStr];
    }
    dogModel *model=_arrayType[indexPath.row];
    cell.model=model;
    if (indexPath.row==_indexModel) {
        cell.backgroundColor=[DataSource colorWithHexString:@"f5f5f5"];
    }else{
        cell.backgroundColor=[DataSource colorWithHexString:@"ffffff"];
    }
    
    return cell;
}

#pragma mark 瀑布流delegate
//社区区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader ]){
        reuseIdentifier = @"cellHeader";
    }
    homeReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        //dogModel *model=_arrayType[_indexModel];
        //view.name.text=model.name;
    }
    return view;
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    
    CGSize size={self.view.frame.size.width,0};
    return size;
}

//返回区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每区返回的行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_arrayDogs!=nil) {
        return _arrayDogs.count;
    }
    return 0;
}
//构建单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    homeCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    cell.backgroundColor=[DataSource colorWithHexString:@"f5f5f5"];
    [DataSource SetRoundedCorners:cell.contentView Angle:6];
    UIView *bjView=[[UIView alloc]init];
    bjView.backgroundColor=[UIColor whiteColor];
    [DataSource SetRoundedCorners:bjView Angle:6];
    [cell.contentView addSubview:bjView];
    bjView.frame=CGRectMake(0, 0, 70, 100);
    
    
    UIImageView *_dogPhoto=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
    [DataSource SetRoundedCorners:_dogPhoto Angle:6];
    //设置图片不变形剪切出最适合的一段
    _dogPhoto.contentMode =  UIViewContentModeScaleAspectFill;
    [cell.contentView addSubview:_dogPhoto];
    
    MyLabel *_dogName=[[MyLabel alloc]initWithFrame:CGRectMake(5, 71, 60, 29)];
    _dogName.verticalAlignment=VerticalAlignmentTop;
    _dogName.textColor=[DataSource colorWithHexString:@"737373"];
    _dogName.font=[UIFont systemFontOfSize:12];
    _dogName.numberOfLines=2;
    _dogName.backgroundColor=[UIColor whiteColor];
    [cell.contentView addSubview:_dogName];
    if (_arrayDogs.count>indexPath.row) {
        dogModel *model=_arrayDogs[indexPath.row];
        [_dogPhoto sd_setImageWithURL:[NSURL URLWithString:model.PhotoAddress]];
        _dogName.text=model.name;
    }
    
    return cell;
}

//点击cell 执行该方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (_arrayDogs.count>indexPath.row) {
        dogModel *dog=_arrayDogs[indexPath.row];
        if (dog.name!=nil) {
            self.hidesBottomBarWhenPushed=YES;
            WebViewController *webCtrl=[[WebViewController alloc]init];
            webCtrl.urlString=[NSString stringWithFormat:@"https://baike.baidu.com/item/%@",dog.name];
            webCtrl.redirect=YES;
            [self.navigationController pushViewController:webCtrl animated:YES];
            self.hidesBottomBarWhenPushed=NO;
        }
    }
    
}
-(CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGSize size =CGSizeMake(70, 100);
    return size;
}
#pragma mark 刷新数据
-(void)relodDatas{
    WEAKSELF
    [DataSource getDogsList:_arrayType[_indexModel] index:_indexModel block:^(NSMutableArray *dogArray) {
        _arrayDogs=dogArray;
        [_tableView reloadData];
        [weakSelf.collectionView reloadData];
    }];
    
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
#pragma mark 进入个人中心
-(void)profileCenter{
    [DataSource goPeopleCenter:self];
    
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
