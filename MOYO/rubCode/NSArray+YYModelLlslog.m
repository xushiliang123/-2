#import "NSArray+YYModelLlslog.h"
@implementation NSArray (YYModelLlslog)
+ (void)modelArrayWithClass:(Class)cls json:(id)json llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)modelArrayWithClass:(Class)cls array:(NSArray *)arr llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
