#import "YYTextArchiver+Llslog.h"
@implementation YYTextArchiver (Llslog)
+ (void)archivedDataWithRootObject:(id)rootObject llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)archiveRootObject:(id)rootObject toFile:(NSString *)path llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initForWritingWithMutableData:(NSMutableData *)data llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)archiver:(NSKeyedArchiver *)archiver willEncodeObject:(id)object llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
