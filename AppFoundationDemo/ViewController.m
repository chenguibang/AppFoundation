//
//  ViewController.m
//  AppFoundationDemo
//
//  Created by chenguibang on 2017/7/19.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "ViewController.h"
#import <GBShareView.h>
#import <AppDefine.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    GBShareView *ssd = [[GBShareView alloc]init];
    [ssd setDefultView];
    [ssd showAt:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
