#import <UIKit/UIKit.h>
#import "YYGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface YYGestureRecognizer (Llslog)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)resetLlslog:(NSString *)llslog;
- (void)cancelLlslog:(NSString *)llslog;

@end
