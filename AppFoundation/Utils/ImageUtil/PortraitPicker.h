//
//  PortraitPicker.h
//  TDE
//
//  Created by ceo on 2017/7/7.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TZImagePickerController/TZImagePickerController.h>


typedef void(^ImagePickBlock)(NSMutableArray *selectedPhotos,NSMutableArray *selectedAssets);

@interface PortraitPicker : NSObject
@property(nonatomic, strong) UIViewController *baseController;
/// Default is 9 / 默认最大可选9张图片
@property (nonatomic, assign) NSInteger maxImagesCount;
/// The minimum count photos user must pick, Default is 0
/// 最小照片必选张数,默认是0
@property (nonatomic, assign) NSInteger minImagesCount;

@property (nonatomic, assign) BOOL showSelectBtn;   ///< 在单选模式下，照片列表页中，显示选择按钮,默认为NO
@property (nonatomic, assign) BOOL allowCrop;       ///< 允许裁剪,默认为YES，showSelectBtn为NO才生效
@property (nonatomic, assign) CGRect cropRect;      ///< 裁剪框的尺寸
@property (nonatomic, assign) BOOL needCircleCrop;  ///< 需要圆形裁剪框
@property (nonatomic, assign) NSInteger circleCropRadius;  ///< 圆形裁剪框半径大小
@property (nonatomic, copy) void (^cropViewSettingBlock)(UIView *cropView);     ///< 自定义裁剪框的其他属性


- (void)pickImage:(BOOL)isCropper  atBase:(UIViewController *)viewController complete:(ImagePickBlock)complicte;

@end
