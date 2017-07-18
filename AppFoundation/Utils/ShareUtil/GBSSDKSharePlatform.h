//
//  GBSSDKSharePlatform.h
//  TDE
//
//  Created by ceo on 2017/7/12.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/SSDKPlatform.h>


typedef NS_ENUM(NSUInteger, GBSSDKSharePlatformType){
    GBSSDKSharePlatformSafari            = 10001,
};
@interface GBSSDKSharePlatform : SSDKPlatform

@end
