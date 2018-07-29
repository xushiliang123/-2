#import "Setbutton+Llslog.h"
@implementation Setbutton (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setHighlighted:(BOOL)highlighted llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)imageRectForContentRect:(CGRect)contentRect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)titleRectForContentRect:(CGRect)contentRect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
