#import <UIKit/UIKit.h>
#import "TZPhotoPreviewController.h"
#import "TZPhotoPreviewCell.h"
#import "TZAssetModel.h"
#import "UIView+Layout.h"
#import "TZImagePickerController.h"
#import "TZImageManager.h"
#import "TZImageCropManager.h"
#import "TZPhotoPreviewController+Llslog.h"

@interface TZPhotoPreviewController (LlslogLlslog)
- (void)viewDidLoadLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setPhotos:(NSMutableArray *)photos llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)configCustomNaviBarLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)configBottomToolBarLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)configCollectionViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)configCropViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)select:(UIButton *)selectButton llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)backButtonClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)doneButtonClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)originalPhotoButtonClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)refreshNaviBarAndBottomBarStateLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)showPhotoBytesLlslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
