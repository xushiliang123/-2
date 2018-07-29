#import <UIKit/UIKit.h>
#import "LMJTab.h"
#import "MY_XTDetailActivityViewController.h"
#import "MY_TTLEditMateritalTableViewCell.h"

@interface MY_XTDetailActivityViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)CreateUILlslog:(NSString *)llslog;
- (void)headerRefreshingLlslog:(NSString *)llslog;
- (void)footerRefreshingLlslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)JoinOrQuit:(UIButton *)btn llslog:(NSString *)llslog;
- (void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
