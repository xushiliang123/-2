#import <UIKit/UIKit.h>
#import "TZPhotoPickerController.h"
#import "TZImagePickerController.h"
#import "TZPhotoPreviewController.h"
#import "TZAssetCell.h"
#import "TZAssetModel.h"
#import "UIView+Layout.h"
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"

@interface TZPhotoPickerController (Llslog)
- (void)imagePickerVcLlslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)initSubviewsLlslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog;
- (void)configCollectionViewLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)configBottomToolBarLlslog:(NSString *)llslog;
- (void)previewButtonClickLlslog:(NSString *)llslog;
- (void)originalPhotoButtonClickLlslog:(NSString *)llslog;
- (void)doneButtonClickLlslog:(NSString *)llslog;
- (void)didGetAllPhotos:(NSArray *)photos assets:(NSArray *)assets infoArr:(NSArray *)infoArr llslog:(NSString *)llslog;
- (void)callDelegateMethodWithPhotos:(NSArray *)photos assets:(NSArray *)assets infoArr:(NSArray *)infoArr llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)takePhotoLlslog:(NSString *)llslog;
- (void)refreshBottomToolBarStatusLlslog:(NSString *)llslog;
- (void)pushPhotoPrevireViewController:(TZPhotoPreviewController *)photoPreviewVc llslog:(NSString *)llslog;
- (void)getSelectedPhotoBytesLlslog:(NSString *)llslog;
- (void)scaleImage:(UIImage *)image toSize:(CGSize)size llslog:(NSString *)llslog;
- (void)scrollCollectionViewToBottomLlslog:(NSString *)llslog;
- (void)checkSelectedModelsLlslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info llslog:(NSString *)llslog;
- (void)reloadPhotoArrayLlslog:(NSString *)llslog;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)resetCachedAssetsLlslog:(NSString *)llslog;
- (void)updateCachedAssetsLlslog:(NSString *)llslog;
- (void)computeDifferenceBetweenRect:(CGRect)oldRect andRect:(CGRect)newRect removedHandler:(void (^)(CGRect removedRect))removedHandler addedHandler:(void (^)(CGRect addedRect))addedHandler llslog:(NSString *)llslog;
- (void)assetsAtIndexPaths:(NSArray *)indexPaths llslog:(NSString *)llslog;
- (void)aapl_indexPathsForElementsInRect:(CGRect)rect llslog:(NSString *)llslog;

@end
