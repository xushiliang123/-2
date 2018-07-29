#import <UIKit/UIKit.h>
#import "MY_XTCreateAnActivityViewController.h"
#import "MY_XTSubjectTableViewCell.h"
#import "MY_TTLEditMateritalTableViewCell.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_XTPickTimeView.h"
#import "MY_XTPickRedPackageView.h"

@interface MY_XTCreateAnActivityViewController (Llslog)
- (void)btnArrayLlslog:(NSString *)llslog;
- (void)activityListLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)gettimeLlslog:(NSString *)llslog;
- (void)ClickCooRow :(int)CellRow llslog:(NSString *)llslog;
- (void)swChange:(UISwitch*) sw llslog:(NSString *)llslog;
- (void)tap:(UIButton *) sender llslog:(NSString *)llslog;
- (void)downoraddperson:(UIButton *)sender llslog:(NSString *)llslog;
- (void)textFieldDidChange:(UITextField *)textField llslog:(NSString *)llslog;
- (void)StartAnActivityLlslog:(NSString *)llslog;
- (void)imgListLlslog:(NSString *)llslog;
- (void)nameListLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
