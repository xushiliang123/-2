#import <UIKit/UIKit.h>
#import <YYKit/YYAnimatedImageView.h>
#import "YYAnimatedImageView.h"
#import "YYSpriteSheetImage.h"

@interface YYSpriteSheetImage (Llslog)
- (void)initWithSpriteSheetImage:(UIImage *)image
                            contentRects:(NSArray *)contentRects
                          frameDurations:(NSArray *)frameDurations
                               loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog;
- (void)contentsRectForCALayerAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)animatedImageFrameCountLlslog:(NSString *)llslog;
- (void)animatedImageLoopCountLlslog:(NSString *)llslog;
- (void)animatedImageBytesPerFrameLlslog:(NSString *)llslog;
- (void)animatedImageFrameAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)animatedImageDurationAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)animatedImageContentsRectAtIndex:(NSUInteger)index llslog:(NSString *)llslog;

@end
