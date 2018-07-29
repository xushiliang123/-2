#import "BaseViewController.h"
#import "MY_TTLIncomeDetailViewController.h"
#import "MY_TTLIncomeDetailsTableViewCell.h"
#import "MY_TTLIncomeModel.h"
#import "MY_TTLIncomeChooseView.h"

@interface MY_TTLIncomeDetailViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)shaixuanActionLlslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog;
- (void)headerRefreshingLlslog:(NSString *)llslog;
- (void)footerRefreshingLlslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)typeIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
