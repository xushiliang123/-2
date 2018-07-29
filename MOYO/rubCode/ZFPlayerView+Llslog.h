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

@interface ZFPlayerView (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)initializeThePlayerLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)resetToPlayNewURLLlslog:(NSString *)llslog;
- (void)addNotificationsLlslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
+ (void)sharedPlayerViewLlslog:(NSString *)llslog;
- (void)playerControlView:(UIView *)controlView playerModel:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog;
- (void)playerModel:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog;
- (void)autoPlayTheVideoLlslog:(NSString *)llslog;
- (void)addPlayerToFatherView:(UIView *)view llslog:(NSString *)llslog;
- (void)resetPlayerLlslog:(NSString *)llslog;
- (void)resetToPlayNewVideo:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog;
- (void)playLlslog:(NSString *)llslog;
- (void)pauseLlslog:(NSString *)llslog;
- (void)cellVideoWithScrollView:(UIScrollView *)scrollView
                    AtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)configZFPlayerLlslog:(NSString *)llslog;
- (void)createGestureLlslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)createTimerLlslog:(NSString *)llslog;
- (void)configureVolumeLlslog:(NSString *)llslog;
- (void)audioRouteChangeListenerCallback:(NSNotification*)notification llslog:(NSString *)llslog;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context llslog:(NSString *)llslog;
- (void)handleScrollOffsetWithDict:(NSDictionary*)dict llslog:(NSString *)llslog;
- (void)updatePlayerViewToBottomLlslog:(NSString *)llslog;
- (void)updatePlayerViewToCellLlslog:(NSString *)llslog;
- (void)setOrientationLandscapeConstraint:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog;
- (void)setOrientationPortraitConstraintLlslog:(NSString *)llslog;
- (void)toOrientation:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog;
- (void)getTransformRotationAngleLlslog:(NSString *)llslog;
- (void)interfaceOrientation:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog;
- (void)onDeviceOrientationChangeLlslog:(NSString *)llslog;
- (void)onStatusBarOrientationChangeLlslog:(NSString *)llslog;
- (void)lockScreenAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)unLockTheScreenLlslog:(NSString *)llslog;
- (void)bufferingSomeSecondLlslog:(NSString *)llslog;
- (void)availableDurationLlslog:(NSString *)llslog;
- (void)singleTapAction:(UIGestureRecognizer *)gesture llslog:(NSString *)llslog;
- (void)doubleTapAction:(UIGestureRecognizer *)gesture llslog:(NSString *)llslog;
- (void)shrikPanAction:(UIPanGestureRecognizer *)gesture llslog:(NSString *)llslog;
- (void)_fullScreenActionLlslog:(NSString *)llslog;
- (void)moviePlayDidEnd:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)appDidEnterBackgroundLlslog:(NSString *)llslog;
- (void)appDidEnterPlaygroundLlslog:(NSString *)llslog;
- (void)seekToTime:(NSInteger)dragedSeconds completionHandler:(void (^)(BOOL finished))completionHandler llslog:(NSString *)llslog;
- (void)panDirection:(UIPanGestureRecognizer *)pan llslog:(NSString *)llslog;
- (void)verticalMoved:(CGFloat)value llslog:(NSString *)llslog;
- (void)horizontalMoved:(CGFloat)value llslog:(NSString *)llslog;
- (void)durationStringWithTime:(int)time llslog:(NSString *)llslog;
- (void)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch llslog:(NSString *)llslog;
- (void)setVideoURL:(NSURL *)videoURL llslog:(NSString *)llslog;
- (void)setState:(ZFPlayerState)state llslog:(NSString *)llslog;
- (void)setPlayerItem:(AVPlayerItem *)playerItem llslog:(NSString *)llslog;
- (void)setScrollView:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)setPlayerLayerGravity:(ZFPlayerLayerGravity)playerLayerGravity llslog:(NSString *)llslog;
- (void)setHasDownload:(BOOL)hasDownload llslog:(NSString *)llslog;
- (void)setResolutionDic:(NSDictionary *)resolutionDic llslog:(NSString *)llslog;
- (void)setControlView:(UIView *)controlView llslog:(NSString *)llslog;
- (void)setPlayerModel:(ZFPlayerModel *)playerModel llslog:(NSString *)llslog;
- (void)setShrinkRightBottomPoint:(CGPoint)shrinkRightBottomPoint llslog:(NSString *)llslog;
- (void)setPlayerPushedOrPresented:(BOOL)playerPushedOrPresented llslog:(NSString *)llslog;
- (void)imageGeneratorLlslog:(NSString *)llslog;
- (void)brightnessViewLlslog:(NSString *)llslog;
- (void)videoGravityLlslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView playAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView backAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView closeAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView fullScreenAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView lockScreenAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView cneterPlayAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView repeatPlayAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView failAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView resolutionAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView downloadVideoAction:(UIButton *)sender llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView progressSliderTap:(CGFloat)value llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView progressSliderValueChanged:(UISlider *)slider llslog:(NSString *)llslog;
- (void)zf_controlView:(UIView *)controlView progressSliderTouchEnded:(UISlider *)slider llslog:(NSString *)llslog;
- (void)zf_controlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog;
- (void)zf_controlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog;

@end
