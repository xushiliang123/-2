#import "EaseMessageViewController.h"
#import "MY_GLClubModel.h"
#import "MY_TTLClubChatViewController.h"
#import "MessageSystemCell.h"               //  灰色系统消息
#import "RealTimeCallCell.h"                //  实时通话
#import "DemoCallManager.h"
#import "MY_LLPayViewController.h"             //  支付
#import "MY_LLBlackPaceter.h"
#import "MY_LLRedPacketCell.h"                 //  红包消息
#import "MY_LLSystemMessageCell.h"
#import "MY_TTLClubInputChatView.h"
#import "MY_TTLClubChatCell.h"
#import "MY_GLRedPacketView.h"
#import "MY_TTLClubHongBaoCell.h"
#import "MY_GLBaPingView.h"
#import "MY_GLBaPingExampleView.h"
#import "MY_XTUserBPView.h"
#import "MY_GLOpenRedPackertView.h"// 抢红包页
#import "MY_TTLClubRedPackListViewController.h"// 红包详情页
#import "MY_TTLClubDetailViewController.h"
#import "MY_TTLFullScreenPhotoCell.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_LYRedPackertViewController.h"//  发红包
#import "HomeBlackView.h"
#import "MY_GLTaskPageViewController.h"
#import "CRWebViewController.h"
#import "MY_TTLHongBaoClickPopView.h"
#import "MY_TTLClubChatViewController+Llslog.h"

@interface MY_TTLClubChatViewController (LlslogLlslog)
- (void)broadCastArrayLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addNewPwopleComeViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)receiceBroadCastNotication:(NSNotification*)notic llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addbroadcastViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)broadCastViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)updateClubModel:(NSNotification*)uinf llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)loadMessageLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setNavBarButtonLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)ringhtBatBtnClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)BangDanBtnBtnClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addHonbaoViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)goToRechargeButtonClickMethod:(UIButton*)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)BPBtnButtonClick1:(NSString *)furl Withid:(NSString *)uid llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)BPBtnButtonClick:(UIButton*)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)inviteButtonClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)BtnClick:(UIButton *)btn withBPView:(MY_XTUserBPView *)pView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)PAYSuccess:(NSNotification *)notification llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)GetBPLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addBaP:(NSDictionary *)dic llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)usePhonePhotoAndCameraLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setchatTooBarSubViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
                           modelForMessage:(EMMessage *)message llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(UITableView *)tableView cellForTimeString:(NSString *)timeString llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController didReceiveMessage:(EMMessage *)message llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)hongBaoButtonSelected:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)getHongbaoPopViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)hongBaoDetailSelected:(NSDictionary*)dic llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)grabRedPacket:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
        didSelectMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
  didSelectAvatarMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController didLongPassSelectAvatarMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)LongPoint:(UILongPressGestureRecognizer *)lgz llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)arrayPageLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)DicPageLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
