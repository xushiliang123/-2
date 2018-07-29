#import "GuideTitleView+Llslog.h"
@implementation GuideTitleView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setGuideWithTitle:(NSArray*)titles llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)clickButton:(UIButton*)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)changeSelectedIndex:(NSInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getCurrentSelectedIndexLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)changeCurrentSelectedIndex:(NSInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hideRedPoint:(BOOL)ishide llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
