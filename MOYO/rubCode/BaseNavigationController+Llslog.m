#import "BaseNavigationController+Llslog.h"
@implementation BaseNavigationController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
