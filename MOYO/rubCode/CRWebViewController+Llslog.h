#import "BaseViewController.h"
#import "CRWebViewController.h"
#import <WebKit/WebKit.h>
#import "MY_GLShareView.h"

@interface CRWebViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)viewDidDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)initWKWebViewLlslog:(NSString *)llslog;
- (void)initProgressViewLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context llslog:(NSString *)llslog;
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler llslog:(NSString *)llslog;
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler llslog:(NSString *)llslog;
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message llslog:(NSString *)llslog;
- (void)representPersonal:(NSDictionary*)bodyDic llslog:(NSString *)llslog;
+ (void)dictionaryWithJsonString:(NSString *)jsonString llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
