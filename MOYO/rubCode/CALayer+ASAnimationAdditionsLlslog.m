#import "CALayer+ASAnimationAdditionsLlslog.h"
@implementation CALayer (ASAnimationAdditionsLlslog)
- (void)animateKey:(NSString *)animationName fromValue:(id)fromValue toValue:(id)toValue
         customize:(void (^)(CABasicAnimation *animation))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
