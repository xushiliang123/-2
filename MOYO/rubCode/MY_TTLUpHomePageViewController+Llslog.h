#import "BaseViewController.h"
#import "MY_TTLUpHomePageViewController.h"
#import "MY_TTLFacePhotoTableViewCell.h"
#import "MY_TTLTextDetailTableViewCell.h"
#import "TZImagePickerController.h"
#import "UIView+Layout.h"
#import "TZTestCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "LxGridViewFlowLayout.h"
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"

@interface MY_TTLUpHomePageViewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)createWaitingAuditLlslog:(NSString *)llslog;
- (void)recordClickLlslog:(NSString *)llslog;
- (void)createPassAuditLlslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog;
- (void)withdraClick:(UIButton* )btn llslog:(NSString *)llslog;
- (void)imagePickerVcLlslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)pushImagePickerControllerLlslog:(NSString *)llslog;
- (void)takePhotoLlslog:(NSString *)llslog;
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info llslog:(NSString *)llslog;
- (void)getVideoDuration:(NSURL*) URL llslog:(NSString *)llslog;
- (void)refreshCollectionViewWithAddedAsset:(id)asset image:(UIImage *)image llslog:(NSString *)llslog;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker llslog:(NSString *)llslog;
- (void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker llslog:(NSString *)llslog;
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto llslog:(NSString *)llslog;
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset llslog:(NSString *)llslog;
- (void)deleteBtnClik:(UIButton *)sender llslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)printAssetsName:(NSArray *)assets llslog:(NSString *)llslog;
- (void)supportedInterfaceOrientationsLlslog:(NSString *)llslog;
- (void)pageArrayLlslog:(NSString *)llslog;
- (void)convertVideoQuailtyWithInputURL:(NSURL*)inputURL
                               outputURL:(NSURL*)outputURL
                         completeHandler:(void (^)(AVAssetExportSession*))handler llslog:(NSString *)llslog;
- (void)alertUploadVideo:(NSURL*)URL llslog:(NSString *)llslog;
- (void)uploadVideo:(NSURL*)URL llslog:(NSString *)llslog;
- (void)getVideoPreViewImage:(NSURL *)path llslog:(NSString *)llslog;
- (void)degressFromVideoFileWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
