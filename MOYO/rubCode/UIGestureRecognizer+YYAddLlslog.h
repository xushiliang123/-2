#import <UIKit/UIKit.h>
#import "UIGestureRecognizer+YYAdd.h"
#import "YYKitMacro.h"
#import <objc/runtime.h>

@interface UIGestureRecognizer (YYAddLlslog)
- (void)initWithActionBlock:(void (^)(id sender))block llslog:(NSString *)llslog;
- (void)addActionBlock:(void (^)(id sender))block llslog:(NSString *)llslog;
- (void)removeAllActionBlocksLlslog:(NSString *)llslog;
- (void)_yy_allUIGestureRecognizerBlockTargetsLlslog:(NSString *)llslog;

@end
