//
//  GBShareCell.m
//  TDE
//
//  Created by ceo on 2017/7/11.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBShareCell.h"
#import <UIButton-SSEdgeInsets/UIButton+SSEdgeInsets.h>
//#import <UIButton+HHAddLayout/UIButton+HHAddLayout.h>
@implementation GBShareCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.iconBtn.hh_layoutStyle = HHButtonLayoutStyleImageOnTheTop;
//    self.iconBtn.hh_preferredMaxImageSize = CGSizeMake(50, 50);
//    self.iconBtn.hh_verticalSpacing = 5;
    self.iconBtn.userInteractionEnabled = NO;
    self.iconBtn.enabled = YES;
}


- (void)setSharePlatform:(GBSSDKSharePlatform *)sharePlatform{
    _sharePlatform = sharePlatform;
    [self.iconBtn setImage:sharePlatform.icon forState:UIControlStateNormal];
    [self.iconBtn setTitle:sharePlatform.name forState:UIControlStateNormal];
}

@end
