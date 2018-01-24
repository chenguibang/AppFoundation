//
//  GBSearchRootController.m
//  TDE
//
//  Created by chenguibang on 2017/7/9.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBSearchRootController.h"
#import "GBSearchView.h"
@interface GBSearchRootController ()<UITextFieldDelegate>{
    GBSearchView *seachBar;
}

@end

@implementation GBSearchRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
}

- (void)setupView{
    [super setupView];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    seachBar =  AppFoundationXIBView(@"GBSearchView");

    seachBar.searchTextFiled.delegate = self;
    self.navigationItem.titleView = seachBar;
    self.navigationItem.hidesBackButton = YES;
    
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismiss)];
    self.navigationItem.rightBarButtonItem = cancle;
    
    self.searchKeyWordController.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:self.searchKeyWordController.view];
    [self addChildViewController:self.searchKeyWordController];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     [seachBar.searchTextFiled becomeFirstResponder];
}



#pragma mark - Delegate


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    NSString * currentString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
    if (currentString.length > 0) {
        [self.searchKeyWordController.searchKeys addObject:currentString];
        [self.searchKeyWordController.tableView reloadData];
    }

    return YES; // 能改变输入框的值
}



- (void)dismiss{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (GBSearchKeyWordController *)searchKeyWordController{
    if (!_searchKeyWordController) {
        _searchKeyWordController = [[GBSearchKeyWordController alloc]init];
    }
   return _searchKeyWordController;
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
