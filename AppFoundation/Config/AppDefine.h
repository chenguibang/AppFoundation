//
//  AppDefine.h
//  AppFoundation
//
//  Created by chenguibang on 2017/7/19.
//  Copyright © 2017年 chengb. All rights reserved.
//

#ifndef AppDefine_h
#define AppDefine_h


#pragma mark - ------------------
#pragma mark - 通用与工具App无关,通用
#pragma mark - ------------------

#pragma mark - 版本相关
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


#pragma mark - 设备
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#pragma mark - 颜色
#define UIColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UIColorWithRGB(r,g,b) UIColorWithRGBA(r,g,b,1.0f)
#define UIColorWithString(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorWithRandom [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

#pragma mark - 日志
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 -- %@ --",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

#pragma mark - 弱引用/强引用
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;

#pragma mark - XIB
//#define XIB(name) [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil][0]
//#define XIBController(name) [[UIViewController alloc] initWithNibName:name bundle:nil]


#pragma mark - 图片
#define UIImageWithNamed(_pointer) [UIImage imageNamed:_pointer]

#define AppFoundationBundleName @"AppFoundationBundle"

#define AppFoundationBundle [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"AppFoundationBundle" ofType:@"bundle"]]

#define AppFoundationImage(a) [UIImage imageNamed:a inBundle:[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"AppFoundationBundle" ofType:@"bundle"]] compatibleWithTraitCollection:nil]
#define AppFoundationXIBView(name) [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"AppFoundationBundle" ofType:@"bundle"]] loadNibNamed:name owner:nil options:nil][0]
#define AppFoundationXIBController(name) [[NSClassFromString(name) alloc] initWithNibName:name bundle:AppFoundationBundle]






#endif /* AppDefine_h */
