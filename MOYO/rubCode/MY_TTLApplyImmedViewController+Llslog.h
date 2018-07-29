#import "BaseViewController.h"
#import "MY_TTLApplyImmedViewController.h"
#import "MY_TTLCerTitleTableViewCell.h"
#import "MY_TTLCerTextTableViewCell.h"
#import "MY_TTLCerMetailTableViewCell.h"
#import "SXPickPhoto.h"

@interface MY_TTLApplyImmedViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)hideImagePickerLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)createFootViewLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)addClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)btnClick1:(UIButton  *)btn llslog:(NSString *)llslog;
- (void)btnClick2:(UIButton  *)btn llslog:(NSString *)llslog;
- (void)btnClick3:(UIButton  *)btn llslog:(NSString *)llslog;
- (void)btnClick4:(UIButton  *)btn llslog:(NSString *)llslog;
- (void)deleteImage:(NSInteger)tag llslog:(NSString *)llslog;
- (void)addImageLlslog:(NSString *)llslog;
- (void)postPhoto:(NSMutableArray *)array withInteger:(NSInteger)indexType llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
