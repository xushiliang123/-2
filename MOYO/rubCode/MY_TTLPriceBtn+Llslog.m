#import "MY_TTLPriceBtn+Llslog.h"
@implementation MY_TTLPriceBtn (Llslog)
+ (void)initializeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)createBtnLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showPrice:(NSNumber *)price withTime:(NSString *)month llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
