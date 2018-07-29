#import "MY_LYCustomerLable+Llslog.h"
@implementation MY_LYCustomerLable (Llslog)
- (void)setVerticalAlignment:(myVerticalAlignment)verticalAlignment llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)drawTextInRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
