#import <UIKit/UIKit.h>
#import "VideoResolutionModel.h"
#import "MY_XTRrpModel.h"
#import "MyInfoTableViewCell.h"

@interface MyInfoTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setModel:(VideoResolutionModel *)model llslog:(NSString *)llslog;
- (void)setXtmodel:(MY_XTRrpModel *)xtmodel llslog:(NSString *)llslog;
- (void)updateTimeForCreaetTime:(NSInteger)ctime llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
