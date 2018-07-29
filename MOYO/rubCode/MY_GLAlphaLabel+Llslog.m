#import "MY_GLAlphaLabel+Llslog.h"
@implementation MY_GLAlphaLabel (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setViewTitle:(NSString*)string withFont:(UIFont*)font llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
