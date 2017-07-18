//
//  UIButton+HHAddLayout.h
//  UIButton-HHAddLayout
//
//  Created by YunSL on 17/3/29.
//  Copyright © 2017年 YunSL. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 默认的图片预期宽高,hh_preferredMaxImageSize为此值时将默认使用图片原本的宽高
 */
#define HHDefaultPreferredMaxImageSize CGSizeMake(-1, -1)

/**
 按钮内文本和图片的布局风格
 
 - HHButtonLayoutStyleSystem:           默认的系统风格
 - HHButtonLayoutStyleImageOnTheLeft:   图片在文字左边
 - HHButtonLayoutStyleImageOnTheTop:    图片在文字上边
 - HHButtonLayoutStyleImageOnTheRight:  图片在文字右边
 - HHButtonLayoutStyleImageOnTheBottom: 图片在文字下边
 */
typedef NS_ENUM(NSInteger,HHButtonLayoutStyle) {
    HHButtonLayoutStyleSystem = 0,
    HHButtonLayoutStyleImageOnTheLeft = 1,
    HHButtonLayoutStyleImageOnTheTop,
    HHButtonLayoutStyleImageOnTheRight,
    HHButtonLayoutStyleImageOnTheBottom
};

@interface UIButton (HHAddLayout)
/**
 图片和文本的布局风格
 默认为HHButtonLayoutStyleSystem
 */
@property (nonatomic,assign) HHButtonLayoutStyle hh_layoutStyle;
/**
 预期图片宽高
 默认为HHDefaultPreferredMaxImageSize
 此时将使用图片本身的宽高,否则将通过hh_preferredMaxLayoutWidth(sizeToFit:)或者button.frame(setFrame:)重新计算合适的图片宽高
 */
@property (nonatomic,assign) CGSize hh_preferredMaxImageSize;
/**
 sizeToFit时button的预期最宽宽度
 默认为CGFLOAT_MAX,此时宽度无限制延伸
 */
@property (nonatomic,assign) CGFloat hh_preferredMaxLayoutWidth;
/**
 图片和文本的水平间距,在HHButtonLayoutStyleImageOnTheLeft或HHButtonLayoutStyleImageOnTheRight使用
 默认为0
 */
@property (nonatomic,assign) CGFloat hh_horizontalSpacing;
/**
 图片和文本的垂直间距,在HHButtonLayoutStyleImageOnTheTop或HHButtonLayoutStyleImageOnTheBottom使用
 默认为0
 */
@property (nonatomic,assign) CGFloat hh_verticalSpacing;
@end
