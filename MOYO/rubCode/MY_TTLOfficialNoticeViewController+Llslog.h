#import "BaseViewController.h"
#import "MY_TTLOfficialNoticeViewController.h"
#import "MY_TTLOfficalNoticeTableViewCell.h"
#import "CRWebViewController.h"
#import "MY_LYSystemTImeTableViewCell.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "MY_TTLToBeNobilityViewController.h"       //成为贵族

@interface MY_TTLOfficialNoticeViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)setNavBarButtonLlslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog;
- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index llslog:(NSString *)llslog;
- (void)watchClickLlslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;

@end
