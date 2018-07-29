#import "MASViewAttribute+Llslog.h"
@implementation MASViewAttribute (Llslog)
- (void)initWithView:(MAS_VIEW *)view layoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithView:(MAS_VIEW *)view item:(id)item layoutAttribute:(NSLayoutAttribute)layoutAttribute llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isSizeAttributeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isEqual:(MASViewAttribute *)viewAttribute llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hashLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
