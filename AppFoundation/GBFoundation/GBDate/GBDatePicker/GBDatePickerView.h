//
//  GBDatePickerView.h
//  TDE
//
//  Created by ceo on 2017/7/13.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBDatePickerView : UIView
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (void)pickTimeAt:(UIViewController *)controller;

@end
