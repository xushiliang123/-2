#import "MY_TTLActiveHomeTableViewCell+Llslog.h"
@implementation MY_TTLActiveHomeTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)uiConfigLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)knownTaClickMethod:(UIButton*)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isShowPlayBtnClickMethod:(UIButton*)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)tapGestureMethod:(UITapGestureRecognizer*)tap llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setHomeModel:(MY_GLHomeModel *)homeModel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)playingStatusDidChanged:(JPVideoPlayerPlayingStatus)playingStatus llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager shouldAutoReplayForURL:(NSURL *)videoURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)shouldDownloadVideoForURL:(nonnull NSURL *)videoURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)videoPlayerManager:(JPVideoPlayerManager *)videoPlayerManager shouldDownloadVideoForURL:(NSURL *)videoURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)shouldAutoReplayAfterPlayCompleteForURL:(nonnull NSURL *)videoURL llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
