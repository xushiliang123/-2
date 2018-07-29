//
//  CRWebViewController.m
//  TogetherLu
//
//  Created by Louie on 2017/7/14.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "CRWebViewController.h"
#import <WebKit/WebKit.h>
#import "MY_GLShareView.h"

@interface CRWebViewController ()<WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler>

@property (strong, nonatomic)   WKWebView                   *webView;
@property (strong, nonatomic)   UIProgressView              *progressView;


@end

@implementation CRWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    if([self.stringfrom isEqualToString:@"代言"])
    {
        self.navigationController.navigationBarHidden = NO;
    }
    
    
    self.title = _strTitle;
    self.view.backgroundColor = [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self initWKWebView];
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


//初始化页面
- (void)initWKWebView
{
    //    //进行配置控制器
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    
    //实例化对象
    WKUserContentController* userContentController = [WKUserContentController new];
    //调用JS方法
    [userContentController addScriptMessageHandler:self name:@"shareActive"];
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
    
    if ([message.name isEqualToString:@"shareActive"]) {
        NSDictionary * bodyDic = [CRWebViewController dictionaryWithJsonString:message.body];
        Dbg(@" ---- %@",bodyDic);
        /*
         private String title;
         private String desc;
         private String link;
         private String imgUrl;
         private String title1;
         private String desc1;
         private String link1;
         private String imgUrl1;
         private int activityId;  //活动的类型
         private int shareType; //分享的方式 2:微信好友和朋友圈 0：微信好友  1：朋友圈
         */
        //        if([self.stringfrom isEqualToString:@"邀请好友"]){
        //
        //        }else{
        
        // 分享代言
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            if (bodyDic ) {
                [self representPersonal:bodyDic];
            }
        });
        //        }
    }
}

//  代言
-(void)representPersonal:(NSDictionary*)bodyDic{
    
    //    NSInteger type = 2;
    //    if([self.stringfrom isEqualToString:@"代言"])
    //    {
    //        type = 1;
    //    }
    
    // 分享的方式 2:微信好友和朋友圈 0：微信好友  1：朋友圈
    NSInteger type = [bodyDic[@"shareType"] integerValue];
    // 活动的类型
    NSInteger activityId = [bodyDic[@"activityId"] integerValue];
    
    MY_GLShareView * shareV = [[MY_GLShareView alloc]initWithFrame:ShareFrame withDic:bodyDic type:activityId typeId:nil sharetype:type];
    [UIView animateWithDuration:0.2 animations:^{
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
