#import "MY_GLHomeModel+Llslog.h"
@implementation MY_GLHomeModel (Llslog)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
