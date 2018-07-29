#import <Foundation/Foundation.h>
#import "MWTapDetectingImageView.h"

@interface MWTapDetectingImageView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithImage:(UIImage *)image llslog:(NSString *)llslog;
- (void)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)handleSingleTap:(UITouch *)touch llslog:(NSString *)llslog;
- (void)handleDoubleTap:(UITouch *)touch llslog:(NSString *)llslog;
- (void)handleTripleTap:(UITouch *)touch llslog:(NSString *)llslog;

@end
