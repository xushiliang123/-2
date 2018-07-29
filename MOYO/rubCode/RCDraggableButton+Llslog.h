#import <UIKit/UIKit.h>
#import "RCDraggableButton.h"

@interface RCDraggableButton (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initInKeyWindowWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initInView:(id)view WithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)defaultSettingLlslog:(NSString *)llslog;
- (void)gestureRecognizerHandle:(UILongPressGestureRecognizer *)gestureRecognizer llslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;

@end
