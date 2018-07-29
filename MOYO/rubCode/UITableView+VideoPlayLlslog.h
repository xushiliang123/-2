#import <UIKit/UIKit.h>
#import "UITableView+VideoPlay.h"
#import "MY_TTLActiveHomeTableViewCell.h"
#import <objc/runtime.h>
#import "UIView+WebVideoCache.h"

@interface UITableView (VideoPlayLlslog)
- (void)playVideoInVisiableCellsLlslog:(NSString *)llslog;
- (void)handleScrollStopLlslog:(NSString *)llslog;
- (void)handleQuickScrollLlslog:(NSString *)llslog;
- (void)stopPlayLlslog:(NSString *)llslog;
- (void)findTheBestToPlayVideoCellLlslog:(NSString *)llslog;
- (void)playingCellIsVisiableLlslog:(NSString *)llslog;
- (void)setCurrentDerection:(JPVideoPlayerDemoScrollDerection)currentDerection llslog:(NSString *)llslog;
- (void)currentDerectionLlslog:(NSString *)llslog;
- (void)setMaxNumCannotPlayVideoCells:(NSUInteger)maxNumCannotPlayVideoCells llslog:(NSString *)llslog;
- (void)maxNumCannotPlayVideoCellsLlslog:(NSString *)llslog;
- (void)setPlayingCell:(MY_TTLActiveHomeTableViewCell *)playingCell llslog:(NSString *)llslog;
- (void)playingCellLlslog:(NSString *)llslog;
- (void)setDictOfVisiableAndNotPlayCells:(NSDictionary *)dictOfVisiableAndNotPlayCells llslog:(NSString *)llslog;
- (void)dictOfVisiableAndNotPlayCellsLlslog:(NSString *)llslog;

@end
