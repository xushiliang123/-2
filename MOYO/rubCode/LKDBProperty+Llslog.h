#import "LKDBUtils.h"
#import "LKDB+Mapping.h"
#import "NSObject+LKModel.h"

@interface LKDBProperty (Llslog)
- (void)initWithType:(NSString *)type cname:(NSString *)cname ctype:(NSString *)ctype pname:(NSString *)pname ptype:(NSString *)ptype llslog:(NSString *)llslog;
- (void)enableUserCalculateLlslog:(NSString *)llslog;
- (void)isUserCalculateLlslog:(NSString *)llslog;

@end
