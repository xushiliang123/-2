#import <UIKit/UIKit.h>
#import "MY_XTTiXianViewController.h"
#import "SelectMoneyView.h"
#import "PayScelectTableViewCell.h"
#import "MY_XTBundWXViewController.h"
#import "MY_XTBundZFBViewController.h"
#import "MY_XTConfirmTixianView.h"

@interface MY_XTTiXianViewController (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)submitButtonLlslog:(NSString *)llslog;
- (void)upLoadDataLlslog:(NSString *)llslog;
- (void)submitButtonClick:(UIButton*)sender llslog:(NSString *)llslog;
- (void)isPureInt:(NSString*)string llslog:(NSString *)llslog;
- (void)isPureFloat:(NSString*)string llslog:(NSString *)llslog;
- (void)deptNumInputShouldNumber:(NSString *)str llslog:(NSString *)llslog;
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
- (void)BundSuccess:(NSNotification *)not llslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
