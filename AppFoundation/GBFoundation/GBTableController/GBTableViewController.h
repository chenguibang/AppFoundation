//
//  GBTableViewController.h
//  TDE
//
//  Created by ceo on 2017/7/10.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RefreshControl/UIScrollView+RefreshControl.h>
@interface GBTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, assign) NSUInteger pageIndex;

- (void)addTopRefreshControlUsingBlock:(void (^)())callback;
- (void)addBottomRefreshControlUsingBlock:(void (^)())callback;


@end
