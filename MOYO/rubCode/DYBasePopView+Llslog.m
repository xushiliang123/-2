#import "DYBasePopView+Llslog.h"
@implementation DYBasePopView (Llslog)
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setupScrollViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setupIndicatorLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)refreshImagesLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)scrollViewDidClickLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)LeftImageViewFrame:(PhotoLibModel*)leftModel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)CenterImageViewFrame:(PhotoLibModel*)centerModel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)RightImageViewFrame:(PhotoLibModel*)rightModel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)beginPlaying:(UIImageView*)imagePlayView withMOde:(PhotoLibModel*)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)preferredStatusBarStyleLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prefersStatusBarHiddenLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playerViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playerModelLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)zf_playerBackActionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)zf_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
