//
//  UIImage+GBExpand.h
//  Medical
//
//  Created by chenguibang on 16/11/6.
//  Copyright © 2016年 chenguibang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(GBExpand)



-(UIImage*)imageWithSize:(CGSize)size;


+ (UIImage *)gb_imageWithColor:(UIColor *)color;
+ (UIImage *)gb_imageWithColor:(UIColor *)color size:(CGSize)size;


- (UIImage *)gb_compressMaxFileSize:(NSInteger)maxFileSize;


-(NSData *)zipImage;

@end
