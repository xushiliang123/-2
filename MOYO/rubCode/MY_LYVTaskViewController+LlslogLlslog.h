#import "EaseMessageViewController.h"
#import "MY_LYVTaskViewController.h"
#import "MY_TTLVTaskTableViewCell.h"
#import "MY_LYSystemTImeTableViewCell.h"
#import "MY_GLTaskPageViewController.h"
#import "MY_GLTaskApplyInfoViewController.h"
#import "MY_LYVTaskViewController+Llslog.h"

@interface MY_LYVTaskViewController (LlslogLlslog)
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setNavBarButtonLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
