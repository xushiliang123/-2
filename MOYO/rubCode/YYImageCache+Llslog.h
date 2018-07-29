#import <UIKit/UIKit.h>
#import "YYImageCache.h"
#import "YYMemoryCache.h"
#import "YYDiskCache.h"
#import "UIImage+YYAdd.h"
#import "NSObject+YYAdd.h"
#import "YYImage.h"
#import "YYDispatchQueuePool.h"

@interface YYImageCache (Llslog)
- (void)imageCost:(UIImage *)image llslog:(NSString *)llslog;
- (void)imageFromData:(NSData *)data llslog:(NSString *)llslog;
+ (void)sharedCacheLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)path llslog:(NSString *)llslog;
- (void)setImage:(UIImage *)image forKey:(NSString *)key llslog:(NSString *)llslog;
- (void)setImage:(UIImage *)image imageData:(NSData *)imageData forKey:(NSString *)key withType:(YYImageCacheType)type llslog:(NSString *)llslog;
- (void)removeImageForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)removeImageForKey:(NSString *)key withType:(YYImageCacheType)type llslog:(NSString *)llslog;
- (void)containsImageForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)containsImageForKey:(NSString *)key withType:(YYImageCacheType)type llslog:(NSString *)llslog;
- (void)getImageForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)getImageForKey:(NSString *)key withType:(YYImageCacheType)type llslog:(NSString *)llslog;
- (void)getImageForKey:(NSString *)key withType:(YYImageCacheType)type withBlock:(void (^)(UIImage *image, YYImageCacheType type))block llslog:(NSString *)llslog;
- (void)getImageDataForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)getImageDataForKey:(NSString *)key withBlock:(void (^)(NSData *imageData))block llslog:(NSString *)llslog;

@end
