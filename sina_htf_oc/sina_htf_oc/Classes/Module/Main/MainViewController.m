//
//  MainViewController.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/12.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <MainTabBarDelegate>


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置自定义的Tabbar
    MainTabBar *mainTabBar = [[MainTabBar alloc] init];
    [self setValue:mainTabBar forKeyPath:@"tabBar"];
     [self addChildViewControllers];

}

#pragma mark 加号按钮的点击事件
- (void)tabBar:(UITabBar *)tabBar didSelectPlusButton:(UIButton *)plusButton{

    NSLog(@"点击了加号按钮");
    
}


#pragma mark 添加Tabbar对应的控制器
- (void)addChildViewControllers{
    
//    self.tabBar.tintColor = [UIColor orangeColor];
    self.tabBar.tintColor = themeColor;
    
    [self addChildViewController:[[HomeTableViewController alloc] init] withTitle:@"首页" withImageName:@"tabbar_home"];
    
    [self addChildViewController:[[MessageTableViewController alloc] init] withTitle:@"消息" withImageName:@"tabbar_message_center"];
    [self addChildViewController:[[DiscoverTableViewController alloc] init] withTitle:@"发现" withImageName:@"tabbar_discover"];
    [self addChildViewController:[[ProfileTableViewController alloc] init] withTitle:@"我" withImageName:@"tabbar_profile"];
    
    
}

#pragma mark 创建Tabbar
- (void)addChildViewController:(UIViewController *)vc withTitle:(NSString *)title withImageName:(NSString *)imageName{
    
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    vc.tabBarItem.title = title;
//    navHome.title = title;
    UIImage *image = [UIImage imageNamed:imageName];
    vc.tabBarItem.image = image;//[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:navHome];

}



@end
