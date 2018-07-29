#import "SystemMarkModel+Llslog.h"
@implementation SystemMarkModel (Llslog)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
