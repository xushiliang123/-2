#import "LKDBHelper+Deprecated_NonfunctionalLlslog.h"
@implementation LKDBHelper (Deprecated_NonfunctionalLlslog)
- (void)setEncryptionKey:(NSString *)encryptionKey llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)sharedDBHelperLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)createTableWithModelClass:(Class)modelClass llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)getUsingLKDBHelperLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
