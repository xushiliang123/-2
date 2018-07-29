//
//  MY_LYTTPlayViewController.m
//  MOYO
//
//  Created by 听听 on 2018/3/26.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import "MY_LYTTPlayViewController.h"
#import "MY_TTLSubPlayViewController.h"
#import <WebKit/WebKit.h>
@interface MY_LYTTPlayViewController ()<WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler>

@property (strong, nonatomic)   WKWebView                   *webView;
@property (strong, nonatomic)   UIProgressView              *progressView;

@end

@implementation MY_LYTTPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _strTitle;
    self.view.backgroundColor = [Utility colorWithHexString:@"000000" alpha:0.3];
    [self initWKWebView];
    [self initProgressView];
    
    //开启监听进度条!
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
//初始化页面
- (void)initWKWebView
{
    //    //进行配置控制器
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    
    //实例化对象
    WKUserContentController* userContentController = [WKUserContentController new];
    //调用JS方法
    [userContentController addScriptMessageHandler:self name:@"redirect"];
    configuration.userContentController = userContentController;
    
    
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.minimumFontSize = 0.0;
    preferences.javaScriptEnabled = YES;
    configuration.preferences = preferences;
    
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    self.webView = [[WKWebView alloc] initWithFrame:rect configuration:configuration];
    
    NSURL *fileURL = [NSURL URLWithString:self.webURL];
    [self.webView loadRequest:[NSURLRequest requestWithURL:fileURL]];
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    //    self.webView.scrollView.scrollEnabled = NO;
    [self.view addSubview:self.webView];
}

//进度条
- (void)initProgressView
{
    CGFloat kScreenWidth = [[UIScreen mainScreen] bounds].size.width;
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 2)];
    progressView.tintColor = [UIColor redColor];
    progressView.trackTintColor = [UIColor lightGrayColor];
    [self.view addSubview:progressView];
    self.progressView = progressView;
}

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
    //移除监听进度
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


#pragma mark - KVO
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            [self.progressView setProgress:1.0 animated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressView.hidden = YES;
                [self.progressView setProgress:0 animated:NO];
            });
            
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    //如果是跳转一个新页面
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}


- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
    
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        
        NSURLCredential *card = [[NSURLCredential alloc]initWithTrust:challenge.protectionSpace.serverTrust];
        
        completionHandler(NSURLSessionAuthChallengeUseCredential,card);
    }
}


#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
    if ([message.name isEqualToString:@"redirect"]) {
        
        Dbg(@" ---- %@",message.body);
        MY_TTLSubPlayViewController *subPlay = [MY_TTLSubPlayViewController new];
        subPlay.webURL = message.body;
        [self.navigationController pushViewController:subPlay animated:YES];
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        //
        //        });
        //        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
