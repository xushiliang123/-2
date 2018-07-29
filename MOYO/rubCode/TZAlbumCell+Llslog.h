#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "TZAssetCell.h"
#import "TZAssetModel.h"
#import "UIView+Layout.h"
#import "TZImageManager.h"
#import "TZImagePickerController.h"
#import "TZProgressView.h"

@interface TZAlbumCell (Llslog)
- (void)setModel:(TZAlbumModel *)model llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)layoutSublayersOfLayer:(CALayer *)layer llslog:(NSString *)llslog;
- (void)posterImageViewLlslog:(NSString *)llslog;
- (void)titleLableLlslog:(NSString *)llslog;
- (void)arrowImageViewLlslog:(NSString *)llslog;
- (void)selectedCountButtonLlslog:(NSString *)llslog;

@end
