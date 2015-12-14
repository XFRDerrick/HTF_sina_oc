//
//  MainViewController.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/12.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()


//@property (strong ,nonatomic) MainTabBar *mainTabBar;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar removeFromSuperview];
    //设置自定义的Tabbar
    MainTabBar *mainTabBar = [[MainTabBar alloc] init];
    [self setValue:mainTabBar forKeyPath:@"tabBar"];
     [self addChildViewControllers];
    
   
    
}

#pragma mark 添加Tabbar对应的控制器
- (void)addChildViewControllers{
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
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
    navHome.title = title;
    UIImage *image = [UIImage imageNamed:imageName];
    vc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [vc.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    [self addChildViewController:navHome];
//    [self addChildViewController:navHome];
    


}



@end
