//
//  EndorsementWebViewController.m
//  VTIME
//
//  Created by 听听 on 2017/11/25.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "EndorsementWebViewController.h"
#import <WebKit/WebKit.h>
#import "MY_GLShareView.h"
@interface EndorsementWebViewController ()<WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler>

@property (strong, nonatomic)   WKWebView                   *webView;
@property (strong, nonatomic)   UIProgressView              *progressView;
@end

@implementation EndorsementWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.navigationItem.title = _strTitle;
    self.view.backgroundColor = [Utility colorWithHexString:@"000000" alpha:0.3];
    [self initProgressView];
    
    //开启监听进度条!
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    //    self.navigationController.navigationBar.translucent = YES;
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self initWKWebView];
    
}

//初始化页面
- (void)initWKWebView
{
    //    //进行配置控制器
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    
    //实例化对象
    WKUserContentController* userContentController = [WKUserContentController new];
    //调用JS方法
    [userContentController addScriptMessageHandler:self name:@"closeIndex"];
    [userContentController addScriptMessageHandler:self name:@"shareActive"];

    configuration.userContentController = userContentController;
    
    
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.minimumFontSize = 0.0;
    preferences.javaScriptEnabled = YES;
    configuration.preferences = preferences;
    
    CGFloat Width = self.view.frame.size.width - 37.5 *2;
	CGFloat Height = Width * (4/3.0);
    CGRect rect = CGRectMake(37.5, 125.5, Width, Height);
    self.webView = [[WKWebView alloc] initWithFrame:rect configuration:configuration];
    
    NSURL *fileURL = [NSURL URLWithString:self.webURL];
    [self.webView loadRequest:[NSURLRequest requestWithURL:fileURL]];
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    self.webView.backgroundColor = [UIColor blackColor];

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
    
    if ([message.name isEqualToString:@"closeIndex"]) { //关闭页面
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [self closeTipsView];
        });
    }else if ([message.name isEqualToString:@"shareActive"]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               
            NSDictionary * bodyDic = [Utility dictionaryWithJsonString:message.body];
            if (bodyDic ) {
                [self invitePersonal:bodyDic];
            }
        });
    }
}

//    跳转分享
-(void)invitePersonal:(NSDictionary*)bodyDic{
    
    // 分享的方式 2:微信好友和朋友圈 0：微信好友  1：朋友圈
    NSInteger type = [bodyDic[@"shareType"] integerValue];
    // 活动的类型
    NSInteger activityId = [bodyDic[@"activityId"] integerValue];
    
    MY_GLShareView * shareV = [[MY_GLShareView alloc]initWithFrame:ShareFrame withDic:bodyDic type:activityId typeId:nil sharetype:type];
    [UIView animateWithDuration:0.2 animations:^{
        
        [self closeTipsView];

        [shareV show];
    }];
    
}


+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        Dbg(@"json解析失败：%@",err);
        
        return nil;
    }
    return dic;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self closeTipsView];
}
- (void)closeTipsView{
    
    [UIView animateWithDuration:.2 animations:^{
        
        [self.view setAlpha:0.0];
        
    } completion:^(BOOL finished) {
        
        [self.view removeFromSuperview];
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
