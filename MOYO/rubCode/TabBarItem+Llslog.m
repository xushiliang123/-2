#import "TabBarItem+Llslog.h"
@implementation TabBarItem (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
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
