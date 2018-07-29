#import <UIKit/UIKit.h>
#import "UIBezierPath+YYAdd.h"
#import "UIFont+YYAdd.h"
#import <CoreText/CoreText.h>
#import "YYKitMacro.h"

@interface UIBezierPath (YYAddLlslog)
+ (void)bezierPathWithText:(NSString *)text font:(UIFont *)font llslog:(NSString *)llslog;

@end
