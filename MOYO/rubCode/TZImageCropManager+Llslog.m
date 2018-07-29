#import "TZImageCropManager+Llslog.h"
@implementation TZImageCropManager (Llslog)
+ (void)overlayClippingWithView:(UIView *)view cropRect:(CGRect)cropRect containerView:(UIView *)containerView needCircleCrop:(BOOL)needCircleCrop llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)cropImageView:(UIImageView *)imageView toRect:(CGRect)rect zoomScale:(double)zoomScale containerView:(UIView *)containerView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)newTransformedImage:(CGAffineTransform)transform sourceImage:(CGImageRef)sourceImage sourceSize:(CGSize)sourceSize  outputWidth:(CGFloat)outputWidth cropSize:(CGSize)cropSize imageViewSize:(CGSize)imageViewSize llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)newScaledImage:(CGImageRef)source toSize:(CGSize)size llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)circularClipImage:(UIImage *)image llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
