#import <Foundation/Foundation.h>
#import "MWPhotoProtocol.h"
#import "MWTapDetectingImageView.h"
#import "MWTapDetectingView.h"
#import <DACircularProgress/DACircularProgressView.h>
#import "MWCommon.h"
#import "MWZoomingScrollView.h"
#import "MWPhotoBrowser.h"
#import "MWPhoto.h"
#import "MWPhotoBrowserPrivate.h"
#import "UIImage+MWPhotoBrowser.h"

@interface MWZoomingScrollView (Llslog)
- (void)initWithPhotoBrowser:(MWPhotoBrowser *)browser llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)prepareForReuseLlslog:(NSString *)llslog;
- (void)displayingVideoLlslog:(NSString *)llslog;
- (void)setImageHidden:(BOOL)hidden llslog:(NSString *)llslog;
- (void)setPhoto:(id<MWPhoto>)photo llslog:(NSString *)llslog;
- (void)displayImageLlslog:(NSString *)llslog;
- (void)displayImageFailureLlslog:(NSString *)llslog;
- (void)hideImageFailureLlslog:(NSString *)llslog;
- (void)setProgressFromNotification:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)hideLoadingIndicatorLlslog:(NSString *)llslog;
- (void)showLoadingIndicatorLlslog:(NSString *)llslog;
- (void)initialZoomScaleWithMinScaleLlslog:(NSString *)llslog;
- (void)setMaxMinZoomScalesForCurrentBoundsLlslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)viewForZoomingInScrollView:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view llslog:(NSString *)llslog;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate llslog:(NSString *)llslog;
- (void)scrollViewDidZoom:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)handleSingleTap:(CGPoint)touchPoint llslog:(NSString *)llslog;
- (void)handleDoubleTap:(CGPoint)touchPoint llslog:(NSString *)llslog;
- (void)imageView:(UIImageView *)imageView singleTapDetected:(UITouch *)touch llslog:(NSString *)llslog;
- (void)imageView:(UIImageView *)imageView doubleTapDetected:(UITouch *)touch llslog:(NSString *)llslog;
- (void)view:(UIView *)view singleTapDetected:(UITouch *)touch llslog:(NSString *)llslog;
- (void)view:(UIView *)view doubleTapDetected:(UITouch *)touch llslog:(NSString *)llslog;

@end
