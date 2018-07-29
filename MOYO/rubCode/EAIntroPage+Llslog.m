#import "EAIntroPage+Llslog.h"
@implementation EAIntroPage (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)pageLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)pageWithCustomView:(UIView *)customV llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)pageWithCustomViewFromNibNamed:(NSString *)nibName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)pageWithCustomViewFromNibNamed:(NSString *)nibName bundle:(NSBundle*)aBundle llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
