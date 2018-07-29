#import <UIKit/UIKit.h>
#import "TZPhotoPreviewCell.h"
#import "TZAssetModel.h"
#import "UIView+Layout.h"
#import "TZImageManager.h"
#import "TZProgressView.h"
#import "TZPhotoPreviewCell+Llslog.h"

@interface TZPhotoPreviewCell (LlslogLlslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)configProgressViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setModel:(TZAssetModel *)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)recoverSubviewsLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)resizeSubviewsLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setAllowCrop:(BOOL)allowCrop llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)refreshScrollViewContentSizeLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)doubleTap:(UITapGestureRecognizer *)tap llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)singleTap:(UITapGestureRecognizer *)tap llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)viewForZoomingInScrollView:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewDidZoom:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)refreshImageContainerViewCenterLlslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
