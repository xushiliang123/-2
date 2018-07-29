#import "BarrageCanvas+Llslog.h"
@implementation BarrageCanvas (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)layoutSubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setMargin:(UIEdgeInsets)margin llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didMoveToSuperviewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hitTest:(CGPoint)point withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
