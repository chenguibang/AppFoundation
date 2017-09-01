//
//  GBShareView.h
//  TDE
//
//  Created by ceo on 2017/7/11.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBSSDKSharePlatform.h"
#import "GBShareParam.h"
@interface GBShareView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    UIImageView *rightTip;
}
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UICollectionView *topContentView;
@property (nonatomic, strong) UICollectionView *bottomContentView;
@property (nonatomic, strong) NSMutableArray *topIcons;
@property (nonatomic, strong) NSMutableArray *bottomIcons;
@property (nonatomic ,strong) GBShareParam *shareParam;

- (void)showAt:(UIViewController *)controller;

- (void)showAt:(UIViewController *)controller shareParam:(GBShareParam *)shareParam;

- (void)setDefultView;



@end
