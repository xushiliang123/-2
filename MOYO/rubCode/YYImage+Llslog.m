#import "YYImage+Llslog.h"
@implementation YYImage (Llslog)
+ (void)imageNamed:(NSString *)name llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)imageWithContentsOfFile:(NSString *)path llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)imageWithData:(NSData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)imageWithData:(NSData *)data scale:(CGFloat)scale llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithContentsOfFile:(NSString *)path llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithData:(NSData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithData:(NSData *)data scale:(CGFloat)scale llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)animatedImageDataLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setPreloadAllAnimatedImageFrames:(BOOL)preloadAllAnimatedImageFrames llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)animatedImageFrameCountLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)animatedImageLoopCountLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)animatedImageBytesPerFrameLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)animatedImageFrameAtIndex:(NSUInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)animatedImageDurationAtIndex:(NSUInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
