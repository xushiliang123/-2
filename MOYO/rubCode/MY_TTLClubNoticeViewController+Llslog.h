#import "BaseViewController.h"
#import "MY_TTLClubNoticeViewController.h"
#import "MY_TTLClubNoticeTableViewCell.h"
#import "MY_TTLClubNoticeEndTableViewCell.h"
#import "MY_XTInviteTableViewCell.h"
#import "MY_XTRefuceInviteTableViewCell.h"
#import "MY_TTLSelfCenterViewController.h"
#import "MY_XTClubNoticeModel.h"

@interface MY_TTLClubNoticeViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)headerRefreshingLlslog:(NSString *)llslog;
- (void)footerRefreshingLlslog:(NSString *)llslog;
- (void)rightBarEmptyAction:(UIButton *)emptyBtn llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)agree:(UIButton *)sender llslog:(NSString *)llslog;
- (void)disagree:(UIButton *)sender llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
