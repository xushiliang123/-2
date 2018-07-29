#import "BaseViewController.h"
#import "EndorsementWebViewController.h"
#import <WebKit/WebKit.h>
#import "MY_GLShareView.h"

@interface EndorsementWebViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)viewDidDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)initWKWebViewLlslog:(NSString *)llslog;
- (void)initProgressViewLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context llslog:(NSString *)llslog;
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler llslog:(NSString *)llslog;
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler llslog:(NSString *)llslog;
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message llslog:(NSString *)llslog;
- (void)invitePersonal:(NSDictionary*)bodyDic llslog:(NSString *)llslog;
+ (void)dictionaryWithJsonString:(NSString *)jsonString llslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)closeTipsViewLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;

@end
