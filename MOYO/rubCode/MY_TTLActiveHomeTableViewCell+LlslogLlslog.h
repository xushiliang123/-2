#import <UIKit/UIKit.h>
#import "MY_GLHomeModel.h"
#import "MY_GLAlphaLabel.h"
#import "MY_TTLActiveHomeTableViewCell.h"
#import "UIView+WebVideoCache.h"
#import "MY_TTLActiveHomeTableViewCell+Llslog.h"

@interface MY_TTLActiveHomeTableViewCell (LlslogLlslog)
- (void)awakeFromNibLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)uiConfigLlslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)knownTaClickMethod:(UIButton*)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)isShowPlayBtnClickMethod:(UIButton*)sender llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)tapGestureMethod:(UITapGestureRecognizer*)tap llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setHomeModel:(MY_GLHomeModel *)homeModel llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)playingStatusDidChanged:(JPVideoPlayerPlayingStatus)playingStatus llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager shouldAutoReplayForURL:(NSURL *)videoURL llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)shouldDownloadVideoForURL:(nonnull NSURL *)videoURL llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager shouldDownloadVideoForURL:(NSURL *)videoURL llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)shouldAutoReplayAfterPlayCompleteForURL:(nonnull NSURL *)videoURL llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
