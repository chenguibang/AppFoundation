//
//  GBDatePickerView.h
//  TDE
//
//  Created by ceo on 2017/7/13.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GBDatePickerViewResult)(NSTimeInterval timestamp);

@interface GBDatePickerView : UIView
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic ,strong) GBDatePickerViewResult datePickResult;
- (void)pickTimeAt:(UIViewController *)controller;

@end
