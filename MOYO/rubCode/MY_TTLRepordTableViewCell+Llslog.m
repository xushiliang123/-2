#import "MY_TTLRepordTableViewCell+Llslog.h"
@implementation MY_TTLRepordTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
