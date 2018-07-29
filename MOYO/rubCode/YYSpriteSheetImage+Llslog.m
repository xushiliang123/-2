#import "YYSpriteSheetImage+Llslog.h"
@implementation YYSpriteSheetImage (Llslog)
- (void)initWithSpriteSheetImage:(UIImage *)image
                            contentRects:(NSArray *)contentRects
                          frameDurations:(NSArray *)frameDurations
                               loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)contentsRectForCALayerAtIndex:(NSUInteger)index llslog:(NSString *)llslog {
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
- (void)animatedImageContentsRectAtIndex:(NSUInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
