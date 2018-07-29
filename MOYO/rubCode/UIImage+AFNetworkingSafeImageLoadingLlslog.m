#import "UIImage+AFNetworkingSafeImageLoadingLlslog.h"
@implementation UIImage (AFNetworkingSafeImageLoadingLlslog)
+ (void)af_safeImageWithData:(NSData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
