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
@interface ViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UITableView *_tableView;
    NSArray *_arrayDogs;
    NSArray *_arrayType;
    NSInteger _indexModel;
}
/** tapGestureRec */
@property (nonatomic, weak) UITapGestureRecognizer *tapGestureRec;
/** panGestureRec */
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRec;

//瀑布流
@property(nonatomic,strong)UICollectionView *collectionView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[DataSource colorWithHexString:@"f5f5f5"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 这个方法是为了，不让隐藏状态栏的时候出现view上移
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.title = @"2018 狗狗百科";
    _indexModel=0;//初始显示第一个
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor colorWithRed:222 / 255.0 green:91 / 255.0 blue:78 / 255.0 alpha:1.0]}];
    [self addGestures];
    [self setupNav];
    //[self CreateASpinSphere];
    [self CreateAClassificationTable];

    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 添加手势
-(void)addGestures{
    // 屏幕边缘pan手势(优先级高于其他手势)
    UIScreenEdgePanGestureRecognizer *leftEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self
                                                                                                          action:@selector(moveViewWithGesture:)];
    leftEdgeGesture.edges = UIRectEdgeLeft;// 屏幕左侧边缘响应
    [self.view addGestureRecognizer:leftEdgeGesture];
    // 这里是地图处理方式，遵守代理协议，实现代理方法
    leftEdgeGesture.delegate = self;

}
#pragma mark 触发手势响应
- (void)moveViewWithGesture:(UIPanGestureRecognizer *)panGes {
    if (panGes.state == UIGestureRecognizerStateEnded) {
        [self profileCenter];
    }
}
#pragma mark 进入个人中心
- (void)profileCenter {
    // 展示个人中心
    [JYJSliderMenuTool showWithRootViewController:self];
}
#pragma mark 添加左右按钮
- (void)setupNav {
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -15;
    
    UIButton *profileButton = [[UIButton alloc] init];
    // 设置按钮的背景图片
    [profileButton setImage:[UIImage imageNamed:@"icon_wendao_name"] forState:UIControlStateNormal];
    [profileButton setImage:[UIImage imageNamed:@"icon_wendao_name"] forState:UIControlStateHighlighted];
    // 设置按钮的尺寸为背景图片的尺寸
    profileButton.frame = CGRectMake(0, 0, 44, 44);
    //监听按钮的点击
    [profileButton addTarget:self action:@selector(profileCenter) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *profile = [[UIBarButtonItem alloc] initWithCustomView:profileButton];
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, profile];
    
    // 右边按钮
    UIButton *searchButton = [[UIButton alloc] init];
    [searchButton setImage:[UIImage imageNamed:@"icon_jubao_dashizhuye"] forState:UIControlStateNormal];
    [searchButton setImage:[UIImage imageNamed:@"icon_jubao_dashizhuye"] forState:UIControlStateHighlighted];
    searchButton.frame = CGRectMake(0, 0, 44, 44);
    [searchButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *msgButton = [[UIButton alloc] init];
    [msgButton setImage:[UIImage imageNamed:@"icon_dashang_change"] forState:UIControlStateNormal];
    [msgButton setImage:[UIImage imageNamed:@"icon_dashang_change"] forState:UIControlStateHighlighted];
    msgButton.frame = CGRectMake(40, 0, 44, 44);
    [msgButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *rightView = [[UIView alloc] init];
    rightView.frame = CGRectMake(0, 0, 88, 44);
    [rightView addSubview:searchButton];
    [rightView addSubview:msgButton];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
}
#pragma mark 用户点击右边按钮执行该方法
-(void)rightClick:(UIButton *)btn{

}

#pragma mark 创建分类表格
-(void)CreateAClassificationTable{
    WEAKSELF
    [DataSource getDogBreeds_block:^(NSMutableArray *typeArray) {
        _arrayType=typeArray;
        [weakSelf relodDatas];
    }];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, 100, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 15;
    //上
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(100, 75, self.view.frame.size.width-100, self.view.frame.size.height-75) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor=[DataSource colorWithHexString:@"f5f5f5"];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"123"];
    [self.collectionView registerClass:[homeReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellHeader"];
    [self.view addSubview:self.collectionView];
    
    
    

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
        dogModel *model=_arrayType[_indexModel];
        view.name.text=model.name;
    }
    
    return view;
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    
    CGSize size={self.view.frame.size.width,30};
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
        if (dog.BaiKeUrlStr!=nil) {
            WebViewController *webCtrl=[[WebViewController alloc]init];
            webCtrl.urlString=dog.BaiKeUrlStr;
            [self.navigationController pushViewController:webCtrl animated:YES];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
