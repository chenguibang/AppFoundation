//
//  GBSexPickView.h
//  BShop
//
//  Created by chenguibang on 2017/8/10.
//  Copyright © 2017年 chenguibang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SexPickResult)(NSInteger index,NSString* sexName);

@interface GBSexPickView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>{
    NSArray *datas;
}
@property (weak, nonatomic) IBOutlet UIPickerView *sexPicker;
@property (nonatomic ,strong) SexPickResult sexPickResult;

- (void)showAt:(UIViewController*)controller;

@end
