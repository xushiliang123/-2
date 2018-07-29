#import "MY_LYVTaskViewController+Llslog.h"
@implementation MY_LYVTaskViewController (Llslog)
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)viewDidLoadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setNavBarButtonLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)backClickLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
