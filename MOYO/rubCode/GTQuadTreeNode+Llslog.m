#import "GTQuadTreeNode+Llslog.h"
@implementation GTQuadTreeNode (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithBoundingBox:(MABoundingBox)box llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithBoundingBox:(MABoundingBox)box capacity:(NSUInteger)capacity llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isLeafLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)subdivideLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
