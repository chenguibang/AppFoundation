//
//  GBTextFiled.m
//  TDE
//
//  Created by chenguibang on 2017/7/8.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBTextFiled.h"

@implementation GBTextFiled

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIScrollView *view in self.subviews)
    {
        if ([view isKindOfClass:[UIScrollView class]])
        {
            CGPoint offset = view.contentOffset;
            if (offset.y != 0)
            {
                offset.y = 0;
                view.contentOffset = offset;
            }
            break;
        }
    }
}

@end
