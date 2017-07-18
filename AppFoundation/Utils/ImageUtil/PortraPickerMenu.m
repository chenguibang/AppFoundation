//
//  PortraPickerMenu.m
//  TDE
//
//  Created by chenguibang on 2017/7/8.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "PortraPickerMenu.h"
#import "UIView+ScottAlertView.h"
@implementation PortraPickerMenu


- (IBAction)cancle:(id)sender {
    [self dismiss];
    if (self.portraPickerMenuBlock) {
        self.portraPickerMenuBlock(0);
    }
}
- (IBAction)camera:(id)sender {
    [self dismiss];
    if (self.portraPickerMenuBlock) {
        self.portraPickerMenuBlock(1);
    }
}
- (IBAction)library:(id)sender {
    [self dismiss];
    if (self.portraPickerMenuBlock) {
        self.portraPickerMenuBlock(2);
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
