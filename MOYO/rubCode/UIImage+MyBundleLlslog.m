#import "UIImage+MyBundleLlslog.h"
@implementation UIImage (MyBundleLlslog)
+ (void)imageNamedFromMyBundle:(NSString *)name llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
