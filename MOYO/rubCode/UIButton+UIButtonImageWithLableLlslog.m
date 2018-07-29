#import "UIButton+UIButtonImageWithLableLlslog.h"
@implementation UIButton (UIButtonImageWithLableLlslog)
- (void)setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}


@end
