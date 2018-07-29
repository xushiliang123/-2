#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "TZAssetCell.h"
#import "TZAssetModel.h"
#import "UIView+Layout.h"
#import "TZImageManager.h"
#import "TZImagePickerController.h"
#import "TZProgressView.h"

@interface TZAssetCell (Llslog)
- (void)setModel:(TZAssetModel *)model llslog:(NSString *)llslog;
- (void)setShowSelectBtn:(BOOL)showSelectBtn llslog:(NSString *)llslog;
- (void)setType:(TZAssetCellType)type llslog:(NSString *)llslog;
- (void)selectPhotoButtonClick:(UIButton *)sender llslog:(NSString *)llslog;
- (void)hideProgressViewLlslog:(NSString *)llslog;
- (void)fetchBigImageLlslog:(NSString *)llslog;
- (void)selectPhotoButtonLlslog:(NSString *)llslog;
- (void)imageViewLlslog:(NSString *)llslog;
- (void)selectImageViewLlslog:(NSString *)llslog;
- (void)bottomViewLlslog:(NSString *)llslog;
- (void)viewImgViewLlslog:(NSString *)llslog;
- (void)timeLengthLlslog:(NSString *)llslog;
- (void)progressViewLlslog:(NSString *)llslog;

@end
