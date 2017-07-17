//
//  SlipPageController.h
//  TDE
//
//  Created by ceo on 2017/7/7.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBSlipPageController : UIViewController

@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, strong) UIViewController *leftController;
@property (nonatomic, strong) UIViewController *mainController;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIColor *maskViewColor;
@property (nonatomic, assign) BOOL hideMenu;

- (void)showLeftController;

- (void)hideLeftController;

@end
