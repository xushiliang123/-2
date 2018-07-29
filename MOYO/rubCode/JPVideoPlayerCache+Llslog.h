#import <Foundation/Foundation.h>
#import "JPVideoPlayerCompat.h"
#import "JPVideoPlayerCache.h"
#import "JPVideoPlayerCacheConfig.h"
#import "JPVideoPlayerCachePathTool.h"
#import "JPVideoPlayerCompat.h"
#import "JPVideoPlayerManager.h"
#import "JPVideoPlayerDownloaderOperation.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSURL+QueryStrip.h"

@interface JPVideoPlayerCache (Llslog)
- (void)initLlslog:(NSString *)llslog;
+ (void)sharedCacheLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)downloadVideoDidStart:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)storeVideoData:(nullable NSData *)videoData expectedSize:(NSUInteger)expectedSize forKey:(nullable NSString *)key completion:(nullable JPVideoPlayerStoreDataFinishedBlock)completionBlock llslog:(NSString *)llslog;
- (void)cancel:(nullable JPVideoPlayerCacheToken *)token llslog:(NSString *)llslog;
- (void)cancelCurrentComletionBlockLlslog:(NSString *)llslog;
- (void)queryCacheOperationForKey:(nullable NSString *)key done:(nullable JPVideoPlayerCacheQueryCompletedBlock)doneBlock llslog:(NSString *)llslog;
- (void)diskVideoExistsWithKey:(NSString *)key completion:(JPVideoPlayerCheckCacheCompletionBlock)completionBlock llslog:(NSString *)llslog;
- (void)diskVideoExistsWithPath:(NSString * _Nullable)fullVideoCachePath llslog:(NSString *)llslog;
- (void)removeFullCacheForKey:(nullable NSString *)key withCompletion:(nullable JPVideoPlayerNoParamsBlock)completion llslog:(NSString *)llslog;
- (void)removeTempCacheForKey:(NSString * _Nonnull)key withCompletion:(nullable JPVideoPlayerNoParamsBlock)completion llslog:(NSString *)llslog;
- (void)deleteOldFilesWithCompletionBlock:(nullable JPVideoPlayerNoParamsBlock)completionBlock llslog:(NSString *)llslog;
- (void)deleteAllTempCacheOnCompletion:(nullable JPVideoPlayerNoParamsBlock)completion llslog:(NSString *)llslog;
- (void)clearDiskOnCompletion:(nullable JPVideoPlayerNoParamsBlock)completion llslog:(NSString *)llslog;
- (void)cacheFileNameForKey:(nullable NSString *)key llslog:(NSString *)llslog;
- (void)cachedFileNameForKey:(nullable NSString *)key llslog:(NSString *)llslog;
- (void)haveFreeSizeToCacheFileWithSize:(NSUInteger)fileSize llslog:(NSString *)llslog;
- (void)getSizeLlslog:(NSString *)llslog;
- (void)getDiskCountLlslog:(NSString *)llslog;
- (void)calculateSizeWithCompletionBlock:(JPVideoPlayerCalculateSizeBlock)completionBlock llslog:(NSString *)llslog;
- (void)getDiskFreeSizeLlslog:(NSString *)llslog;
- (void)deleteOldFilesLlslog:(NSString *)llslog;
- (void)backgroundDeleteOldFilesLlslog:(NSString *)llslog;

@end
