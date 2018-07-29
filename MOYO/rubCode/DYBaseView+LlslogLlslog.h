#import <UIKit/UIKit.h>
#import "PhotoLibModel.h"
#import "DYBaseView.h"
#import <Masonry.h>
#import <AVFoundation/AVFoundation.h>
#import "ZFPlayer.h"
#import "DYBaseView+Llslog.h"

@interface DYBaseView (LlslogLlslog)
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setupScrollViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setupIndicatorLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)refreshImagesLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)scrollViewDidClickLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)LeftImageViewFrame:(PhotoLibModel*)leftModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)CenterImageViewFrame:(PhotoLibModel*)centerModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)RightImageViewFrame:(PhotoLibModel*)rightModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)beginPlaying:(UIImageView*)imagePlayView withMOde:(PhotoLibModel*)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)preferredStatusBarStyleLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playerViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playerModelLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerBackActionLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
