#import "EaseUI.h"
#import "ChatViewController.h"
#import "MessageSystemCell.h"               //  灰色系统消息
#import "RealTimeCallCell.h"                //  实时通话
#import "DemoCallManager.h"
#import "MY_LLPayViewController.h"             //  支付
#import "MY_LLBlackPaceter.h"
#import "MY_LLRedPacketCell.h"                 //  红包消息
#import "MY_LLSystemMessageCell.h"             //  系统消息
#import "MY_LYMessageInfoModel.h"
#import "MY_LLSingleChatRedPacketView.h"
#import "MY_LLchatViewHoneBaoCell.h"
#import "MY_LLChatRedPacketView.h"
#import "MY_TTLHongBaoClickPopView.h"
#import "CRWebViewController.h"
#import "ChatViewController+Llslog.h"

@interface ChatViewController (LlslogLlslog)
- (void)WaiteInvateViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addNewPwopleComeViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addNewPwopleComeTwoViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)isCanChatLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addHonbaoViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)goToRechargeButtonClickMethod:(UIButton*)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)updateLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setNavBarButtonLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addHeaderRedPacketViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addTaskHeadViewWithMessage:(NSString *)message refuseBtnTitle:(NSString*)refuseT agreeBtn:(NSString*)agreeT llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)taskCancelbtnClcik:(UIButton*)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)taskAffirmBtnClcik:(UIButton*)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addHeaderAffirmViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)getOrderRedPaceketStatusLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
                           modelForMessage:(EMMessage *)message llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)ringhtBatBtnClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
            didReceiveMessage:(EMMessage *)message llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewController:(EaseMessageViewController *)viewController
  didSelectAvatarMessageModel:(id<IMessageModel>)messageModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)messageViewControllerSendMessages:(EaseMessageViewController *)viewController ForMessage:(EMMessage *)message llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)clickheadIocnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)callDidEndSenderMessageWithDictionary:(NSDictionary *)dict llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)redPacketBtnClick:(UIButton *)btn llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)cancelbtnClcikLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)affirmBtnClcikLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)affirmOrcancelRedPacket:(NSInteger)type llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)grepRedPacketWith:(BOOL)isCancel withHid:(NSInteger)hid llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withHid:(NSString*)hid llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)hongBaoButtonSelected:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)getHongbaoPopViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)SenderSingleRedPacket:(NSNotification*)not llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)SenderSayHellowRedPacket:(NSNotification*)not llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
