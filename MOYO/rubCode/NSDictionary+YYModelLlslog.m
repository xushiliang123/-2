#import "NSDictionary+YYModelLlslog.h"
@implementation NSDictionary (YYModelLlslog)
+ (void)modelDictionaryWithClass:(Class)cls json:(id)json llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)modelDictionaryWithClass:(Class)cls dictionary:(NSDictionary *)dic llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
