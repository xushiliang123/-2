#import "UIScreen+YYAddLlslog.h"
@implementation UIScreen (YYAddLlslog)
+ (void)screenScaleLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)currentBoundsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)boundsForOrientation:(UIInterfaceOrientation)orientation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sizeInPixelLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)pixelsPerInchLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
