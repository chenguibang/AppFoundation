//
//  GBWebViewContoller.m
//  TDE
//
//  Created by ceo on 2017/7/11.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBWebViewContoller.h"
@interface GBWebViewContoller ()

@end

@implementation GBWebViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_webView];
        _webViewJavascriptBridge = [WKWebViewJavascriptBridge bridgeForWebView:_webView];
        [_webViewJavascriptBridge setWebViewDelegate:self];
        [WKWebViewJavascriptBridge enableLogging];
    }
    return _webView;
}

- (void)setUrl:(NSString *)url{
    _url = url;
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    [self.webView loadRequest:request];
    [self registerNativeFunctions];
}



#pragma mark - 注册本地方法
- (void)registerNativeFunctions
{
    [self registScanFunction];
    [self registShareFunction];
    [self registLocationFunction];
    [self registPayFunction];
}

//获取定位
- (void)registLocationFunction{
    [self.webViewJavascriptBridge registerHandler:@"ios_getLocation" handler:^(id data, WVJBResponseCallback responseCallback) {
        // 获取位置信息
        NSString *location = @"位置";
        responseCallback(location);
    }];
}

//分享
- (void)registShareFunction{
    [self.webViewJavascriptBridge registerHandler:@"ios_share" handler:^(id data, WVJBResponseCallback responseCallback) {
        // 获取位置信息
        NSString *location = @"分享";
        
        
        
        // 将结果返回给js
        responseCallback(location);
    }];
    
}

//扫面二维码
- (void)registScanFunction{
    [self.webViewJavascriptBridge registerHandler:@"ios_qrcodescanf" handler:^(id data, WVJBResponseCallback responseCallback) {
        // 获取位置信息
        NSString *location = @"二维码";
        // 将结果返回给js
        responseCallback(location);
    }];
}

//支付
- (void)registPayFunction{
    [self.webViewJavascriptBridge registerHandler:@"ios_pay" handler:^(id data, WVJBResponseCallback responseCallback) {
        // 获取位置信息
        NSString *location = @"支付";
        // 将结果返回给js
        responseCallback(location);
    }];
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
