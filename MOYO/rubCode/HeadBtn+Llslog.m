#import "HeadBtn+Llslog.h"
@implementation HeadBtn (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)createUIWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
