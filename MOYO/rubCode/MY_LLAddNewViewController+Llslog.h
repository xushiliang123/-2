#import "BaseViewController.h"
#import "MY_LLAddNewViewController.h"
#import "MY_LLAddNewMemberCell.h"

@interface MY_LLAddNewViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)createHeaderViewLlslog:(NSString *)llslog;
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText llslog:(NSString *)llslog;
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar llslog:(NSString *)llslog;
- (void)filterBySubstring:(NSString*) subStr llslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)rightBarAction:(UIButton *)btn llslog:(NSString *)llslog;
- (void)downLoadDataLlslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)searchArrayLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
