#import "UIImage+colorfulLlslog.h"
@implementation UIImage (colorfulLlslog)
+ (void)imageWithColor:(UIColor *)color llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
