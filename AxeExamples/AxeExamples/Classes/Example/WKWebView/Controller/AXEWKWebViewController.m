//
//  AXEWKWebViewController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/22.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEWKWebViewController.h"

//system
#import <WebKit/WebKit.h>

//controller
#import "AXEJSViewController.h"

@interface AXEWKWebViewController () <WKNavigationDelegate>

@end

@implementation AXEWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化
    [self setup];
    
    [self setupWebView];
    
}

- (void)setup
{
    self.navigationItem.title = @"WKWebView";
    self.view.backgroundColor = AXENormalColor;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"js" style:UIBarButtonItemStyleDone target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)click
{
    AXEJSViewController *vc = [[AXEJSViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)setupWebView
{
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://dandanlicai.com"]]];
    webView.navigationDelegate = self;
    
    [self.view addSubview:webView];
    
}

#pragma mark - WKNavigationDelegate

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    AXELog(@"1");
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    AXELog(@"2");
}

// 页面加载完成后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    AXELog(@"3");
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    AXELog(@"4");
}

// 在收到响应后,决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    NSLog(@"%@", navigationResponse.response.URL.host.lowercaseString);
    if([navigationResponse.response.URL.host.lowercaseString isEqual:@"baidu.com"])
    {
        decisionHandler(WKNavigationResponsePolicyCancel);
    }
    
     decisionHandler(WKNavigationResponsePolicyAllow);
}

@end
