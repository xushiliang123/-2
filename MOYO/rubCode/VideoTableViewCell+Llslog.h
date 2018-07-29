#import <UIKit/UIKit.h>
#import "ZFPlayer.h"
#import "ParallelButton.h"
#import "VideoResolutionModel.h"
#import "VideoTableViewCell.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoTableViewCell (Llslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)hongBaoChatClick:(ParallelButton*)sender llslog:(NSString *)llslog;
- (void)setIsMyDynamic:(BOOL)isMyDynamic llslog:(NSString *)llslog;
- (void)cutRoundView:(UIImageView *)imageView llslog:(NSString *)llslog;
- (void)setModel:(VideoResolutionModel *)model llslog:(NSString *)llslog;
- (void)play:(UIButton *)sender llslog:(NSString *)llslog;
- (void)picViewTapResture:(UITapGestureRecognizer *)tap llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
