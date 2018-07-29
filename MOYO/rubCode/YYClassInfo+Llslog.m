#import "YYClassInfo+Llslog.h"
@implementation YYClassInfo (Llslog)
- (void)initWithClass:(Class)cls llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_updateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setNeedUpdateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)needUpdateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)classInfoWithClass:(Class)cls llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)classInfoWithClassName:(NSString *)className llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
