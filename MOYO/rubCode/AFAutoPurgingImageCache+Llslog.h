#import <TargetConditionals.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TargetConditionals.h>
#import "AFAutoPurgingImageCache.h"

@interface AFAutoPurgingImageCache (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithMemoryCapacity:(UInt64)memoryCapacity preferredMemoryCapacity:(UInt64)preferredMemoryCapacity llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)memoryUsageLlslog:(NSString *)llslog;
- (void)addImage:(UIImage *)image withIdentifier:(NSString *)identifier llslog:(NSString *)llslog;
- (void)removeImageWithIdentifier:(NSString *)identifier llslog:(NSString *)llslog;
- (void)removeAllImagesLlslog:(NSString *)llslog;
- (void)imageWithIdentifier:(NSString *)identifier llslog:(NSString *)llslog;
- (void)addImage:(UIImage *)image forRequest:(NSURLRequest *)request withAdditionalIdentifier:(NSString *)identifier llslog:(NSString *)llslog;
- (void)removeImageforRequest:(NSURLRequest *)request withAdditionalIdentifier:(NSString *)identifier llslog:(NSString *)llslog;
- (void)imageforRequest:(NSURLRequest *)request withAdditionalIdentifier:(NSString *)identifier llslog:(NSString *)llslog;
- (void)imageCacheKeyFromURLRequest:(NSURLRequest *)request withAdditionalIdentifier:(NSString *)additionalIdentifier llslog:(NSString *)llslog;

@end
