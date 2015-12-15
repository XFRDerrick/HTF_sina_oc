
//
//  BaseTableViewController.h
//  sina_htf_oc
//
//  Created by 赫腾飞 on 15/12/15.
//  Copyright © 2015年 hetefe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VisitorLoginView;

@interface BaseTableViewController : UITableViewController

#pragma mark 新建的访客视图
@property (nonatomic, strong) VisitorLoginView *visitorLoginView;

@end
