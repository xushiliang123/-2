#import "MY_XTItem+Llslog.h"
@implementation MY_XTItem (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setUILlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setTitle:(NSString *)title llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setRedTitleLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setGrayTitleLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)changeSizeOfItemLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)backSizeOfItemLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
