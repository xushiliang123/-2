#import "BaseViewController.h"
#import "MY_TTLReportViewController.h"
#import "MY_TTLRepordTableViewCell.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface MY_TTLReportViewController (Llslog)
- (void)hidesBottomBarWhenPushedLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)downloadReportReasonLlslog:(NSString *)llslog;
- (void)dataArrayLlslog:(NSString *)llslog;
- (void)createHeaderViewLlslog:(NSString *)llslog;
- (void)createFooterViewLlslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)withdraClickLlslog:(NSString *)llslog;
- (void)imgvAddSelectedImageLlslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)textViewDidEndEditing:(UITextView *)textView llslog:(NSString *)llslog;
- (void)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text llslog:(NSString *)llslog;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info llslog:(NSString *)llslog;
- (void)imageArray:(NSMutableArray *)array llslog:(NSString *)llslog;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)arrayPageLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
