#import "AFCompoundResponseSerializer+Llslog.h"
@implementation AFCompoundResponseSerializer (Llslog)
+ (void)compoundSerializerWithResponseSerializers:(NSArray *)responseSerializers llslog:(NSString *)llslog {
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
