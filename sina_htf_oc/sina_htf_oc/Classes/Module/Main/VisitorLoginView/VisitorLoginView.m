//
//  VisitorLoginView.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/15.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "VisitorLoginView.h"

@interface VisitorLoginView ()

#pragma mark 遮挡 阴影 图片
@property (nonatomic, weak) UIImageView *backView;

#pragma mark 房子图片
@property (nonatomic, weak) UIImageView *largeIcon;

#pragma mark 动画图片
@property (nonatomic, weak) UIImageView *circleView;

#pragma mark 描述TextLable
@property (nonatomic, weak) UILabel *tipLable;

#pragma mark 注册按钮
@property (nonatomic, weak) UIButton *registerBtn;

#pragma mark 登录按钮
@property (nonatomic, weak) UIButton *loginBtn;

@end


@implementation VisitorLoginView

#pragma mark 设置视图UI
- (void)setupInfo:(NSString *)tipText WithImageName:(NSString *)imageName{

    self.tipLable.text = tipText;
    if (imageName) {
        self.circleView.image = [UIImage imageNamed:imageName];
        _largeIcon.hidden = YES;
        [self bringSubviewToFront:self.circleView];
    }else{
        //开始动画
        [self startAnimation];
    }

}

//手动布局

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if ( self) {
      
        [self setupUI];
        self.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
        
    }
    return self;
}

//circle动画
- (void)startAnimation{

    CABasicAnimation *basicAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    basicAnim.repeatCount = MAXFLOAT;
    basicAnim.duration = 10.0;
    basicAnim.toValue = @(2 * M_PI);
//    basicAnim.byValue =
    //当动画界面 时区活动状态是 动画不移除
    basicAnim.removedOnCompletion = NO;
    
    [self.circleView.layer addAnimation:basicAnim forKey:nil];

}


//#warning initWithCoder:aDecoder 是否需要实现

#pragma mark 子控件的初始化布局

- (void)setupUI{
    
    [self createSubViews];
    
    //设置手动布局
    for (UIView *subview in self.subviews) {
        //将自动布局enable
        [subview setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    //为各个subView手动布局
    
    //house
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.largeIcon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.largeIcon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-60]];
    //circle
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.circleView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.largeIcon  attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.circleView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.largeIcon  attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    //backView
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.circleView  attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.backView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.circleView  attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    //Lable
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tipLable attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.circleView  attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tipLable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.circleView attribute:NSLayoutAttributeBottom multiplier:1 constant:16]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tipLable attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:240]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tipLable attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60]];
    
    //button 的约束
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:35]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginBtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.tipLable  attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loginBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.tipLable  attribute:NSLayoutAttributeBottom multiplier:1 constant:20]];
    //button 的约束
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registerBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registerBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:35]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registerBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.tipLable  attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.registerBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.tipLable  attribute:NSLayoutAttributeBottom multiplier:1 constant:20]];
    
    
    //为两个button设置事件
    [self.loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)createSubViews{
    
    //三个ImageVIew
    UIImageView *backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"visitordiscover_feed_mask_smallicon"]];
    self.backView = backView;
    
    UIImageView *largeIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"visitordiscover_feed_image_house"]];
    self.largeIcon = largeIcon;
    
    UIImageView *circleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"visitordiscover_feed_image_smallicon"]];
    self.circleView = circleView;
    
    //一个Lable
    UILabel *tipLable = [[UILabel alloc] init];
    tipLable.text = @"关注一些人，回这里看看有什么惊喜，关注一些人，回这里看看有什么惊喜";
    tipLable.textColor = [UIColor darkGrayColor];
    [tipLable setTextAlignment:NSTextAlignmentCenter];
    
    [tipLable setFont:[UIFont systemFontOfSize:14]];
    [tipLable setNumberOfLines:0];
    [tipLable sizeToFit];
    self.tipLable = tipLable;
    
    //两个button 需要添加方法
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [loginBtn setTitleColor:themeColor forState:UIControlStateNormal];
    [loginBtn sizeToFit];
    self.loginBtn = loginBtn;
    
    UIButton *registerBtn = [[UIButton alloc] init];
    [registerBtn setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [registerBtn setTitleColor:themeColor forState:UIControlStateNormal];
    [registerBtn sizeToFit];
    self.registerBtn = registerBtn;
    
    [self addSubview:circleView];
    [self addSubview:backView];
    [self addSubview:largeIcon];
    
    [self addSubview:tipLable];
    [self addSubview:loginBtn];
    [self addSubview:registerBtn];

}

#pragma mark 协议方法的调用
- (void)loginBtnClick:(UIButton *)loginBtn {
    
    if ([self.delegate respondsToSelector:@selector(UIView:userWillLoginBtn:)]) {
        
        [self.delegate UIView:self userWillLoginBtn:loginBtn];
    }
}
- (void)registerBtnClick:(UIButton *)registerBtn{
    
    if ([self.delegate respondsToSelector:@selector(UIView:userWillRegisterBtn:)]) {
        
        [self.delegate UIView:self userWillRegisterBtn:registerBtn];
    }

}






@end
