#import <UIKit/UIKit.h>
#import "MY_XTActivityViewController.h"
#import "MY_XTActivityTableViewCell.h"
#import "MY_XTCreateAnActivityViewController.h"
#import "MY_XTDetailActivityViewController.h"

@interface MY_XTActivityViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
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
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
