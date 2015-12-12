//
//  MainViewController.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/12.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "MainViewController.h"

#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addChildViewController];
    
    
}


- (void)addChildViewController{
    
    
    HomeTableViewController *homeVC = [[HomeTableViewController alloc] init];
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:homeVC];
    navHome.title = @"首页";
    
    [self addChildViewController:navHome];
    
    
    
    


}

@end
