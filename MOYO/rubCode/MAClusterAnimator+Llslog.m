#import "MAClusterAnimator+Llslog.h"
@implementation MAClusterAnimator (Llslog)
- (void)addAnimationToView:(UIView *)view llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
