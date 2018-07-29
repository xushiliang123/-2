#import "Banner+Llslog.h"
@implementation Banner (Llslog)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
