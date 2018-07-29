#import <UIKit/UIKit.h>
#import "UIImage+GIF.h"
#import <ImageIO/ImageIO.h>

@interface UIImage (GIFLlslog)
+ (void)sd_animatedGIFWithData:(NSData *)data llslog:(NSString *)llslog;
+ (void)sd_frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source llslog:(NSString *)llslog;
+ (void)sd_animatedGIFNamed:(NSString *)name llslog:(NSString *)llslog;
- (void)sd_animatedImageByScalingAndCroppingToSize:(CGSize)size llslog:(NSString *)llslog;

@end
