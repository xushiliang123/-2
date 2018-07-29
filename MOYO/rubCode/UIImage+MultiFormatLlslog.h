#import <UIKit/UIKit.h>
#import "UIImage+MultiFormat.h"
#import "UIImage+GIF.h"
#import "NSData+ImageContentType.h"
#import <ImageIO/ImageIO.h>


@interface UIImage (MultiFormatLlslog)
+ (void)sd_imageWithData:(NSData *)data llslog:(NSString *)llslog;
+ (void)sd_imageOrientationFromImageData:(NSData *)imageData llslog:(NSString *)llslog;
+ (void)sd_exifOrientationToiOSOrientation:(int)exifOrientation llslog:(NSString *)llslog;

@end
