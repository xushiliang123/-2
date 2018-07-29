#import "MWCaptionView+Llslog.h"
@implementation MWCaptionView (Llslog)
- (void)initWithPhoto:(id<MWPhoto>)photo llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sizeThatFits:(CGSize)size llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setupCaptionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
