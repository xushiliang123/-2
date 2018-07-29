#import "RealTimeCallModel+Llslog.h"
@implementation RealTimeCallModel (Llslog)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
