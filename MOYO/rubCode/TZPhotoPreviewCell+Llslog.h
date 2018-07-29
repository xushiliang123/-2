#import <UIKit/UIKit.h>
#import "TZPhotoPreviewCell.h"
#import "TZAssetModel.h"
#import "UIView+Layout.h"
#import "TZImageManager.h"
#import "TZProgressView.h"

@interface TZPhotoPreviewCell (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)configProgressViewLlslog:(NSString *)llslog;
- (void)setModel:(TZAssetModel *)model llslog:(NSString *)llslog;
- (void)recoverSubviewsLlslog:(NSString *)llslog;
- (void)resizeSubviewsLlslog:(NSString *)llslog;
- (void)setAllowCrop:(BOOL)allowCrop llslog:(NSString *)llslog;
- (void)refreshScrollViewContentSizeLlslog:(NSString *)llslog;
- (void)doubleTap:(UITapGestureRecognizer *)tap llslog:(NSString *)llslog;
- (void)singleTap:(UITapGestureRecognizer *)tap llslog:(NSString *)llslog;
- (void)viewForZoomingInScrollView:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view llslog:(NSString *)llslog;
- (void)scrollViewDidZoom:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale llslog:(NSString *)llslog;
- (void)refreshImageContainerViewCenterLlslog:(NSString *)llslog;

@end
