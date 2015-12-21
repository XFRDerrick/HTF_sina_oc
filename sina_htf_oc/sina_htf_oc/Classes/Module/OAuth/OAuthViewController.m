//
//  OAuthViewController.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/21.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "OAuthViewController.h"

@interface OAuthViewController ()<UIWebViewDelegate>

#pragma mark 授权webView
@property (nonatomic, weak) UIWebView *webView;


@end

@implementation OAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    //加载授权界面 设置导航条
    
    
    
}

- (void)loadView{

    self.view = self.webView;
    
    self.webView.delegate = self;
}

- (void)loadAuthPage{

    
    

}



@end
