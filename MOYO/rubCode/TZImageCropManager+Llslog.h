#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TZImageCropManager.h"
#import "UIView+Layout.h"

@interface TZImageCropManager (Llslog)
+ (void)overlayClippingWithView:(UIView *)view cropRect:(CGRect)cropRect containerView:(UIView *)containerView needCircleCrop:(BOOL)needCircleCrop llslog:(NSString *)llslog;
+ (void)cropImageView:(UIImageView *)imageView toRect:(CGRect)rect zoomScale:(double)zoomScale containerView:(UIView *)containerView llslog:(NSString *)llslog;
+ (void)newTransformedImage:(CGAffineTransform)transform sourceImage:(CGImageRef)sourceImage sourceSize:(CGSize)sourceSize  outputWidth:(CGFloat)outputWidth cropSize:(CGSize)cropSize imageViewSize:(CGSize)imageViewSize llslog:(NSString *)llslog;
+ (void)newScaledImage:(CGImageRef)source toSize:(CGSize)size llslog:(NSString *)llslog;
+ (void)circularClipImage:(UIImage *)image llslog:(NSString *)llslog;

@end
