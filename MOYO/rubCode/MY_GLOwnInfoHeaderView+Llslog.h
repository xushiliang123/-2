#import <UIKit/UIKit.h>
#import "MY_LYPersonInfoModel.h"
#import "MY_GLAlphaLabel.h"
#import "ZFPlayer.h"
#import "MY_GLOwnInfoHeaderView.h"
#import "DYBaseView.h"
#import <AVFoundation/AVFoundation.h>

@interface MY_GLOwnInfoHeaderView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setupUILlslog:(NSString *)llslog;
- (void)selectedUserStyleIndex2ClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)headerImageViewDidClickLlslog:(NSString *)llslog;
- (void)setModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog;
- (void)playerViewLlslog:(NSString *)llslog;
- (void)zf_playerBackActionLlslog:(NSString *)llslog;
- (void)zf_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;

@end
