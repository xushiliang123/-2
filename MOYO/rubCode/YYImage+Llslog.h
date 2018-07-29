#import <UIKit/UIKit.h>
#import <YYKit/YYAnimatedImageView.h>
#import <YYKit/YYImageCoder.h>
#import "YYAnimatedImageView.h"
#import "YYImageCoder.h"
#import "YYImage.h"
#import "NSString+YYAdd.h"
#import "NSBundle+YYAdd.h"

@interface YYImage (Llslog)
+ (void)imageNamed:(NSString *)name llslog:(NSString *)llslog;
+ (void)imageWithContentsOfFile:(NSString *)path llslog:(NSString *)llslog;
+ (void)imageWithData:(NSData *)data llslog:(NSString *)llslog;
+ (void)imageWithData:(NSData *)data scale:(CGFloat)scale llslog:(NSString *)llslog;
- (void)initWithContentsOfFile:(NSString *)path llslog:(NSString *)llslog;
- (void)initWithData:(NSData *)data llslog:(NSString *)llslog;
- (void)initWithData:(NSData *)data scale:(CGFloat)scale llslog:(NSString *)llslog;
- (void)animatedImageDataLlslog:(NSString *)llslog;
- (void)setPreloadAllAnimatedImageFrames:(BOOL)preloadAllAnimatedImageFrames llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)animatedImageFrameCountLlslog:(NSString *)llslog;
- (void)animatedImageLoopCountLlslog:(NSString *)llslog;
- (void)animatedImageBytesPerFrameLlslog:(NSString *)llslog;
- (void)animatedImageFrameAtIndex:(NSUInteger)index llslog:(NSString *)llslog;
- (void)animatedImageDurationAtIndex:(NSUInteger)index llslog:(NSString *)llslog;

@end
