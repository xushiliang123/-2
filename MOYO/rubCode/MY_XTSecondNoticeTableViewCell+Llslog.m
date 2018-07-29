#import "MY_XTSecondNoticeTableViewCell+Llslog.h"
@implementation MY_XTSecondNoticeTableViewCell (Llslog)
- (void)layoutForCellLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
