#import "MY_LYCustomerButton+Llslog.h"
@implementation MY_LYCustomerButton (Llslog)
- (void)imageRectForContentRect:(CGRect)contentRect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)titleRectForContentRect:(CGRect)contentRect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
