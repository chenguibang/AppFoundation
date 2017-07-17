//
//  GBWebViewContoller.h
//  TDE
//
//  Created by ceo on 2017/7/11.
//  Copyright © 2017年 chengb. All rights reserved.
//

#import "GBBaseViewController.h"
#import <WebKit/WKWebView.h>
#import <WKWebViewJavascriptBridge.h>
@interface GBWebViewContoller : GBBaseViewController<WKNavigationDelegate>
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) WKWebViewJavascriptBridge *webViewJavascriptBridge;
@end
