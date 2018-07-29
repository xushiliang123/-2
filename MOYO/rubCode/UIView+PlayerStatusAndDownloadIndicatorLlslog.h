#import <UIKit/UIKit.h>
#import "UIView+PlayerStatusAndDownloadIndicator.h"
#import <objc/runtime.h>
#import "JPVideoPlayerPlayVideoTool.h"
#import "JPVideoPlayerActivityIndicator.h"
#import "JPVideoPlayerProgressView.h"
#import "UIView+WebVideoCache.h"

@interface UIView (PlayerStatusAndDownloadIndicatorLlslog)
- (void)jp_indicatorViewLlslog:(NSString *)llslog;
- (void)jp_perfersPlayingProgressViewColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)jp_perfersDownloadProgressViewColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)displayBackLayerLlslog:(NSString *)llslog;
- (void)refreshIndicatorViewForPortraitLlslog:(NSString *)llslog;
- (void)refreshIndicatorViewForLandscapeLlslog:(NSString *)llslog;
- (void)jp_showProgressViewLlslog:(NSString *)llslog;
- (void)jp_hideProgressViewLlslog:(NSString *)llslog;
- (void)jp_progressViewDownloadingStatusChangedWithProgressValue:(NSNumber *)progress llslog:(NSString *)llslog;
- (void)jp_progressViewPlayingStatusChangedWithProgressValue:(NSNumber *)progress llslog:(NSString *)llslog;
- (void)jp_showActivityIndicatorViewLlslog:(NSString *)llslog;
- (void)jp_hideActivityIndicatorViewLlslog:(NSString *)llslog;
- (void)jp_setupVideoLayerViewAndIndicatorViewLlslog:(NSString *)llslog;
- (void)jp_removeVideoLayerViewAndIndicatorViewLlslog:(NSString *)llslog;
- (void)jp_backgroundLayerLlslog:(NSString *)llslog;
- (void)setJp_playingProgressValue:(CGFloat)jp_playingProgressValue llslog:(NSString *)llslog;
- (void)jp_playingProgressValueLlslog:(NSString *)llslog;
- (void)setJp_downloadProgressValue:(CGFloat)jp_downloadProgressValue llslog:(NSString *)llslog;
- (void)jp_downloadProgressValueLlslog:(NSString *)llslog;
- (void)setProgressViewTintColor:(UIColor *)progressViewTintColor llslog:(NSString *)llslog;
- (void)progressViewTintColorLlslog:(NSString *)llslog;
- (void)setProgressViewBackgroundColor:(UIColor *)progressViewBackgroundColor llslog:(NSString *)llslog;
- (void)progressViewBackgroundColorLlslog:(NSString *)llslog;
- (void)progressViewLlslog:(NSString *)llslog;
- (void)activityIndicatorViewLlslog:(NSString *)llslog;
- (void)jp_videoLayerViewLlslog:(NSString *)llslog;
- (void)layoutProgressViewForPortrait:(UIView *)progressView llslog:(NSString *)llslog;
- (void)layoutProgressViewForLandscape:(UIView *)progressView llslog:(NSString *)llslog;
- (void)layoutActivityIndicatorViewForPortrait:(UIView *)acv llslog:(NSString *)llslog;
- (void)layoutActivityIndicatorViewForLandscape:(UIView *)acv llslog:(NSString *)llslog;

@end
