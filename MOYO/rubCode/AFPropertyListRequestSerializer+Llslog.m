#import "AFPropertyListRequestSerializer+Llslog.h"
@implementation AFPropertyListRequestSerializer (Llslog)
+ (void)serializerLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)serializerWithFormat:(NSPropertyListFormat)format
                        writeOptions:(NSPropertyListWriteOptions)writeOptions llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
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
