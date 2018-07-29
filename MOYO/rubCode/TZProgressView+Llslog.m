#import "TZProgressView+Llslog.h"
@implementation TZProgressView (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setProgress:(double)progress llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
