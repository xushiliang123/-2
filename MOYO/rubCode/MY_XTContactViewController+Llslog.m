#import "MY_XTContactViewController+Llslog.h"
@implementation MY_XTContactViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)longTapClick:(UILongPressGestureRecognizer *)longPress llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)image:(UIImage *)image didFinshSavingWithError:(NSError *)error contextInfo:(void *)contextInfo llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)performDismiss:(NSTimer *)timer llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end