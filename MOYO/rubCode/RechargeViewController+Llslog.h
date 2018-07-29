#import "BaseViewController.h"
#import "RechargeViewController.h"
#import "SelectMoneyView.h"
#import "PayScelectTableViewCell.h"

@interface RechargeViewController (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)reLodaDataLlslog:(NSString *)llslog;
- (void)submitButtonLlslog:(NSString *)llslog;
- (void)submitButtonClick:(UIButton*)sender llslog:(NSString *)llslog;
- (void)WXPAYSuccess:(NSNotification *)not llslog:(NSString *)llslog;
- (void)WXPAYERROR:(NSNotification *)not llslog:(NSString *)llslog;
- (void)backClickLlslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
