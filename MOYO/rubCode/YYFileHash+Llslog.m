#import "YYFileHash+Llslog.h"
@implementation YYFileHash (Llslog)
+ (void)hashForFile:(NSString *)filePath types:(YYFileHashType)types llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)hashForFile:(NSString *)filePath types:(YYFileHashType)types usingBlock:(void(^)(UInt64 totalSize, UInt64 processedSize, BOOL *stop))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
