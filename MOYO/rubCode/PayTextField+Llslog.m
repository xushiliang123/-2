#import "PayTextField+Llslog.h"
@implementation PayTextField (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textRectForBounds:(CGRect)bounds llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)editingRectForBounds:(CGRect)bounds llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
