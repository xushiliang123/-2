#import <UIKit/UIKit.h>
#import "MY_XTBundZFBViewController.h"
#import "MY_LYMessageInfoModel.h"

@interface MY_XTBundZFBViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)submitButtonLlslog:(NSString *)llslog;
- (void)BundButtonClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)getCodeBtnClickLlslog:(NSString *)llslog;
- (void)autoMoveLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
