//
//  BaseController.m
//  TDE
//
//  Created by ceo on 2017/7/7.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "BaseController.h"
#import "UIViewController+BackButtonHandler.h"
#import "APPManager.h"
@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [APPManager shared].theme.viewControllerBackgroundColor;
    [self setupView];
    [self setupData];
    
}

- (void)setupView{
    
}

- (void)setupData{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) navigationShouldPopOnBackButton ///在这个方法里写返回按钮的事件处理
{
    return YES;
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
