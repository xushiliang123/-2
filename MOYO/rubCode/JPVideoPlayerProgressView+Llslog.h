#import <UIKit/UIKit.h>
#import "JPVideoPlayerProgressView.h"

@interface JPVideoPlayerProgressView (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)setDownloadProgress:(CGFloat)downloadProgress llslog:(NSString *)llslog;
- (void)setPlayingProgress:(CGFloat)playingProgress llslog:(NSString *)llslog;
- (void)perfersPlayingProgressViewColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)perfersDownloadProgressViewColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)refreshProgressViewForScreenEventsLlslog:(NSString *)llslog;
- (void)refreshProgressWithProgressVaule:(CGFloat)progressValue forLayer:(CALayer *)layer llslog:(NSString *)llslog;
- (void)addIndicatorLayerOnceLlslog:(NSString *)llslog;
- (void)downloadLayerLlslog:(NSString *)llslog;
- (void)playingLayerLlslog:(NSString *)llslog;

@end
