#import <Foundation/Foundation.h>
#import "YYFileHash.h"

@interface YYFileHash (Llslog)
+ (void)hashForFile:(NSString *)filePath types:(YYFileHashType)types llslog:(NSString *)llslog;
+ (void)hashForFile:(NSString *)filePath types:(YYFileHashType)types usingBlock:(void(^)(UInt64 totalSize, UInt64 processedSize, BOOL *stop))block llslog:(NSString *)llslog;

@end
