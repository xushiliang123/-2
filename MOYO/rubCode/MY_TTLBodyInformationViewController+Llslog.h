#import "BaseViewController.h"
#import "MY_TTLMeModel.h"
#import "MY_TTLBodyInformationViewController.h"
#import "MY_TTLAddVCerTableViewCell.h"
#import "MY_TTLVKindTyoeTableViewCell.h"
#import "MY_TTLVRequireTableViewCell.h"
#import "MY_TTLCerInstructionViewController.h"
#import "MY_LYMessageInfoModel.h"

@interface MY_TTLBodyInformationViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)createFootViewLlslog:(NSString *)llslog;
- (void)addClickLlslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;

@end
