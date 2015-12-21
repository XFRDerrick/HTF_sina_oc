//
//  OAuthViewController.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/21.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "OAuthViewController.h"

@interface OAuthViewController ()<UIWebViewDelegate>

#pragma mark 授权网页
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation OAuthViewController

#pragma mark 加载webView和设置navBar
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor blueColor];
    
    //加载授权界面 设置导航条
    [self loadAuthPage];
    [self setNavBar];
    
}

- (void)loadView{

    self.webView = [[UIWebView alloc] init];
    self.view = self.webView;
    
    self.webView.delegate = self;
}

- (void)loadAuthPage{

    //获取授权页面
    
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",client_id,redirect_uri];
    NSLog(@"%@",urlStr);
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    

}
- (void)setNavBar{

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"自动填充" style:UIBarButtonItemStylePlain target:self action:@selector(defaultAccout)];
    
    
}
#pragma mark 授权界面的关闭 自动填充账号密码
- (void)close{

//    NSLog(@"点击了授权界面的关闭");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (void)defaultAccout{
    
    NSLog(@"点击了自动填充按钮");
    NSString *jsString = @"document.getElementById('userId').value = 'hetengfei163@126.com' ,document.getElementById('passwd').value = '928hefei928'";
    [_webView stringByEvaluatingJavaScriptFromString:jsString];
    
}





@end
