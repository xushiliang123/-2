#import "BaseViewController.h"
#import "MY_TTLClubRedPackListViewController.h"
#import "MY_TTLClubRedHeadTableViewCell.h"
#import "MY_TTLClubRedDetailTableViewCell.h"
#import "MY_GLClubRedInfoModel.h"

@interface MY_TTLClubRedPackListViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)hidesBottomBarWhenPushedLlslog:(NSString *)llslog;
- (void)preferredStatusBarStyleLlslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)selecteDictionaryLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
