#import <UIKit/UIKit.h>
#import "ZFPlayer.h"
#import "ZFPlayerControlView.h"
#import "ZFPlayerModel.h"
#import "ZFPlayerControlViewDelegate.h"
#import "ZFPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "UIView+CustomControlView.h"
#import "ZFPlayer.h"
#import "ZFPlayerView+Llslog.h"

@interface ZFPlayerView (LlslogLlslog)
- (void)initLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)initializeThePlayerLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)resetToPlayNewURLLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addNotificationsLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog llslog:(NSString *)llslog;
+ (void)sharedPlayerViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playerControlView:(UIView *)controlView playerModel:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playerModel:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)autoPlayTheVideoLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addPlayerToFatherView:(UIView *)view llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)resetPlayerLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)resetToPlayNewVideo:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)pauseLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)cellVideoWithScrollView:(UIScrollView *)scrollView
                    AtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)configZFPlayerLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)createGestureLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)createTimerLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)configureVolumeLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)audioRouteChangeListenerCallback:(NSNotification*)notification llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)handleScrollOffsetWithDict:(NSDictionary*)dict llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)updatePlayerViewToBottomLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)updatePlayerViewToCellLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setOrientationLandscapeConstraint:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setOrientationPortraitConstraintLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)toOrientation:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)getTransformRotationAngleLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)interfaceOrientation:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)onDeviceOrientationChangeLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)onStatusBarOrientationChangeLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)lockScreenAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)unLockTheScreenLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)bufferingSomeSecondLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)availableDurationLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)singleTapAction:(UIGestureRecognizer *)gesture llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)doubleTapAction:(UIGestureRecognizer *)gesture llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)shrikPanAction:(UIPanGestureRecognizer *)gesture llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)_fullScreenActionLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)moviePlayDidEnd:(NSNotification *)notification llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)appDidEnterBackgroundLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)appDidEnterPlaygroundLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)seekToTime:(NSInteger)dragedSeconds completionHandler:(void (^)(BOOL finished))completionHandler llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)panDirection:(UIPanGestureRecognizer *)pan llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)verticalMoved:(CGFloat)value llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)horizontalMoved:(CGFloat)value llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)durationStringWithTime:(int)time llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setVideoURL:(NSURL *)videoURL llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setState:(ZFPlayerState)state llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setPlayerItem:(AVPlayerItem *)playerItem llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setScrollView:(UIScrollView *)scrollView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setPlayerLayerGravity:(ZFPlayerLayerGravity)playerLayerGravity llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setHasDownload:(BOOL)hasDownload llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setResolutionDic:(NSDictionary *)resolutionDic llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setControlView:(UIView *)controlView llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setPlayerModel:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setShrinkRightBottomPoint:(CGPoint)shrinkRightBottomPoint llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setPlayerPushedOrPresented:(BOOL)playerPushedOrPresented llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)imageGeneratorLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)brightnessViewLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)videoGravityLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView playAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView backAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView closeAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView fullScreenAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView lockScreenAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView cneterPlayAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView repeatPlayAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView failAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView resolutionAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView downloadVideoAction:(UIButton *)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView progressSliderTap:(CGFloat)value llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView progressSliderValueChanged:(UISlider *)slider llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView progressSliderTouchEnded:(UISlider *)slider llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)zf_controlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
