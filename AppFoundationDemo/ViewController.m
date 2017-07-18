//
//  ViewController.m
//  AppFoundationDemo
//
//  Created by ceo on 2017/7/17.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIViewController *left = [[UIViewController alloc]init];

    self.leftController = left;
    
    UIViewController *right = [[UIViewController alloc]init];

    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:right];
    self.mainController = mainNav;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
