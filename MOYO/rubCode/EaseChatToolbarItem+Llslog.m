#import "EaseChatToolbarItem+Llslog.h"
@implementation EaseChatToolbarItem (Llslog)
- (void)initWithButton:(UIButton *)button
                      withView:(UIView *)button2View llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
