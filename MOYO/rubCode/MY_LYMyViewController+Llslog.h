#import "RootBaseViewController.h"
#import "MY_LYMyViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetRepresentation.h>
#import "MyTableViewCell.h"
#import "MY_TTLSkillCenterTableViewCell.h"
#import "MY_TTLMyHeaderTableViewCell.h"
#import "MY_TTLStealthSettingViewController.h"
#import "ZFPlayer.h"
#import "MY_TTLInviteFriendViewController.h"       //邀请好友
#import "MY_TTLChangeMoneyViewController.h"        //我的账户
#import "MY_TTLBodyInformationViewController.h"    //加V认证
#import "MY_TTLToBeNobilityViewController.h"       //成为贵族
#import "MY_TTLUpHomePageViewController.h"         //上首页
#import "MY_TTLVideoIDentViewController.h"         //视频认证
#import "VTimeWKWebViewController.h"            //公用web页面，我的Vip
#import "MY_TTLEditInfoViewController.h"           //编辑资料
#import "MY_TTLMySetViewController.h"              //设置
#import "MY_TTLPacketsRecordViewController.h"      //红包记录
#import "MY_TTLMyDynamicViewController.h"          //我的动态
#import "MY_LLCustomerServiceViewController.h"     //客服
#import "MY_TTLSelfCenterViewController.h"         //个人中心
#import "RechargeViewController.h"              //充值
#import "MY_LLCreateClubsViewController.h"         //创建俱乐部
#import "MY_GLClubListViewController.h"            //跳转俱乐部列表
#import "CRWebViewController.h"                 //邀请好友
#import "MY_TTLPlayViewController.h"               //玩法攻略
#import "MY_GLMainTopicTableViewCell.h"            //主标题Cell
#import "MY_LYMessageInfoModel.h"
#import "MY_TTLMeModel.h"

@interface MY_LYMyViewController (Llslog)
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)addNewPwopleComeViewLlslog:(NSString *)llslog;
- (void)addNewPwopleComeTwoViewLlslog:(NSString *)llslog;
- (void)addNewPwopleComeThreeViewLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)findScrollViewLlslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)videoClickLlslog:(NSString *)llslog;
- (void)editInfoClickLlslog:(NSString *)llslog;
- (void)selfIngoClickLlslog:(NSString *)llslog;
- (void)leftSingleTap:(UITapGestureRecognizer *)sender llslog:(NSString *)llslog;
- (void)rightSingleTap:(UITapGestureRecognizer *)sender llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)skillCenterClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)secretchange:(id)sender llslog:(NSString *)llslog;
- (void)dynamicArrayLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
