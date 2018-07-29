#import <UIKit/UIKit.h>
#import "TZPhotoPreviewController.h"
#import "TZPhotoPreviewCell.h"
#import "TZAssetModel.h"
#import "UIView+Layout.h"
#import "TZImagePickerController.h"
#import "TZImageManager.h"
#import "TZImageCropManager.h"

@interface TZPhotoPreviewController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)setPhotos:(NSMutableArray *)photos llslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog;
- (void)configCustomNaviBarLlslog:(NSString *)llslog;
- (void)configBottomToolBarLlslog:(NSString *)llslog;
- (void)configCollectionViewLlslog:(NSString *)llslog;
- (void)configCropViewLlslog:(NSString *)llslog;
- (void)select:(UIButton *)selectButton llslog:(NSString *)llslog;
- (void)backButtonClickLlslog:(NSString *)llslog;
- (void)doneButtonClickLlslog:(NSString *)llslog;
- (void)originalPhotoButtonClickLlslog:(NSString *)llslog;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)refreshNaviBarAndBottomBarStateLlslog:(NSString *)llslog;
- (void)showPhotoBytesLlslog:(NSString *)llslog;

@end
