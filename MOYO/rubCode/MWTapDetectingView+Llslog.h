#import <Foundation/Foundation.h>
#import "MWTapDetectingView.h"

@interface MWTapDetectingView (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)handleSingleTap:(UITouch *)touch llslog:(NSString *)llslog;
- (void)handleDoubleTap:(UITouch *)touch llslog:(NSString *)llslog;
- (void)handleTripleTap:(UITouch *)touch llslog:(NSString *)llslog;

@end
