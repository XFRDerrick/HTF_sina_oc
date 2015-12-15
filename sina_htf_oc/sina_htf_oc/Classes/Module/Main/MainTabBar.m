//
//  MainTabBar.m
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/13.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import "MainTabBar.h"

@interface MainTabBar ()
@property (weak ,nonatomic) UIButton *plusBtn;
@end

@implementation MainTabBar

@dynamic delegate;

#pragma mark 添加add 按钮
- (instancetype)initWithFrame:(CGRect)frame{
    
    CGRect  rect = self.frame;
    
    self = [super initWithFrame:rect];
    if (self) {
        [self addPlushBtn];
    }
    return self;
    
}


#pragma mark 对Tabbaritem 进行手动布局
- (void)layoutSubviews{

    [super layoutSubviews];
    float w = [UIScreen mainScreen].bounds.size.width / 5;
    float h = self.frame.size.height;
    
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGFloat index = 0;
    NSInteger count = self.subviews.count;
    NSLog(@"count = %zd",count);
    for (int i = 0; i < count; i++) {
        UIView *childView = self.subviews[i];
//        NSLog(@"%@",NSStringFromClass([childView class]));
        
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            childView.frame = CGRectOffset(rect, index * w , 0);
          
            index += (index == 1) ? 2 : 1;
        }
        
    }
    //设置加号按钮的frame
    self.plusBtn.frame = CGRectOffset(rect, 2 * w, 0);

}
#pragma mark 创建addBtn的方法
- (void)addPlushBtn{

    UIButton *plusBtn = [[UIButton alloc] init];
    //设置backImage  and  Image
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
#pragma mark 为按钮添加单击事件
    [plusBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [plusBtn sizeToFit];
    self.plusBtn = plusBtn;
    [self addSubview:plusBtn];
}

-(void)plusBtnClick:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectPlusButton:)]) {
        [self.delegate tabBar: self didSelectPlusButton:btn];
    }

}


@end
