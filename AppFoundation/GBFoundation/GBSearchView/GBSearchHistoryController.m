//
//  GBSearchHistoryController.m
//  TDE
//
//  Created by chenguibang on 2017/7/8.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBSearchHistoryController.h"

@interface GBSearchHistoryController ()

@end

@implementation GBSearchHistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.titleView = AppFoundationXIBView(@"GBSearchView");
    self.navigationItem.hidesBackButton = YES;
    
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:nil target:nil action:nil];
    self.navigationItem.rightBarButtonItem = cancle;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
