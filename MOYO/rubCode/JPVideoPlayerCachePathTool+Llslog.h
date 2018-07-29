#import <Foundation/Foundation.h>
#import "JPVideoPlayerCachePathTool.h"
#import "JPVideoPlayerCache.h"

@interface JPVideoPlayerCachePathTool (Llslog)
+ (void)videoCachePathForAllTemporaryFileLlslog:(NSString *)llslog;
+ (void)videoCachePathForAllFullFileLlslog:(NSString *)llslog;
+ (void)videoCacheTemporaryPathForKey:(NSString * _Nonnull)key llslog:(NSString *)llslog;
+ (void)videoCacheFullPathForKey:(NSString * _Nonnull)key llslog:(NSString *)llslog;
+ (void)getFilePathWithAppendingString:(nonnull NSString *)apdStr llslog:(NSString *)llslog;

@end
