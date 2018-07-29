#import <UIKit/UIKit.h>
#import "UIBarButtonItem+YYAdd.h"
#import "YYKitMacro.h"
#import <objc/runtime.h>

@interface UIBarButtonItem (YYAddLlslog)
- (void)setActionBlock:(void (^)(id sender))block llslog:(NSString *)llslog;

@end
