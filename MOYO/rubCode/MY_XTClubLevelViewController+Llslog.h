#import <UIKit/UIKit.h>
#import "MY_XTClubLevelViewController.h"

@interface MY_XTClubLevelViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)simpleUIWebViewTestLlslog:(NSString *)llslog;
- (void)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType llslog:(NSString *)llslog;
- (void)webViewDidStartLoad:(UIWebView *)webView llslog:(NSString *)llslog;
- (void)webViewDidFinishLoad:(UIWebView *)webView llslog:(NSString *)llslog;
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
