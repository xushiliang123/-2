#import "BaseViewController.h"
#import "EssenceViewController.h"
#import "VideoTableViewCell.h"
#import "ParallelButton.h"
#import "ReportDynamicViewController.h"
#import "DYBaseView.h"
#import "MY_LLSingleChatRedPacketView.h"
#import "MY_XTRewardredpacketsListViewController.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_LYDynamicViewController.h"
#import "EssenceViewController+Llslog.h"

@interface EssenceViewController (LlslogLlslog)
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)initUILlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)headerRefreshingLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)footerRefreshingLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)longPressedAct:(UILongPressGestureRecognizer *)gesture llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)avatarBtnClick:(UIButton *)btn llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)attentionBtnClick:(UIButton *)btn llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zanBtnClick:(UIButton *)button llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)privateChatBtnClick:(UIButton *)btn llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)ChatStatus:(VideoResolutionModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)pushChatVCWithModel:(VideoResolutionModel *)userModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deleteDyanmicWithModel:(VideoResolutionModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)helloWithModel:(VideoResolutionModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addViewLargeImageWithModel:(VideoResolutionModel *)model cell:(VideoTableViewCell *)cell llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewLargeImageWithModel:(VideoResolutionModel *)model cell:(VideoTableViewCell *)cell llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)VideoTableViewCellHongBaoBtnClickWithCell:(VideoTableViewCell *)cell withModel:(VideoResolutionModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForChatRedPacketView:(MY_LLSingleChatRedPacketView *)view withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)GetifpayattentionWithStatus:(BOOL)payattention llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)dataGiftArrayLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)giftinfoArrayLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)preferredStatusBarStyleLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playerViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)controlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
