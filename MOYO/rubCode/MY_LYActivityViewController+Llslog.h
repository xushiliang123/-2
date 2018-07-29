#import <UIKit/UIKit.h>
#import "MY_LYActivityViewController.h"
#import "MY_XTActivityTableViewCell.h"
#import "MY_LYCreateAnActivityViewController.h"
#import "MY_XTDetailActivityViewController.h"
#import "MY_GLTaskApplyInfoViewController.h"
#import "TopScrollView.h"
#import "MY_LYTaskListModel.h"

@interface MY_LYActivityViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)updateDataLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)UpdateUILlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)headerRefreshingLlslog:(NSString *)llslog;
- (void)footerRefreshingLlslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)selecteDictionaryLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
