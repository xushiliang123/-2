#import "BaseViewController.h"
#import "MY_LYTTPlayViewController.h"
#import "MY_TTLSubPlayViewController.h"
#import <WebKit/WebKit.h>

@interface MY_LYTTPlayViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)initWKWebViewLlslog:(NSString *)llslog;
- (void)initProgressViewLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context llslog:(NSString *)llslog;
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler llslog:(NSString *)llslog;
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler llslog:(NSString *)llslog;
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
