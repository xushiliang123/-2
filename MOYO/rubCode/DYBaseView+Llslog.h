#import <UIKit/UIKit.h>
#import "PhotoLibModel.h"
#import "DYBaseView.h"
#import <Masonry.h>
#import <AVFoundation/AVFoundation.h>
#import "ZFPlayer.h"

@interface DYBaseView (Llslog)
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)setupScrollViewLlslog:(NSString *)llslog;
- (void)setupIndicatorLlslog:(NSString *)llslog;
- (void)refreshImagesLlslog:(NSString *)llslog;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)scrollViewDidClickLlslog:(NSString *)llslog;
- (void)LeftImageViewFrame:(PhotoLibModel*)leftModel llslog:(NSString *)llslog;
- (void)CenterImageViewFrame:(PhotoLibModel*)centerModel llslog:(NSString *)llslog;
- (void)RightImageViewFrame:(PhotoLibModel*)rightModel llslog:(NSString *)llslog;
- (void)beginPlaying:(UIImageView*)imagePlayView withMOde:(PhotoLibModel*)model llslog:(NSString *)llslog;
- (void)preferredStatusBarStyleLlslog:(NSString *)llslog;
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog;
- (void)playerViewLlslog:(NSString *)llslog;
- (void)playerModelLlslog:(NSString *)llslog;
- (void)zf_playerBackActionLlslog:(NSString *)llslog;
- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog;
- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog;

@end
