//
//  ViewController.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/11.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "ViewController.h"
#import "JYJSliderMenuTool.h"
@interface ViewController ()<UIGestureRecognizerDelegate>
/** tapGestureRec */
@property (nonatomic, weak) UITapGestureRecognizer *tapGestureRec;
/** panGestureRec */
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRec;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 这个方法是为了，不让隐藏状态栏的时候出现view上移
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.title = @"2018 恭喜发财";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor colorWithRed:222 / 255.0 green:91 / 255.0 blue:78 / 255.0 alpha:1.0]}];
    [self addGestures];
    [self setupNav];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
