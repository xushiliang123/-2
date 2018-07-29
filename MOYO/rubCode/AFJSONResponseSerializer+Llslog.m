#import "AFJSONResponseSerializer+Llslog.h"
@implementation AFJSONResponseSerializer (Llslog)
+ (void)serializerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)serializerWithReadingOptions:(NSJSONReadingOptions)readingOptions llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithCoder:(NSCoder *)decoder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encodeWithCoder:(NSCoder *)coder llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
