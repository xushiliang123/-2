#import "BaseViewController.h"
#import "MY_TTLVideoIDentViewController.h"
#import "MY_TTLFacePhotoTableViewCell.h"

@interface MY_TTLVideoIDentViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)createWaitingAuditLlslog:(NSString *)llslog;
- (void)recordClickLlslog:(NSString *)llslog;
- (void)createPassAuditLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog;
- (void)withdraClick:(UIButton* )btn llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)chooseVideoLlslog:(NSString *)llslog;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info llslog:(NSString *)llslog;
- (void)convertVideoQuailtyWithInputURL:(NSURL*)inputURL
                               outputURL:(NSURL*)outputURL
                         completeHandler:(void (^)(AVAssetExportSession*))handler llslog:(NSString *)llslog;
- (void)getVideoDuration:(NSURL*) URL llslog:(NSString *)llslog;
- (void)alertUploadVideo:(NSURL*)URL llslog:(NSString *)llslog;
- (void)uploadVideo:(NSURL*)URL llslog:(NSString *)llslog;
- (void)getVideoPreViewImage:(NSURL *)path llslog:(NSString *)llslog;
- (void)degressFromVideoFileWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
