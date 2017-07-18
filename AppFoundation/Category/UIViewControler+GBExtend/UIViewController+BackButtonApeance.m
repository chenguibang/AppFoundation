//
//  UINavigationcontroller+GBExtend.m
//  TreasureBox
//
//  Created by chenguibang on 16/8/13.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "UIViewController+BackButtonApeance.h"
#import "UIImage+GBExpand.h"
#import "APPManager.h"
@implementation UIViewController(BackButtonApeance)

+ (void)load
{
    Method originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(gbback_viewWillAppear:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)gbback_viewWillAppear:(BOOL)animated
{
    // Forward to primary implementation.
    [self gbback_viewWillAppear:animated];
    UIImage *backButtonImage = [[UIImage imageNamed:[APPManager shared].theme.backButtonImage] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *buttonItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UINavigationBar class]]];
    UIOffset offset;
    offset.horizontal = -500;
    
    [buttonItem setBackButtonTitlePositionAdjustment:offset forBarMetrics:UIBarMetricsDefault];
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    
    
    self.navigationItem.titleView.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
//    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"12"]];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage gb_imageWithColor:[APPManager shared].theme.navigationBarBackgorundColor] forBarMetrics:UIBarMetricsDefault];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
//    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"5"]];
  
   
}

//-(void)setTitle:(NSString *)title{
//    self.navigationItem.title = title;
//   
//}

-(void)backAction{
    
}

@end
