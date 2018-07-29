#import <UIKit/UIKit.h>
#import "UIControl+YYAdd.h"
#import "YYKitMacro.h"
#import <objc/runtime.h>

@interface UIControl (YYAddLlslog)
- (void)removeAllTargetsLlslog:(NSString *)llslog;
- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents llslog:(NSString *)llslog;
- (void)addBlockForControlEvents:(UIControlEvents)controlEvents
                           block:(void (^)(id sender))block llslog:(NSString *)llslog;
- (void)setBlockForControlEvents:(UIControlEvents)controlEvents
                           block:(void (^)(id sender))block llslog:(NSString *)llslog;
- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents llslog:(NSString *)llslog;
- (void)_yy_allUIControlBlockTargetsLlslog:(NSString *)llslog;

@end
