//
//  AXEJSViewController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/22.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEJSViewController.h"

//system
#import <WebKit/WebKit.h>

@interface AXEJSViewController () <WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@end

@implementation AXEJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
    
    [self setupJS];
    
}

- (void)setup
{
    self.navigationItem.title = @"JS";
    self.view.backgroundColor = AXENormalColor;

}

- (void)setupJS
{
    // js代码
    NSString *js = @"var count = document.images.length;for (var i = 0; i < count; i++) {var image = document.images[i];image.style.width=320;};window.alert('找到' + count + '张图');";
    
    // 根据js字符串初始化WKUserScript对象
    WKUserScript *script = [[WKUserScript alloc] initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    
    // 根据生成的WKUserScript对象，初始化WKWebViewConfiguration
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    [configuration.userContentController addUserScript:script];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [webView loadHTMLString:@"<head></head><img src='http://www.nsu.edu.cn/v/2014v3/img/background/3.jpg' />" baseURL:nil];
    
    [self.view addSubview:webView];
    
}

#pragma mark - WKUIDelegate

///  web界面中弹出确认框时调用
///
///  @param webView           实现该代理的webView
///  @param message           确认框中的内容
///  @param frame             主窗口
///  @param completionHandler 确认框消失调用
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler
{
    
}

///  web界面中弹出警告框时调用
///
///  @param webView           实现该代理的webView
///  @param message           警告框框中的内容
///  @param frame             主窗口
///  @param completionHandler 警告框消失调用
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    completionHandler();
}

///  web界面中弹出输入框时调用
///
///  @param webView           实现该代理的webView
///  @param prompt            The message to be displayed
///  @param defaultText       默认文字
///  @param frame             主窗口
///  @param completionHandler 输入框消失调用
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler
{
    
}

#pragma mark - WKScriptMessageHandler

// 从web界面中接收到一个脚本时调用
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    AXELog(@"js");
    
    AXELog(@"runloop : %@", [NSRunLoop currentRunLoop]);
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    [runLoop run];
}

@end
