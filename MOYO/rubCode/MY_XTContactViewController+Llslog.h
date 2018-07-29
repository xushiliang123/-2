#import <UIKit/UIKit.h>
#import "MY_XTContactViewController.h"
#import "MY_XTCopyLabel.h"

@interface MY_XTContactViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)longTapClick:(UILongPressGestureRecognizer *)longPress llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)image:(UIImage *)image didFinshSavingWithError:(NSError *)error contextInfo:(void *)contextInfo llslog:(NSString *)llslog;
- (void)performDismiss:(NSTimer *)timer llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
