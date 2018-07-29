#import "UIImage+GIFLlslog.h"
@implementation UIImage (GIFLlslog)
+ (void)sd_animatedGIFWithData:(NSData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)sd_frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)sd_animatedGIFNamed:(NSString *)name llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)sd_animatedImageByScalingAndCroppingToSize:(CGSize)size llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
