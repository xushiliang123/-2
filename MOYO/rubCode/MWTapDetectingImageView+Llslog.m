#import "MWTapDetectingImageView+Llslog.h"
@implementation MWTapDetectingImageView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithImage:(UIImage *)image llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)handleSingleTap:(UITouch *)touch llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)handleDoubleTap:(UITouch *)touch llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)handleTripleTap:(UITouch *)touch llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
