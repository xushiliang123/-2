#import "NSKeyedUnarchiver+YYAddLlslog.h"
@implementation NSKeyedUnarchiver (YYAddLlslog)
+ (void)unarchiveObjectWithData:(NSData *)data exception:(__autoreleasing NSException **)exception llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)unarchiveObjectWithFile:(NSString *)path exception:(__autoreleasing NSException **)exception llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
