#import "BaseViewController.h"
#import "MY_LYLocationViewController.h"
#import "LocationTableViewCell.h"
#import "LOtherTableViewCell.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import "MY_LYMessageInfoModel.h"

@interface MY_LYLocationViewController (Llslog)
- (void)hidesBottomBarWhenPushedLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)configLocationManagerLlslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)addDataLlslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog;
- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText llslog:(NSString *)llslog;
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar llslog:(NSString *)llslog;
- (void)searchBarShouldBeginEditing:(UISearchBar *)searchBar llslog:(NSString *)llslog;
- (void)filterBySubstring:(NSString*) subStr llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)sectionIndexTitlesForTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)updateRegion:(NSString *)region llslog:(NSString *)llslog;
- (void)updateUserInfoMethod:(NSString *)region llslog:(NSString *)llslog;
- (void)searchBarTextChanged:(UITextField *)textFiled llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
