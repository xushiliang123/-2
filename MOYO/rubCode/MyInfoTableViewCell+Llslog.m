#import "MyInfoTableViewCell+Llslog.h"
@implementation MyInfoTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setModel:(VideoResolutionModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setXtmodel:(MY_XTRrpModel *)xtmodel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateTimeForCreaetTime:(NSInteger)ctime llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
