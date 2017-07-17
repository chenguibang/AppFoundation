//
//  GBShareCell.h
//  TDE
//
//  Created by ceo on 2017/7/11.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBSSDKSharePlatform.h"
@interface GBShareCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@property (nonatomic, strong) GBSSDKSharePlatform *sharePlatform;
@end
