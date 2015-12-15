//
//  BaseTableViewController.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/15.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "BaseTableViewController.h"
#import "VisitorLoginView.h"

@interface BaseTableViewController ()

#pragma mark 用户登录状态
@property (nonatomic, assign) BOOL isLogin;

#pragma mark 新建的访客视图
@property (nonatomic, strong) VisitorLoginView *visitorLoginView;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)loadView{
    
    if (_isLogin) {
        [super loadView];
    }else{
        [self setVisitorLoginView];
    }
}

#pragma mark 创建访客视图
- (void)setVisitorLoginView{

    self.visitorLoginView = [[VisitorLoginView alloc] init];
    
    //替换tabViewController的View
    self.view = self.visitorLoginView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(userWillLogin)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(userWillRegister)];
    
    
}

#pragma mark 登录 注册 事件
- (void)userWillLogin{

    NSLog(@"用户点击了登录按钮");

}

- (void)userWillRegister{
    
    NSLog(@"用户点击了注册按钮");

}




@end
