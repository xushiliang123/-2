#import "ViewController.h"
#import "MY_TTLNewActiveViewController.h"
#import "MY_TTLActiveHomeTableViewCell.h"
#import "MY_TTLSelfCenterViewController.h"
#import "CRWebViewController.h"
#import "MY_LYMessageInfoModel.h"
#import "UIView+WebVideoCache.h"
#import "UITableView+VideoPlay.h"
#import "MY_GLHomeModel.h"
#import "Banner.h"
#import "TopScrollView.h"

@interface MY_TTLNewActiveViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)headerRefreshingLlslog:(NSString *)llslog;
- (void)footerRefreshingLlslog:(NSString *)llslog;
- (void)downloadDataWithURL:(NSString *)urlstr parameters:(NSDictionary *)parameters llslog:(NSString *)llslog;
- (void)addDatabaseAndRefreshTableView:(NSDictionary *)data llslog:(NSString *)llslog;
- (void)addBannerpageDataWithURL:(NSString *)urlstr parameters:(NSDictionary *)parameters llslog:(NSString *)llslog;
- (void)addBannerpage:(NSDictionary *)data llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)handleScrollDerectionWithOffset:(CGFloat)offsetY llslog:(NSString *)llslog;
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price llslog:(NSString *)llslog;
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price llslog:(NSString *)llslog;
- (void)setupLlslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)imageArrayLlslog:(NSString *)llslog;
- (void)selecteDictionaryLlslog:(NSString *)llslog;
- (void)pathStringsLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
