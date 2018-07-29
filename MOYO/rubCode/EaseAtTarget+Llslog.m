#import "EaseAtTarget+Llslog.h"
@implementation EaseAtTarget (Llslog)
- (void)initWithUserId:(NSString*)userId andNickname:(NSString*)nickname llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
