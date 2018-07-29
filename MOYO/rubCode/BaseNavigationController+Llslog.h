#import <UIKit/UIKit.h>
#import "BaseNavigationController.h"

@interface BaseNavigationController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
