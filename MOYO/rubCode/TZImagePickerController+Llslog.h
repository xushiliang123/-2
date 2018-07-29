#import <UIKit/UIKit.h>
#import "TZAssetModel.h"
#import "NSBundle+TZImagePicker.h"
#import "TZImagePickerController.h"
#import "TZPhotoPickerController.h"
#import "TZPhotoPreviewController.h"
#import "TZAssetModel.h"
#import "TZAssetCell.h"
#import "UIView+Layout.h"
#import "TZImageManager.h"

@interface TZImagePickerController (Llslog)
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)setBarItemTextFont:(UIFont *)barItemTextFont llslog:(NSString *)llslog;
- (void)setBarItemTextColor:(UIColor *)barItemTextColor llslog:(NSString *)llslog;
- (void)configBarButtonItemAppearanceLlslog:(NSString *)llslog;
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)initWithMaxImagesCount:(NSInteger)maxImagesCount delegate:(id<TZImagePickerControllerDelegate>)delegate llslog:(NSString *)llslog;
- (void)initWithMaxImagesCount:(NSInteger)maxImagesCount columnNumber:(NSInteger)columnNumber delegate:(id<TZImagePickerControllerDelegate>)delegate llslog:(NSString *)llslog;
- (void)initWithMaxImagesCount:(NSInteger)maxImagesCount columnNumber:(NSInteger)columnNumber delegate:(id<TZImagePickerControllerDelegate>)delegate pushPhotoPickerVc:(BOOL)pushPhotoPickerVc llslog:(NSString *)llslog;
- (void)initWithSelectedAssets:(NSMutableArray *)selectedAssets selectedPhotos:(NSMutableArray *)selectedPhotos index:(NSInteger)index llslog:(NSString *)llslog;
- (void)initCropTypeWithAsset:(id)asset photo:(UIImage *)photo completion:(void (^)(UIImage *cropImage,id asset))completion llslog:(NSString *)llslog;
- (void)configDefaultSettingLlslog:(NSString *)llslog;
- (void)configDefaultImageNameLlslog:(NSString *)llslog;
- (void)configDefaultBtnTitleLlslog:(NSString *)llslog;
- (void)observeAuthrizationStatusChangeLlslog:(NSString *)llslog;
- (void)pushPhotoPickerVcLlslog:(NSString *)llslog;
- (void)showAlertWithTitle:(NSString *)title llslog:(NSString *)llslog;
- (void)showProgressHUDLlslog:(NSString *)llslog;
- (void)hideProgressHUDLlslog:(NSString *)llslog;
- (void)setMaxImagesCount:(NSInteger)maxImagesCount llslog:(NSString *)llslog;
- (void)setShowSelectBtn:(BOOL)showSelectBtn llslog:(NSString *)llslog;
- (void)setAllowCrop:(BOOL)allowCrop llslog:(NSString *)llslog;
- (void)setCircleCropRadius:(NSInteger)circleCropRadius llslog:(NSString *)llslog;
- (void)cropRectLlslog:(NSString *)llslog;
- (void)setTimeout:(NSInteger)timeout llslog:(NSString *)llslog;
- (void)setColumnNumber:(NSInteger)columnNumber llslog:(NSString *)llslog;
- (void)setMinPhotoWidthSelectable:(NSInteger)minPhotoWidthSelectable llslog:(NSString *)llslog;
- (void)setMinPhotoHeightSelectable:(NSInteger)minPhotoHeightSelectable llslog:(NSString *)llslog;
- (void)setHideWhenCanNotSelect:(BOOL)hideWhenCanNotSelect llslog:(NSString *)llslog;
- (void)setPhotoPreviewMaxWidth:(CGFloat)photoPreviewMaxWidth llslog:(NSString *)llslog;
- (void)setSelectedAssets:(NSMutableArray *)selectedAssets llslog:(NSString *)llslog;
- (void)setAllowPickingImage:(BOOL)allowPickingImage llslog:(NSString *)llslog;
- (void)setAllowPickingVideo:(BOOL)allowPickingVideo llslog:(NSString *)llslog;
- (void)setSortAscendingByModificationDate:(BOOL)sortAscendingByModificationDate llslog:(NSString *)llslog;
- (void)settingBtnClickLlslog:(NSString *)llslog;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)supportedInterfaceOrientationsLlslog:(NSString *)llslog;
- (void)cancelButtonClickLlslog:(NSString *)llslog;
- (void)callDelegateMethodLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;

@end
