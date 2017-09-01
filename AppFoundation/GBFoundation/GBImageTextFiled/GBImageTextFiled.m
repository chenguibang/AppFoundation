//
//  GBImageTextFiled.m
//  AppFoundation
//
//  Created by chenguibang on 2017/7/31.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBImageTextFiled.h"
#import <UITextField+GBExt.h>
@implementation GBImageTextFiled


- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(0, 0, 20, 20);
        [self setInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView = _imageView;
        
    }
    return _imageView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
