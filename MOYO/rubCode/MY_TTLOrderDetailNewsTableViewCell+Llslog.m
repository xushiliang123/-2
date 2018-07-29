#import "MY_TTLOrderDetailNewsTableViewCell+Llslog.h"
@implementation MY_TTLOrderDetailNewsTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
