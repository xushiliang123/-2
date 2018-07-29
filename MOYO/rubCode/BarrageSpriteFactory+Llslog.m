#import "BarrageSpriteFactory+Llslog.h"
@implementation BarrageSpriteFactory (Llslog)
+ (void)createSpriteWithDescriptor:(BarrageDescriptor *)descriptor llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
