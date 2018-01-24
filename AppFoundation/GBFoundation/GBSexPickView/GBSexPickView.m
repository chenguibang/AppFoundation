//
//  GBSexPickView.m
//  BShop
//
//  Created by chenguibang on 2017/8/10.
//  Copyright © 2017年 chenguibang. All rights reserved.
//

#import "GBSexPickView.h"
#import "APPManager.h"
#import <ScottAlertController/ScottAlertViewController.h>
#import "ScottAlertViewController+BlurEffects.h"
#import <AppFoundation/AppFoundation.h>
#import <ScottAlertController/UIView+ScottAlertView.h>
@implementation GBSexPickView




- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        datas = @[@"男",@"女",@"保密"];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)showAt:(UIViewController *)controller{
    self.sexPicker.delegate = self;
    self.sexPicker.dataSource = self;
    [self.sexPicker reloadAllComponents];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    self.backgroundColor = [APPManager shared].theme.viewControllerBackgroundColor;
    ScottAlertViewController *alertController = [ScottAlertViewController alertControllerWithAlertView:self preferredStyle:ScottAlertControllerStyleActionSheet];
    alertController.tapBackgroundDismissEnable = YES;
    [controller presentViewController:alertController animated:YES completion:nil];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return datas.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return datas[row];
}

- (IBAction)cancle:(id)sender {
    [self dismiss];
}

- (IBAction)sure:(id)sender {
    if (self.sexPickResult) {
        self.sexPickResult([self.sexPicker selectedRowInComponent:0], datas[[self.sexPicker selectedRowInComponent:0]]);
    }
    
    [self dismiss];
}



@end
