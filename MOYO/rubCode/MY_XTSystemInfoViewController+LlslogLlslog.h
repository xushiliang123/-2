#import "EaseUI.h"
#import "MY_XTSystemInfoViewController.h"
#import "MessageSystemCell.h"               //  灰色系统消息
#import "RealTimeCallCell.h"                //  实时通话
#import "DemoCallManager.h"
#import "MY_LLPayViewController.h"             //  支付
#import "MY_LLBlackPaceter.h"
#import "MY_LLRedPacketCell.h"                 //  红包消息
#import "MY_LLSystemMessageCell.h"             //  系统消息
#import "MY_TTLMeModel.h"
#import "MY_XTSystemMessageCell.h"
#import "CRWebViewController.h"
#import "MY_XTFirstNoticeTableViewCell.h"
#import "MY_XTFirstNoticeListTableViewCell.h"
#import "MY_TTLInviteFriendViewController.h"
#import "MY_TTLUpHomePageViewController.h"
#import "MY_TTLToBeNobilityViewController.h"
#import "MY_TTLBodyInformationViewController.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_XTSystemInfoViewController+Llslog.h"

@interface MY_XTSystemInfoViewController (LlslogLlslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)updateLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setNavBarButtonLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tapAction:(UITapGestureRecognizer *)gesture llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)imglongTapClick:(UILongPressGestureRecognizer *)longPress llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)image:(UIImage *)image didFinshSavingWithError:(NSError *)error contextInfo:(void *)contextInfo llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)performDismiss:(NSTimer *)timer llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
