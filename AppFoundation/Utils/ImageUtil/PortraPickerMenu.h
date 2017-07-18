//
//  PortraPickerMenu.h
//  TDE
//
//  Created by chenguibang on 2017/7/8.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PortraPickerMenuBlock)(NSInteger index);
@interface PortraPickerMenu : UIView

@property (nonatomic ,strong) PortraPickerMenuBlock portraPickerMenuBlock;

@end
