//
//  GBShareView.m
//  TDE
//
//  Created by ceo on 2017/7/11.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBShareView.h"
#import "GBShareCell.h"
#import "APPManager.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDK/ShareSDK+Base.h>
@implementation GBShareView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor =  [APPManager shared].theme.viewControllerBackgroundColor;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/4,SCREEN_WIDTH/4);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.topContentView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/4) collectionViewLayout:flowLayout];
        self.topContentView.backgroundColor = self.backgroundColor;
        self.topContentView.showsHorizontalScrollIndicator = NO;
        self.topContentView.delegate = self;
        self.topContentView.dataSource = self;
        [self.topContentView registerNib:[UINib nibWithNibName:@"GBShareCell" bundle:nil] forCellWithReuseIdentifier:@"TopCell"];
        [self addSubview:self.topContentView];
        
        
        
        UICollectionViewFlowLayout *flowLayout_bottom = [[UICollectionViewFlowLayout alloc]init];
        flowLayout_bottom.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout_bottom.itemSize = CGSizeMake(SCREEN_WIDTH/4,SCREEN_WIDTH/4);
        flowLayout_bottom.minimumLineSpacing = 0;
        flowLayout_bottom.minimumInteritemSpacing = 0;
        flowLayout_bottom.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        self.bottomContentView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topContentView.frame), SCREEN_WIDTH, SCREEN_WIDTH/4) collectionViewLayout:flowLayout_bottom];
        self.bottomContentView.showsHorizontalScrollIndicator = NO;
        self.bottomContentView.backgroundColor = self.backgroundColor;
        self.bottomContentView.delegate = self;
        self.bottomContentView.dataSource = self;
        [self.bottomContentView registerNib:[UINib nibWithNibName:@"GBShareCell" bundle:nil] forCellWithReuseIdentifier:@"BottomCell"];
        [self addSubview:self.bottomContentView];
        
        
        
        self.cancelBtn = [[UIButton alloc]init];
        [self addSubview:self.cancelBtn];
        self.cancelBtn.frame = CGRectMake(0, CGRectGetMaxY(self.bottomContentView.frame), SCREEN_WIDTH, 40);
        self.cancelBtn.backgroundColor = [UIColor whiteColor];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn setTitleColor:[APPManager shared].theme.colorOfTitleNormal forState:UIControlStateNormal];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.cancelBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        UIView *line = [[UIView alloc]init];
        [self.cancelBtn addSubview:line];
        line.frame = CGRectMake(0, 0, self.cancelBtn.frame.size.width, 1);
        line.backgroundColor = [APPManager shared].theme.colorOfTitleSeparate;
        
        
        UIView *midLine = [[UIView alloc]init];
        [self addSubview:midLine];
        midLine.backgroundColor = [APPManager shared].theme.colorOfTitleSeparate;
        midLine.frame = CGRectMake(20, CGRectGetMinY(self.bottomContentView.frame), self.bottomContentView.frame.size.width-40,1);
    }
    return self;
}



- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        
    
        
        
        
    }
    return self;
}


- (void)showAt:(UIViewController *)controller{
//    [self.topContentView reloadData];
//    [self.bottomContentView reloadData];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(self.cancelBtn.frame));
    ScottAlertViewController *alertController = [ScottAlertViewController alertControllerWithAlertView:self preferredStyle:ScottAlertControllerStyleActionSheet];
    alertController.tapBackgroundDismissEnable = YES;
    [controller presentViewController:alertController animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.topContentView setContentOffset:CGPointMake((self.topContentView.contentSize.width - self.topContentView.frame.size.width) > 50 ? 50:(self.topContentView.contentSize.width - self.topContentView.frame.size.width) , 0) animated:YES];
        
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.topContentView setContentOffset:CGPointMake(0, 0) animated:YES];
        [self.bottomContentView setContentOffset:CGPointMake((self.bottomContentView.contentSize.width - self.bottomContentView.frame.size.width) > 50 ? 50 :(self.bottomContentView.contentSize.width - self.bottomContentView.frame.size.width) , 0) animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.bottomContentView setContentOffset:CGPointMake(0, 0) animated:YES];
    });
}

#pragma mark - collectionView_delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [collectionView isEqual:_topContentView] ? self.topIcons.count : self.bottomIcons.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GBShareCell *cell = nil;
    
    
    if ([self.topContentView isEqual:collectionView]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopCell" forIndexPath:indexPath];
        cell.sharePlatform = self.topIcons[indexPath.row];
    }else  if ([self.bottomContentView isEqual:collectionView]) {
         cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BottomCell" forIndexPath:indexPath];
        cell.sharePlatform = self.bottomIcons[indexPath.row];
    }
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self dismiss];
    GBShareCell *cell = (GBShareCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    NSLog(@"分享到%@",cell.iconBtn.titleLabel.text);
    
    
    
    
    
    
    //1、创建分享参数（必要）
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                     images:[UIImage imageNamed:@"传入的图片名"]
                                        url:[NSURL URLWithString:@"http://mob.com"]
                                      title:@"分享标题"
                                       type:SSDKContentTypeAuto];
    
    // 定制新浪微博的分享内容
    [shareParams SSDKSetupSinaWeiboShareParamsByText:@"定制新浪微博的分享内容"                                       title:nil
                                               image:[UIImage imageNamed:@"传入的图片名"]
                                                 url:nil
                                            latitude:0
                                           longitude:0
                                            objectID:nil
                                                type:SSDKContentTypeAuto];
    
    // 定制微信好友的分享内容
    [shareParams SSDKSetupWeChatParamsByText:@"定制微信的分享内容"                 title:@"title"
                                         url:[NSURL URLWithString:@"http://mob.com"]
                                  thumbImage:nil
                                       image:[UIImage imageNamed:@"传入的图片名"]
                                musicFileURL:nil
                                     extInfo:nil
                                    fileData:nil
                                emoticonData:nil
                                        type:SSDKContentTypeAuto  forPlatformSubType:SSDKPlatformSubTypeWechatSession];// 微信好友子平台

    
    [shareParams SSDKSetupMailParamsByText:@"邮件文本内容" title:@"邮件分享" images:@"" attachments:nil recipients:nil ccRecipients:nil bccRecipients:nil type:SSDKContentTypeAuto];
    
    if (cell.sharePlatform.type == GBSSDKSharePlatformSafari) {
        NSURL* url = [[ NSURL alloc ] initWithString :@"http://www.baidu.com"];
        [[UIApplication sharedApplication ]openURL:url];
    }
    
    
    [ShareSDK share:cell.sharePlatform.type parameters:shareParams onAuthorize:^(SSDKAuthorizeStateChangedHandler authorizeStateChangedHandler) {
        
    } onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
    }];
}
- (void)setDefultView{
    NSDictionary *plathInfos = @{
                                 
                                 [NSNumber numberWithUnsignedInteger:SSDKPlatformTypeQQ]:@{
                                         @"title":@"手机QQ",
                                         @"icon":@"QQ好友sns_icon_24",
                                         
                                         },
                                 
                                 [NSNumber numberWithUnsignedInteger:SSDKPlatformSubTypeQZone]:@{
                                         @"title":@"QQ空间",
                                         @"icon":@"QQ空间sns_icon_6",
                                         
                                         },
                                 
                                 [NSNumber numberWithUnsignedInteger:SSDKPlatformTypeWechat]:@{
                                         @"title":@"微信好友",
                                         @"icon":@"微信sns_icon_22",
                                         
                                         },
                                 
                                 [NSNumber numberWithUnsignedInteger:SSDKPlatformSubTypeWechatTimeline]:@{
                                         @"title":@"朋友圈",
                                         @"icon":@"朋友圈sns_icon_23",
                                         
                                         },
                                 
                                 [NSNumber numberWithUnsignedInteger:SSDKPlatformTypeSinaWeibo]:@{
                                         @"title":@"微博",
                                         @"icon":@"新浪微博sns_icon_1",
                                         
                                         },
                                 
                                 [NSNumber numberWithUnsignedInteger:SSDKPlatformTypeSMS]:@{
                                         @"title":@"短信",
                                         @"icon":@"sharesms",
                                        
                                         },
                                 
                                 [NSNumber numberWithUnsignedInteger:SSDKPlatformTypeCopy]:@{
                                         @"title":@"复制链接",
                                         @"icon":@"shareLink",
                                         
                                         },
                                 
                                 [NSNumber numberWithUnsignedInteger:GBSSDKSharePlatformSafari]:@{
                                         @"title":@"Safari打开",
                                         @"icon":@"sharesafari",
                                         
                                         },
                                 
                                 [NSNumber numberWithUnsignedInteger:SSDKPlatformTypeMail]:@{
                                         @"title":@"邮件",
                                         @"icon":@"sharemail",
                                         },
                                 };
    NSMutableArray<GBSSDKSharePlatform *> *platFroms = [[NSMutableArray alloc]init];
    for (NSNumber *type in [ShareSDK activePlatforms]) {
        GBSSDKSharePlatform *platFrom = [[GBSSDKSharePlatform alloc]init];
        platFrom.type = type.unsignedIntegerValue;
        NSDictionary *pinfo = [plathInfos objectForKey:type];
        platFrom.name = pinfo[@"title"];
        platFrom.icon = [UIImage imageNamed:pinfo[@"icon"]];
        [platFroms addObject:platFrom];
        
        if ([@[@(SSDKPlatformTypeCopy),@(SSDKPlatformTypeMail),@(SSDKPlatformTypeSMS),@(GBSSDKSharePlatformSafari)] containsObject:type]) {
            [self.bottomIcons addObject:platFrom];
        }else{
            [self.topIcons addObject:platFrom];
        }
        
        
    }
    
    [self.topContentView reloadData];
    [self.bottomContentView reloadData];
}

- (NSMutableArray *)topIcons{
    if (!_topIcons) {
        _topIcons = [[NSMutableArray alloc]init];
    }
    return _topIcons;
}

- (NSMutableArray *)bottomIcons{
    if (!_bottomIcons) {
        _bottomIcons = [[NSMutableArray alloc]init];
    }
    return _bottomIcons;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
