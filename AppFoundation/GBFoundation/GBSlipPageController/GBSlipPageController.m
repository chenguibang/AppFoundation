//
//  SlipPageController.m
//  TDE
//
//  Created by ceo on 2017/7/7.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBSlipPageController.h"
#import <objc/runtime.h>
@interface GBSlipPageController ()<UIScrollViewDelegate>

@end

@implementation GBSlipPageController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollViewEnableChange:) name:NOTI_HOMEVCSHOW object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -初始化
- (void)setupView{
    self.contentView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.contentView.contentSize = CGSizeMake(self.view.frame.size.width * 5/3, self.view.frame.size.height);
    self.contentView.pagingEnabled = YES;
    [self.view addSubview:self.contentView];
    self.contentView.contentOffset = CGPointMake(self.view.frame.size.width * 2/3, 0);
    self.contentView.showsVerticalScrollIndicator = self.contentView.showsHorizontalScrollIndicator = NO;
    self.contentView.delegate = self;
    self.contentView.bounces = NO;
    
}



- (void)setLeftController:(UIViewController *)leftController{
    _leftController = leftController;

    _leftController.view.frame = CGRectMake(0, 0, self.view.frame.size.width * 2/3, self.view.frame.size.height);
    [self.contentView addSubview:_leftController.view];
    [self addChildViewController:_leftController];
    [_leftController didMoveToParentViewController:self];
}

- (void)setMainController:(UIViewController *)mainController{
    _mainController = mainController;

    [self.contentView addSubview:_mainController.view];
    _mainController.view.frame = CGRectMake(self.view.frame.size.width * 2/3, 0 , self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:_mainController];
    [_mainController didMoveToParentViewController:self];
    self.maskView = [[UIView alloc]initWithFrame:_mainController.view.bounds];
    self.maskView.backgroundColor = [UIColor blackColor];
    self.maskView.alpha = 0;
    [_mainController.view addSubview:self.maskView];
    
    UITapGestureRecognizer *maskViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(maskViewTap:)];
    [self.maskView addGestureRecognizer:maskViewTap];
    
    
    
    
    
}




- (void)setMaskViewColor:(UIColor *)maskViewColor{
    _maskViewColor = maskViewColor;
    self.maskView.backgroundColor = maskViewColor;
}

-(void)setHideMenu:(BOOL)hideMenu{
    _hideMenu = hideMenu;
    if (hideMenu) {
        [self hideLeftController];
    }else{
        [self showLeftController];
    }
}


#pragma mark- Delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    

    if (scrollView.contentOffset.x <= self.view.frame.size.width * 2/3) {
        
        self.maskView.alpha = (self.view.frame.size.width * 2/3 - scrollView.contentOffset.x ) / (self.view.frame.size.width);
        
    }else{
        
    }
}



#pragma mark - Action
- (void)maskViewTap:(UITapGestureRecognizer *)recognizer{
    [self hideLeftController];
}

- (void)scrollViewEnableChange:(NSNotification *)notifiction{
    self.contentView.scrollEnabled = [((NSNumber *)notifiction.object) boolValue];
}

- (void)showLeftController{
    [self.contentView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (void)hideLeftController{
    [self.contentView setContentOffset:CGPointMake(self.view.frame.size.width * 2/3, 0) animated:YES];
 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
