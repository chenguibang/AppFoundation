//
//  GBFoundationTestRoot.m
//  TDE
//
//  Created by ceo on 2017/7/10.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBFoundationTestRoot.h"
#import "GBWebViewContoller.h"
#import "GBShareView.h"
@interface GBFoundationTestRoot ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *datas;
}

@end

@implementation GBFoundationTestRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    datas = @[
              @{
                  @"title":@"GBTableViewControllerTest",
                  @"controller":@"GBTableViewControllerTest",
                  },
              
              @{
                  @"title":@"GBWebViewContoller",
                  @"controller":@"GBWebViewContoller",
                  },
              
              
              @{
                  @"ShareUtil":@"ShareUtil",
                  @"ShareUtil":@"ShareUtil",
                  },
              
              
              
              ];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = datas[indexPath.row][@"title"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class vc = NSClassFromString(datas[indexPath.row][@"controller"]);
    if ([NSStringFromClass(vc) isEqualToString:@"ShareUtil"]) {
        GBShareView *view = AppFoundationXIBView(@"GBShareView");
        [view showAt:self];
        return;
    }
    
    
    
    
    UIViewController *controller = (UIViewController *)[[vc alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];


    if ([controller isKindOfClass:[GBWebViewContoller class]]) {
        GBWebViewContoller *webViewContoller = (GBWebViewContoller*)controller;
        
        webViewContoller.url = @"http://localhost:63342/gamer/src/iosJSTest.html?_ijt=s6h823v7mi0adc9ku7sgcfqmv8";
    }
    
    
    
//    [self.navigationController pushViewController:nav animated:YES];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
