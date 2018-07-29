#import "BaseViewController.h"
#import "MY_TTLDynamicIssueViewController.h"
#import "IQKeyboardManager.h"
#import "TZImagePickerController.h"
#import "UIView+Layout.h"
#import "TZTestCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "LxGridViewFlowLayout.h"
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"

@interface MY_TTLDynamicIssueViewController (Llslog)
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)imagePickerVcLlslog:(NSString *)llslog;
- (void)leftBarActionLlslog:(NSString *)llslog;
- (void)rightBarAction:(id)sender llslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog;
- (void)configCollectionViewLlslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath canMoveToIndexPath:(NSIndexPath *)destinationIndexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath llslog:(NSString *)llslog;
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
- (void)textViewDidChange:(UITextView *)textView llslog:(NSString *)llslog;
- (void)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text llslog:(NSString *)llslog;
- (void)textViewDidBeginEditing:(UITextView *)textView llslog:(NSString *)llslog;
- (void)textViewDidEndEditing:(UITextView *)textView llslog:(NSString *)llslog;
- (void)dictLlslog:(NSString *)llslog;
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
