#import "YYFrameImage+Llslog.h"
@implementation YYFrameImage (Llslog)
- (void)initWithImagePaths:(NSArray *)paths oneFrameDuration:(NSTimeInterval)oneFrameDuration loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithImagePaths:(NSArray *)paths frameDurations:(NSArray *)frameDurations loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithImageDataArray:(NSArray *)dataArray oneFrameDuration:(NSTimeInterval)oneFrameDuration loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithImageDataArray:(NSArray *)dataArray frameDurations:(NSArray *)frameDurations loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog {
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
