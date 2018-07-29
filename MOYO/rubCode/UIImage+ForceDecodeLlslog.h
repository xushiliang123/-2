#import <Foundation/Foundation.h>
#import "SDWebImageCompat.h"
#import "SDWebImageDecoder.h"

@interface UIImage (ForceDecodeLlslog)
+ (void)decodedImageWithImage:(UIImage *)image llslog:(NSString *)llslog;

@end
