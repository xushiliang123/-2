#import "BaseViewController.h"
#import "MY_GLTaskApplyInfoViewController.h"
#import "MY_GLTaskApplyTableViewCell.h"//cell
#import "MY_LYTaskApplyModel.h"

@interface MY_GLTaskApplyInfoViewController (Llslog)
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
- (void)ChatStatus:(MY_LYTaskApplyModel *)model llslog:(NSString *)llslog;
- (void)pushChatVCWithModel:(MY_LYTaskApplyModel *)userModel llslog:(NSString *)llslog;
- (void)helloWithModel:(MY_LYTaskApplyModel *)model llslog:(NSString *)llslog;
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price llslog:(NSString *)llslog;
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)selecteDictionaryLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
