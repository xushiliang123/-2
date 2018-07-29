#import <UIKit/UIKit.h>
#import "CallSettingViewController.h"
#import "DemoCallManager.h"
#import "CallResolutionViewController.h"

@interface CallSettingViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)fixedSwitchValueChanged:(UISwitch *)control llslog:(NSString *)llslog;
- (void)showCallInfoChanged:(UISwitch *)control llslog:(NSString *)llslog;
- (void)callPushChanged:(UISwitch *)control llslog:(NSString *)llslog;

@end
