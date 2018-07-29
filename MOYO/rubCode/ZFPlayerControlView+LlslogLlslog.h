#import <UIKit/UIKit.h>
#import "ASValueTrackingSlider.h"
#import "ZFPlayer.h"
#import "BarrageView.h"
#import "ZFPlayerControlView.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "UIView+CustomControlView.h"
#import "MMMaterialDesignSpinner.h"
#import "ZFPlayerControlView+Llslog.h"

@interface ZFPlayerControlView (LlslogLlslog)
- (void)initLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)makeSubViewsConstraintsLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)changeResolution:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tapSliderAction:(UITapGestureRecognizer *)tap llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)panRecognizer:(UIPanGestureRecognizer *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)backBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)lockScrrenBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)closeBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)fullScreenBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)repeatBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)shareBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)aboutBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)downloadBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)resolutionBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)centerPlayBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)barrageSwitchBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)failBtnClick:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)progressSliderTouchBegan:(ASValueTrackingSlider *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)progressSliderValueChanged:(ASValueTrackingSlider *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)progressSliderTouchEnded:(ASValueTrackingSlider *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)appDidEnterBackgroundLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)appDidEnterPlaygroundLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playerPlayDidEndLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)onDeviceOrientationChangeLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setOrientationLandscapeConstraintLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setOrientationPortraitConstraintLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)showControlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)hideControlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)listeningRotatingLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)autoFadeOutControlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)thumbRectLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setShrink:(BOOL)shrink llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setFullScreen:(BOOL)fullScreen llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)titleLabelLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)backBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)topImageViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)bottomImageViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)lockBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)startBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)closeBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)currentTimeLabelLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)progressViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)videoSliderLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)totalTimeLabelLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)fullScreenBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)activityLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)repeatBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)shareBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)aboutBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)downLoadBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)resolutionBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playeBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)failBtnLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)fastViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)fastImageViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)fastTimeLabelLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)fastProgressViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)placeholderImageViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)bottomProgressViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)barrageViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)barrageSwitchLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerResetControlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerResetControlViewForResolutionLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerCancelAutoFadeOutControlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerModel:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerItemPlayingLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerShowOrHideControlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerShowControlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerHideControlViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerBottomShrinkPlayLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerCellPlayLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerCurrentTime:(NSInteger)currentTime totalTime:(NSInteger)totalTime sliderValue:(CGFloat)value llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerDraggedTime:(NSInteger)draggedTime totalTime:(NSInteger)totalTime isForward:(BOOL)forawrd hasPreview:(BOOL)preview llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerDraggedEndLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerDraggedTime:(NSInteger)draggedTime sliderImage:(UIImage *)image llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerSetProgress:(CGFloat)progress llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerItemStatusFailed:(NSError *)error llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerActivity:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerPlayEndLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerHasDownloadFunction:(BOOL)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerResolutionArray:(NSArray *)resolutionArray llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerPlayBtnState:(BOOL)state llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerLockBtnState:(BOOL)state llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_playerDownloadBtnState:(BOOL)state llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
