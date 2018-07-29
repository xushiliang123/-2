#import "YYTextMagnifier+Llslog.h"
@implementation YYTextMagnifier (Llslog)
+ (void)magnifierWithType:(YYTextMagnifierType)type llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
