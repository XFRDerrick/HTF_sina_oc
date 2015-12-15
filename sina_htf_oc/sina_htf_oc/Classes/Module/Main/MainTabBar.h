//
//  MainTabBar.h
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/13.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MainTabBarDelegate <NSObject>

- (void)tabBar:(UITabBar *)tabBar didSelectPlusButton:(UIButton *)plusButton;

@end

@interface MainTabBar : UITabBar

#pragma mark delegate
@property (nonatomic, assign) id<MainTabBarDelegate> delegate;

@end
