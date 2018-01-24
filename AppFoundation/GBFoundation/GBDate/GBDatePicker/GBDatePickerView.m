//
//  GBDatePickerView.m
//  TDE
//
//  Created by ceo on 2017/7/13.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBDatePickerView.h"
#import "APPManager.h"
#import <ScottAlertController/ScottAlertViewController.h>
#import <ScottAlertController/ScottAlertViewController+BlurEffects.h>
#import <ScottAlertController/UIView+ScottAlertView.h>
#import <NSDate+GBExt.h>
@implementation GBDatePickerView



- (void)pickTimeAt:(UIViewController *)controller{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    self.backgroundColor = [APPManager shared].theme.viewControllerBackgroundColor;
    ScottAlertViewController *alertController = [ScottAlertViewController alertControllerWithAlertView:self preferredStyle:ScottAlertControllerStyleActionSheet];
    alertController.tapBackgroundDismissEnable = YES;
    [controller presentViewController:alertController animated:YES completion:nil];
}


- (IBAction)dateChange:(id)sender {
    
}

- (IBAction)cancel:(id)sender {
    [self dismiss];
}
- (IBAction)reset:(id)sender {
    [self.datePicker setDate:[NSDate date] animated:YES];
}
- (IBAction)sure:(id)sender {
    
    if (self.datePickResult) {
        self.datePickResult([self.datePicker.date gb_timestamp13]);
    }
    [self dismiss];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
