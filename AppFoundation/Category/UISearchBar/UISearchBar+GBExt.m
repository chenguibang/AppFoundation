//
//  UISearchBar+GBExt.m
//  AppFoundation
//
//  Created by chenguibang on 2017/9/1.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "UISearchBar+GBExt.h"
#import <BlocksKit/BlocksKit+UIKit.h>

@implementation UISearchBar(GBExt)

- (void)gb_addToolBar{
    UISearchBarToolBar *tool = AppFoundationXIBView(@"UISearchBarToolBar");
    tool.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    self.inputAccessoryView = tool;
    [tool.doneBtn bk_whenTapped:^{
        [self resignFirstResponder];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
