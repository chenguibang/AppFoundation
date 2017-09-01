//
//  UINavigationController+StatusBarStyle.m
//  TDE
//
//  Created by chenguibang on 2017/7/10.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "UINavigationController+StatusBarStyle.h"
#import "APPManager.h"
#import "UIViewController+StatusBarStyle.h"
@implementation UINavigationController(StatusBarStyle)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    UIViewController<StatusBarStyleHandle> *topViewController = self.topViewController;
    if ([topViewController respondsToSelector:@selector(gb_preferredStatusBarStyle)]) {
        return [topViewController gb_preferredStatusBarStyle];;
    }
    return [APPManager shared].theme.preferredStatusBarStyle;
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
