//
//  AppDelegate.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/11.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "AppDelegate.h"
#import "JYJNavigationController.h"
#import "ViewController.h"
#import "TalkingData.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor =[UIColor whiteColor];
    [TalkingData sessionStarted:@"3A4689E2B4A4407FA29C892BEE01B244" withChannelId:@"ios狗狗百科"];
    
    // 设置窗口的根控制器
    /*
    self.window.rootViewController = [[JYJNavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    [self.window makeKeyAndVisible];
     */
    [self SetController];
    return YES;
}
#pragma mark 设置控制器
-(void)SetController{
    //首页
    ViewController *home=[[ViewController alloc]init];
    UINavigationController *homeNav=[[UINavigationController alloc]initWithRootViewController:home];
    homeNav.tabBarItem= [[UITabBarItem alloc]initWithTitle:@"狗狗百科"image:[UIImage imageNamed:@"icon_username"]tag:1005];
    // 提示信息
    //messageNav.tabBarItem.badgeValue= @"new";
    
    
    //分类
    ClassificationViewController *Classification = [[ClassificationViewController alloc]init];
    UINavigationController *ClassificationNav = [[UINavigationController alloc]initWithRootViewController:Classification];
    ClassificationNav.tabBarItem= [[UITabBarItem alloc]initWithTitle:@"狗狗分类"image:[UIImage imageNamed:@"icon_yanzheng"]tag:1004];
    
    
    // 标签视图控制器，用来管理导航控制器的
    UITabBarController *tabBars = [[UITabBarController alloc]init];
    // 设置背景颜色
    tabBars.tabBar.barTintColor= [UIColor whiteColor];
    // 设置不半透明
    tabBars.tabBar.translucent= NO;
    // 设置选中按钮的颜色
    tabBars.tabBar.tintColor= [[UIColor redColor]colorWithAlphaComponent:0.50];
    tabBars.tabBar.unselectedItemTintColor=[DataSource colorWithHexString:@"4b4b4b"];
    
    // 给标签控制器指定子控制器
    tabBars.viewControllers= [NSArray arrayWithObjects:homeNav,ClassificationNav,nil];
    self.window.rootViewController=tabBars;
    tabBars.delegate= self;
    
}
#pragma mark点击tabBar上按钮时触发
- (void)tabBarController:(UITabBarController*)tabBarController didSelectViewController:(UIViewController*)viewController{
    UINavigationController*navc = (UINavigationController*)viewController;
    navc.tabBarItem.badgeValue= nil;
}
#pragma mark 点击跳转batbar
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    //这里我判断的是当前点击的tabBarItem的标题
    if ([viewController.tabBarItem.title isEqualToString:@"消息"]) {
    
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
