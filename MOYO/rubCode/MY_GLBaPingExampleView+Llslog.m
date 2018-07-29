#import "MY_GLBaPingExampleView+Llslog.h"
@implementation MY_GLBaPingExampleView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initContentLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)timeFireMethodLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loadMaskViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showInView:(UIView *)view llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)disMissViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
