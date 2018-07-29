#import "BaseViewController.h"
#import "MY_TTLMySetViewController.h"
#import "MyTableViewCell.h"
#import "MY_TTLOrderDetailNewsTableViewCell.h"
#import "MY_TTLNotificationsViewController.h"
#import "MY_TTLStealthSettingViewController.h"
#import "BlacklistViewController.h"
#import "MY_TTLChangePasswordViewController.h"
#import "MY_TTLIDAuthenticationViewController.h"
#import "MY_TTLProductPreViewViewController.h"
#import "VTimeWKWebViewController.h"

@interface MY_TTLMySetViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)folderSizeLlslog:(NSString *)llslog;
- (void)removeCacheLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
