#import <UIKit/UIKit.h>
#import <YYKit/YYAnimatedImageView.h>
#import "YYAnimatedImageView.h"
#import "YYFrameImage.h"
#import "NSString+YYAdd.h"
#import "UIImage+YYAdd.h"
#import "YYImageCoder.h"

@interface YYFrameImage (Llslog)
- (void)initWithImagePaths:(NSArray *)paths oneFrameDuration:(NSTimeInterval)oneFrameDuration loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog;
- (void)initWithImagePaths:(NSArray *)paths frameDurations:(NSArray *)frameDurations loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog;
- (void)initWithImageDataArray:(NSArray *)dataArray oneFrameDuration:(NSTimeInterval)oneFrameDuration loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog;
- (void)initWithImageDataArray:(NSArray *)dataArray frameDurations:(NSArray *)frameDurations loopCount:(NSUInteger)loopCount llslog:(NSString *)llslog;
- (void)animatedImageFrameCountLlslog:(NSString *)llslog;
- (void)animatedImageLoopCountLlslog:(NSString *)llslog;
- (void)animatedImageBytesPerFrameLlslog:(NSString *)llslog;
- (void)animatedImageFrameAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)animatedImageDurationAtIndex:(NSUInteger)index llslog:(NSString *)llslog;

@end
