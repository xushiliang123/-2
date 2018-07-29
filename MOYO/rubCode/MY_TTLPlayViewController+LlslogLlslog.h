#import "BaseViewController.h"
#import "MY_TTLPlayViewController.h"
#import "MY_TTLSubPlayViewController.h"
#import <WebKit/WebKit.h>
#import "MY_TTLPlayViewController+Llslog.h"

@interface MY_TTLPlayViewController (LlslogLlslog)
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)initWKWebViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)initProgressViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
