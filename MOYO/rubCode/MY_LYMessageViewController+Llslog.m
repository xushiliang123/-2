#import "MY_LYMessageViewController+Llslog.h"
@implementation MY_LYMessageViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
