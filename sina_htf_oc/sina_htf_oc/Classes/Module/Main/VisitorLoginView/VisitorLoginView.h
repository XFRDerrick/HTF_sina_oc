//
//  VisitorLoginView.h
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/15.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import <UIKit/UIKit.h>
//实现登录注册的协议只有一个类需要实现此方法
@protocol VisitorLoginViewDelegate <NSObject>
#pragma mark 登录 注册 事件
- (void)UIView:(UIView *)view userWillLoginBtn:(UIButton *)loginBtn;
- (void)UIView:(UIView *)view userWillRegisterBtn:(UIButton *)loginBtn;

@end



@interface VisitorLoginView : UIView

#pragma mark delegate
@property (nonatomic, assign) id<VisitorLoginViewDelegate> delegate;

@end
