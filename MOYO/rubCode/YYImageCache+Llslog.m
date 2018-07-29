#import "YYImageCache+Llslog.h"
@implementation YYImageCache (Llslog)
- (void)imageCost:(UIImage *)image llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imageFromData:(NSData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)sharedCacheLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithPath:(NSString *)path llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImage:(UIImage *)image forKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setImage:(UIImage *)image imageData:(NSData *)imageData forKey:(NSString *)key withType:(YYImageCacheType)type llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeImageForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeImageForKey:(NSString *)key withType:(YYImageCacheType)type llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)containsImageForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)containsImageForKey:(NSString *)key withType:(YYImageCacheType)type llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getImageForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getImageForKey:(NSString *)key withType:(YYImageCacheType)type llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getImageForKey:(NSString *)key withType:(YYImageCacheType)type withBlock:(void (^)(UIImage *image, YYImageCacheType type))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getImageDataForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getImageDataForKey:(NSString *)key withBlock:(void (^)(NSData *imageData))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
