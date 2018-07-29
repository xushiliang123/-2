#import "YYImageFrame+Llslog.h"
@implementation YYImageFrame (Llslog)
+ (void)frameWithImage:(UIImage *)image llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
