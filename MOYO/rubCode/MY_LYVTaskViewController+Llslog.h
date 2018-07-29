#import "EaseMessageViewController.h"
#import "MY_LYVTaskViewController.h"
#import "MY_TTLVTaskTableViewCell.h"
#import "MY_LYSystemTImeTableViewCell.h"
#import "MY_GLTaskPageViewController.h"
#import "MY_GLTaskApplyInfoViewController.h"

@interface MY_LYVTaskViewController (Llslog)
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)setNavBarButtonLlslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth llslog:(NSString *)llslog;

@end
