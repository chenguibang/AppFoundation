//
//  GBTableViewControllerTest.m
//  TDE
//
//  Created by ceo on 2017/7/10.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBTableViewControllerTest.h"
#import "GBTableViewPlaceHolder.h"
@interface GBTableViewControllerTest ()

@end

@implementation GBTableViewControllerTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.tableView.tableFooterView = [UIView new];
    WeakSelf(self)
    [self addTopRefreshControlUsingBlock:^{
        weakself.pageIndex += 1;
        [weakself.tableView cyl_reloadData];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself.tableView topRefreshControlStopRefreshing];
        });
        
    }];
    
    [self addBottomRefreshControlUsingBlock:^{
        weakself.pageIndex -= 1;
        [weakself.tableView cyl_reloadData];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakself.tableView bottomRefreshControlStopRefreshing];
        });
        
    }];
    
     [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.tableView cyl_reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.pageIndex;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIView *)makePlaceHolderView{
    GBTableViewPlaceHolder *emptyView = AppFoundationXIBView(@"GBTableViewPlaceHolder");
    emptyView.frame = self.tableView.bounds;
    return emptyView;
}


- (BOOL)enableScrollWhenPlaceHolderViewShowing{
    return YES;
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
