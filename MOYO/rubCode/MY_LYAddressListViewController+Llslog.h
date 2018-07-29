#import "ViewController.h"
#import "MY_LYAddressListViewController.h"
#import "JGTeamMemberManager.h"
#import "MY_LLAddressListCell.h"
#import "MY_GLClubListViewController.h"

@interface MY_LYAddressListViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)createHeaderViewLlslog:(NSString *)llslog;
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText llslog:(NSString *)llslog;
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar llslog:(NSString *)llslog;
- (void)filterBySubstring:(NSString*) subStr llslog:(NSString *)llslog;
- (void)gotoGroupListClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)createFooterViewLlslog:(NSString *)llslog;
- (void)headerRefreshingLlslog:(NSString *)llslog;
- (void)downLoadData:(NSInteger)page isReshing:(BOOL)isReshing llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)sectionIndexTitlesForTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)searchArrayLlslog:(NSString *)llslog;
- (void)keyArrayLlslog:(NSString *)llslog;
- (void)listArrayLlslog:(NSString *)llslog;
- (void)listArrayNewLlslog:(NSString *)llslog;
- (void)keyArrayNewLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
