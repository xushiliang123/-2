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

@interface MY_XTSystemInfoViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)updateLlslog:(NSString *)llslog;
- (void)setNavBarButtonLlslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog;
- (void)tapAction:(UITapGestureRecognizer *)gesture llslog:(NSString *)llslog;
- (void)imglongTapClick:(UILongPressGestureRecognizer *)longPress llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)image:(UIImage *)image didFinshSavingWithError:(NSError *)error contextInfo:(void *)contextInfo llslog:(NSString *)llslog;
- (void)performDismiss:(NSTimer *)timer llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
