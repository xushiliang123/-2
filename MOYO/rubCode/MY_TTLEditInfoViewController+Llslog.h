#import "BaseViewController.h"
#import "MY_TTLMeModel.h"
#import "MY_TTLEditInfoViewController.h"
#import "MY_TTLEditMateritalTableViewCell.h"
#import "SXPickPhoto.h"
#import "MY_TTLHeadIconTableViewCell.h"
#import "CounterMarkViewController.h"
#import "MY_LYPersonInfoModel.h"
#import "MY_LLDBManager.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_GLSheetView.h"

@interface MY_TTLEditInfoViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)hideImagePickerLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)usePhonePhotoAndCameraLlslog:(NSString *)llslog;
- (void)pushImagePickerControllerLlslog:(NSString *)llslog;
- (void)imageArray:(NSMutableArray *)array llslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog;
- (void)rightBarButtonTargetLlslog:(NSString *)llslog;
- (void)updateUserInfoMethod:(NSDictionary *)dataDict llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)textFieldDidEndEditing:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string llslog:(NSString *)llslog;
- (void)stateArrayLlslog:(NSString *)llslog;
- (void)arrayPageLlslog:(NSString *)llslog;
- (void)dictDataLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
