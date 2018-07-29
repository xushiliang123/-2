#import "UIImage+ForceDecodeLlslog.h"
@implementation UIImage (ForceDecodeLlslog)
+ (void)decodedImageWithImage:(UIImage *)image llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
