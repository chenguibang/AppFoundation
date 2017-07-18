//
//  GBAdvPageView.m
//  TDE
//
//  Created by ceo on 2017/7/17.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBAdvPageView.h"

@implementation GBAdvPageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
         [self removeFromSuperview];
    }];
   
}

@end
