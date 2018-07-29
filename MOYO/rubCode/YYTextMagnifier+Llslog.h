#import <UIKit/UIKit.h>
#import <YYKit/YYTextAttribute.h>
#import "YYTextAttribute.h"
#import "YYTextMagnifier.h"
#import "YYCGUtilities.h"

@interface YYTextMagnifier (Llslog)
+ (void)magnifierWithType:(YYTextMagnifierType)type llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;

@end
