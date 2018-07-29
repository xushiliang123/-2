#import <UIKit/UIKit.h>
#import "DemoCallManager.h"
#import "EMVideoInfoViewController.h"

@interface EMVideoInfoViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)tapLlslog:(NSString *)llslog;
- (void)_startShowInfoLlslog:(NSString *)llslog;
- (void)_reloadPropertyDataLlslog:(NSString *)llslog;
- (void)startTimer:(int)currentTimeLength llslog:(NSString *)llslog;
- (void)timeTimerAction:(id)sender llslog:(NSString *)llslog;
- (void)closeVideoInfoLlslog:(NSString *)llslog;

@end
