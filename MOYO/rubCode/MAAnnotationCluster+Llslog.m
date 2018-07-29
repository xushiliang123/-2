#import "MAAnnotationCluster+Llslog.h"
@implementation MAAnnotationCluster (Llslog)
- (void)debugDescriptionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
