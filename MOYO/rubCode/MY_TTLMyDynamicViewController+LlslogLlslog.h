#import "BaseViewController.h"
#import "MY_TTLMyDynamicViewController.h"
#import "MyInfomationViewController.h"      //  消息
#import "MY_TTLDynamicIssueViewController.h"   //  发布
#import "MY_XTRewardredpacketsListViewController.h"
#import "ZFPlayer.h"
#import "ParallelButton.h"
#import "VideoResolutionModel.h"
#import "VideoTableViewCell.h"
#import "DYBaseView.h"
#import "MY_LLSingleChatRedPacketView.h"
#import "MY_TTLMyDynamicViewController+Llslog.h"

@interface MY_TTLMyDynamicViewController (LlslogLlslog)
- (void)initLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)headerRefreshingLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)footerRefreshingLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)createRightBtnUILlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zanBtnClick:(UIButton *)button llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)privateChatBtnClick:(UIButton *)btn llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deleteDyanmicWithModel:(VideoResolutionModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)helloWithModel:(VideoResolutionModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)shareWithModel:(VideoResolutionModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addViewLargeImageWithModel:(VideoResolutionModel *)model cell:(VideoTableViewCell *)cell llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewLargeImageWithModel:(VideoResolutionModel *)model cell:(VideoTableViewCell *)cell llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)VideoTableViewCellHongBaoBtnClickWithCell:(VideoTableViewCell *)cell withModel:(VideoResolutionModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForChatRedPacketView:(MY_LLSingleChatRedPacketView *)view withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)controlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)preferredStatusBarStyleLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playerViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)rightBarButtonClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tipsBtnClick:(UIButton *)btn llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)networkDidReceiveMessage:(NSNotification *)not llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)hiddenRedBadgeView:(NSNotification *)not llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
