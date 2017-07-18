//
//  APPTheme.h
//  TDE
//
//  Created by ceo on 2017/7/7.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface APPTheme : NSObject


//颜色

@property (nonatomic, assign) UIStatusBarStyle preferredStatusBarStyle;
@property (nonatomic, strong) UIColor *navigationBarBackgorundColor;
@property (nonatomic, strong) UIColor *navigationBarTitleColor;
@property (nonatomic, strong) UIColor *navigationBarItemColor;
@property (nonatomic, strong) UIColor *viewControllerBackgroundColor;


@property (nonatomic, strong) UIColor *colorOfTitleImportant; //!< #333333 重要文字，标题
@property (nonatomic, strong) UIColor *colorOfTitleNormal; //!< #666666 普通文字
@property (nonatomic, strong) UIColor *colorOfTitleSecondary; //!< #999999 辅助次要文字
@property (nonatomic, strong) UIColor *colorOfTitleSeparate; //!< #e6e6e6 分割线


@property (nonatomic, copy) NSString *backButtonImage;


@end
