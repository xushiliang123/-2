#import "NSMutableDictionary+YYAddLlslog.h"
@implementation NSMutableDictionary (YYAddLlslog)
+ (void)dictionaryWithPlistData:(NSData *)plist llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dictionaryWithPlistString:(NSString *)plist llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)popObjectForKey:(id)aKey llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)popEntriesForKeys:(NSArray *)keys llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
