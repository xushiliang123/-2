#import "UIImage+MultiFormatLlslog.h"
@implementation UIImage (MultiFormatLlslog)
+ (void)sd_imageWithData:(NSData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)sd_imageOrientationFromImageData:(NSData *)imageData llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)sd_exifOrientationToiOSOrientation:(int)exifOrientation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
