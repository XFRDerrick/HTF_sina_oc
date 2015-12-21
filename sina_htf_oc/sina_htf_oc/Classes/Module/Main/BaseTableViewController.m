//
//  BaseTableViewController.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/15.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "BaseTableViewController.h"
#import "VisitorLoginView.h"

@interface BaseTableViewController ()<VisitorLoginViewDelegate>
#pragma mark 用户登录状态
@property (nonatomic, assign) BOOL isLogin;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.visitorLoginView.delegate = self;
    
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
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(UIView:userWillLoginBtn:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(UIView:userWillRegisterBtn:)];
    
    
}

#pragma mark 登录 注册 事件
- (void)UIView:(UIView *)view userWillLoginBtn:(UIButton *)loginBtn{
    NSLog(@"用户点击了登录按钮");
   
    //跳转到授权页面
    OAuthViewController *oauth = [[OAuthViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:oauth];
    [self presentViewController:nav animated:YES completion:nil];
    
    
}
- (void)UIView:(UIView *)view userWillRegisterBtn:(UIButton *)loginBtn{
    NSLog(@"用户点击了注册按钮");

}





@end
