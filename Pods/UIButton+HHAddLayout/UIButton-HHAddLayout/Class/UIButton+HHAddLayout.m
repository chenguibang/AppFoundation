//
//  UIButton+HHAddLayout.m
//  UIButton-HHAddLayout
//
//  Created by YunSL on 17/3/29.
//  Copyright © 2017年 YunSL. All rights reserved.
//

#import "UIButton+HHAddLayout.h"
#import <objc/runtime.h>

/**
 根据图片原本宽高以及最大宽高重新计算合适的宽高

 @param imageSize 图片原本宽高
 @param maxSize   图片最大宽高
 @return 图片合适宽高
 */
static inline CGSize HHButtonLayoutImageFitSize(CGSize imageSize, CGSize maxSize) {
    CGSize image_size = CGSizeZero;
    if (maxSize.width >= 0 && maxSize.height >= 0) {
        CGFloat imageWidth = imageSize.width;
        CGFloat imageHeight = imageSize.height;
        CGFloat widthRatio = (maxSize.width == CGFLOAT_MAX)?0:(imageWidth/maxSize.width);
        CGFloat heightRatio = (maxSize.height == CGFLOAT_MAX)?0:(imageHeight/maxSize.height);
        if (widthRatio > 1 || heightRatio > 1) {
            CGFloat maxRation = MAX(widthRatio, heightRatio);
            imageWidth = imageWidth/maxRation;
            imageHeight = imageHeight/maxRation;
        }
        image_size = CGSizeMake(imageWidth, imageHeight);
    }
    return image_size;
}

@interface UIButton()
@property (nonatomic,assign) CGRect titleLabelFrame;
@property (nonatomic,assign) CGRect imageViewFrame;
@property (nonatomic,assign) CGSize contentSize;
@end

#pragma mark - HHPrivateLayoutButton

static char HHPrivateButtonOriginalClasskey;

@interface HHPrivateLayoutButton : UIButton @end

@implementation HHPrivateLayoutButton

#pragma mark - life
- (Class)class {
    NSString *classText = objc_getAssociatedObject(self, &HHPrivateButtonOriginalClasskey);
    return (classText)?NSClassFromString(classText):[super class];
}

- (CGSize)sizeThatFits:(CGSize)size {
    self.contentSize = [super sizeThatFits:size];
    if (self.hh_layoutStyle != HHButtonLayoutStyleSystem &&
        self.imageView.image &&
        self.titleLabel.text.length > 0) {
        [self updateContentSize];
    }
    return self.contentSize;
}

- (CGSize)intrinsicContentSize {
    self.contentSize = [super intrinsicContentSize];
    if (self.hh_layoutStyle != HHButtonLayoutStyleSystem &&
        self.imageView.image &&
        self.titleLabel.text.length > 0) {
        [self updateContentSize];
    }
    return self.contentSize;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.hh_layoutStyle != HHButtonLayoutStyleSystem &&
        self.imageView.image &&
        self.titleLabel.text.length > 0) {
        [self updateLayoutWithPreferredWidth:CGRectGetWidth(self.frame) height:CGRectGetHeight(self.frame)];
        [self.titleLabel setFrame:self.titleLabelFrame];
        [self.imageView setFrame:self.imageViewFrame];
    }
}

#pragma mark - private
#pragma mark - 计算title和image的size
- (void)updateLayoutWithPreferredWidth:(CGFloat)preferredWidth height:(CGFloat)preferredHeight {
    //todo:存在重复计算多次的问题    
    self.titleLabelFrame = CGRectZero;
    self.imageViewFrame = CGRectZero;
    if (preferredWidth > 0 && preferredHeight > 0) {
        //1.获取参数
        CGFloat preferredMaxContentWidth = preferredWidth - self.contentEdgeInsets.left - self.contentEdgeInsets.right;
        CGFloat preferredMaxContentHeight = preferredHeight - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom;
        //2.计算图片宽高
        CGSize imageSize = self.hh_preferredMaxImageSize;
        if (CGSizeEqualToSize(imageSize, HHDefaultPreferredMaxImageSize)) {
            imageSize = self.imageView.image.size;
        }
        imageSize = HHButtonLayoutImageFitSize(imageSize,CGSizeMake(preferredMaxContentWidth, preferredMaxContentHeight));
        //3.计算文本宽高
        CGSize textSize = CGSizeZero;
        CGFloat maxTextWidth = preferredMaxContentWidth;
        CGFloat maxTextHeight = preferredMaxContentHeight;
        if (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheTop ||
            self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheBottom) {
            maxTextHeight = preferredMaxContentHeight - imageSize.height - self.hh_verticalSpacing;
        }
        if (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheLeft ||
            self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheRight) {
            maxTextWidth = preferredMaxContentWidth - imageSize.width - self.hh_horizontalSpacing;
        }
        if (maxTextWidth > 0 && maxTextHeight > 0) {
            textSize = [self.currentTitle boundingRectWithSize:CGSizeMake(maxTextWidth, maxTextHeight)
                                                       options:NSStringDrawingUsesLineFragmentOrigin|                                       NSStringDrawingUsesFontLeading
                                                    attributes:@{NSFontAttributeName:self.titleLabel.font}
                                                       context:nil].size;
        }
        //4.计算图片和文本坐标
        CGFloat estimateContentWidth = imageSize.width + textSize.width + self.hh_horizontalSpacing;
        CGFloat estimateContentHeight = imageSize.height + textSize.height + self.hh_verticalSpacing;
        CGFloat imageX = 0;
        CGFloat imageY = 0;
        CGFloat textX = 0;
        CGFloat textY = 0;
        switch (self.hh_layoutStyle) {
            case HHButtonLayoutStyleImageOnTheTop:
            case HHButtonLayoutStyleImageOnTheBottom:
            {
                CGFloat topY = 0;
                CGFloat bottomY = 0;
                if (estimateContentHeight < preferredMaxContentWidth)
                {
                    CGFloat topHeight = (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheTop)?imageSize.height:textSize.height;
                    topY = (CGRectGetHeight(self.frame) - estimateContentHeight) * 0.5;
                    bottomY = topY + topHeight + self.hh_verticalSpacing;
                }
                else
                {
                    CGFloat bottomHeight = (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheBottom)?imageSize.height:textSize.height;
                    topY = self.contentEdgeInsets.top;
                    bottomY = CGRectGetHeight(self.frame) - self.contentEdgeInsets.bottom - bottomHeight;
                }
                textY = (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheTop)?bottomY:topY;
                imageY = (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheTop)?topY:bottomY;
                textX = (CGRectGetWidth(self.frame) - textSize.width) * 0.5;
                imageX = (CGRectGetWidth(self.frame) - imageSize.width) * 0.5;
            }
                break;
            case HHButtonLayoutStyleImageOnTheLeft:
            case HHButtonLayoutStyleImageOnTheRight:
            {
                CGFloat leftX = 0;
                CGFloat rightX = 0;
                if (estimateContentWidth < preferredMaxContentWidth)
                {
                    CGFloat leftWidth = (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheLeft)?imageSize.width:textSize.width;
                    leftX = (CGRectGetWidth(self.frame) - estimateContentWidth) * 0.5;
                    rightX = leftX + leftWidth + self.hh_horizontalSpacing;
                }
                else
                {
                    CGFloat rightWidth = (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheRight)?imageSize.width:textSize.width;
                    leftX = self.contentEdgeInsets.left;
                    rightX = preferredWidth - self.contentEdgeInsets.right - rightWidth;
                }
                textX = (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheLeft)?rightX:leftX;
                imageX = (self.hh_layoutStyle == HHButtonLayoutStyleImageOnTheLeft)?leftX:rightX;
                textY = (CGRectGetHeight(self.frame) - textSize.height) * 0.5;
                imageY = (CGRectGetHeight(self.frame) - imageSize.height) * 0.5;
            }
                break;
            default:
                break;
        }
        self.imageViewFrame = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
        self.titleLabelFrame = CGRectMake(textX, textY, textSize.width, textSize.height);
    }
}

#pragma mark - 计算button的size
- (void)updateContentSize {
    //todo:存在重复计算多次的问题
    [self updateLayoutWithPreferredWidth:self.hh_preferredMaxLayoutWidth
                                  height:CGFLOAT_MAX];
    CGSize textSize = self.titleLabelFrame.size;
    CGSize imageSize = self.imageViewFrame.size;
    switch (self.hh_layoutStyle) {
        case HHButtonLayoutStyleImageOnTheTop:
        case HHButtonLayoutStyleImageOnTheBottom:
        {
            self.contentSize = CGSizeMake(self.contentEdgeInsets.left + MAX(imageSize.width, textSize.width) + self.contentEdgeInsets.right, self.contentEdgeInsets.top + imageSize.height + self.hh_verticalSpacing + textSize.height + self.contentEdgeInsets.bottom);
        }
            break;
        case HHButtonLayoutStyleImageOnTheLeft:
        case HHButtonLayoutStyleImageOnTheRight:
        {
            self.contentSize = CGSizeMake(self.contentEdgeInsets.left + imageSize.width + self.hh_horizontalSpacing + textSize.width + self.contentEdgeInsets.right, self.contentEdgeInsets.top + MAX(imageSize.height, textSize.height) + self.contentEdgeInsets.bottom);
        }
            break;
        default:
            self.contentSize = CGSizeZero;
            break;
    }
}

@end

#pragma mark - UIButton + HHAddLayout
@implementation UIButton (HHAddLayout)

- (void)handleClassReplace {
    if (!objc_getAssociatedObject(self, &HHPrivateButtonOriginalClasskey)) {
        objc_setAssociatedObject(self, &HHPrivateButtonOriginalClasskey, NSStringFromClass(self.class), OBJC_ASSOCIATION_COPY_NONATOMIC);
        object_setClass(self, [HHPrivateLayoutButton class]);
    }
}

#pragma mark - set
- (void)setHh_layoutStyle:(HHButtonLayoutStyle)hh_layoutStyle {
    [self handleClassReplace];
    objc_setAssociatedObject(self, @selector(hh_layoutStyle), @(hh_layoutStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHh_horizontalSpacing:(CGFloat)hh_horizontalSpacing {
    [self handleClassReplace];
    objc_setAssociatedObject(self, @selector(hh_horizontalSpacing), @(hh_horizontalSpacing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHh_verticalSpacing:(CGFloat)hh_verticalSpacing {
    [self handleClassReplace];
    objc_setAssociatedObject(self, @selector(hh_verticalSpacing), @(hh_verticalSpacing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHh_preferredMaxImageSize:(CGSize)hh_preferredMaxImageSize {
    [self handleClassReplace];
    objc_setAssociatedObject(self, @selector(hh_preferredMaxImageSize), [NSValue valueWithCGSize:hh_preferredMaxImageSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setHh_preferredMaxLayoutWidth:(CGFloat)hh_preferredMaxLayoutWidth {
    [self handleClassReplace];
    objc_setAssociatedObject(self, @selector(hh_preferredMaxLayoutWidth), @(hh_preferredMaxLayoutWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setTitleLabelFrame:(CGRect)titleLabelFrame {
    objc_setAssociatedObject(self, @selector(titleLabelFrame), [NSValue valueWithCGRect:titleLabelFrame], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setImageViewFrame:(CGRect)imageViewFrame {
    objc_setAssociatedObject(self, @selector(imageViewFrame), [NSValue valueWithCGRect:imageViewFrame], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setContentSize:(CGSize)contentSize {
    objc_setAssociatedObject(self, @selector(contentSize), [NSValue valueWithCGSize:contentSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - get
- (HHButtonLayoutStyle)hh_layoutStyle {
    return objc_getAssociatedObject(self, _cmd)?[objc_getAssociatedObject(self, _cmd) integerValue]:HHButtonLayoutStyleSystem;
}

- (CGFloat)hh_horizontalSpacing {
    return objc_getAssociatedObject(self, _cmd)?[objc_getAssociatedObject(self, _cmd) floatValue]:0.5;
}

- (CGFloat)hh_verticalSpacing {
    return objc_getAssociatedObject(self, _cmd)?[objc_getAssociatedObject(self, _cmd) floatValue]:0.5;
}

- (CGSize)hh_preferredMaxImageSize {
    return objc_getAssociatedObject(self, _cmd)?[objc_getAssociatedObject(self, _cmd) CGSizeValue]:HHDefaultPreferredMaxImageSize;
}

- (CGFloat)hh_preferredMaxLayoutWidth {
    return objc_getAssociatedObject(self, _cmd)?[objc_getAssociatedObject(self, _cmd) floatValue]:CGFLOAT_MAX;
}

- (CGRect)titleLabelFrame {
    return objc_getAssociatedObject(self, _cmd)?[objc_getAssociatedObject(self, _cmd) CGRectValue]:CGRectZero;
}

- (CGRect)imageViewFrame {
    return objc_getAssociatedObject(self, _cmd)?[objc_getAssociatedObject(self, _cmd) CGRectValue]:CGRectZero;
}

- (CGSize)contentSize {
    return objc_getAssociatedObject(self, _cmd)?[objc_getAssociatedObject(self, _cmd) CGSizeValue]:CGSizeZero;
}

@end
