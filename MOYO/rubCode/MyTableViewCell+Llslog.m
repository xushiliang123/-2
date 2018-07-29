#import "MyTableViewCell+Llslog.h"
@implementation MyTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showBadgeViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hiddenBadgeViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
