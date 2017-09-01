//
//  UIViewController+StatusBarStyle.h
//  AppFoundation
//
//  Created by chenguibang on 2017/8/28.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StatusBarStyleHandle <NSObject>

@optional

// Override this method in UIViewController derived class to handle 'Back' button click

- (UIStatusBarStyle)gb_preferredStatusBarStyle;

@end

@interface UIViewController(StatusBarStyle)

@end
