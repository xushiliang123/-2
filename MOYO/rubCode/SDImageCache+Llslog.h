#import <Foundation/Foundation.h>
#import "SDWebImageCompat.h"
#import "SDImageCache.h"
#import "SDWebImageDecoder.h"
#import "UIImage+MultiFormat.h"
#import <CommonCrypto/CommonDigest.h>

@interface SDImageCache (Llslog)
+ (void)sharedImageCacheLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithNamespace:(NSString *)ns llslog:(NSString *)llslog;
- (void)initWithNamespace:(NSString *)ns diskCacheDirectory:(NSString *)directory llslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)addReadOnlyCachePath:(NSString *)path llslog:(NSString *)llslog;
- (void)cachePathForKey:(NSString *)key inPath:(NSString *)path llslog:(NSString *)llslog;
- (void)defaultCachePathForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)cachedFileNameForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)makeDiskCachePath:(NSString*)fullNamespace llslog:(NSString *)llslog;
- (void)storeImage:(UIImage *)image recalculateFromImage:(BOOL)recalculate imageData:(NSData *)imageData forKey:(NSString *)key toDisk:(BOOL)toDisk llslog:(NSString *)llslog;
- (void)storeImage:(UIImage *)image forKey:(NSString *)key llslog:(NSString *)llslog;
- (void)storeImage:(UIImage *)image forKey:(NSString *)key toDisk:(BOOL)toDisk llslog:(NSString *)llslog;
- (void)storeImageDataToDisk:(NSData *)imageData forKey:(NSString *)key llslog:(NSString *)llslog;
- (void)diskImageExistsWithKey:(NSString *)key llslog:(NSString *)llslog;
- (void)diskImageExistsWithKey:(NSString *)key completion:(SDWebImageCheckCacheCompletionBlock)completionBlock llslog:(NSString *)llslog;
- (void)imageFromMemoryCacheForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)imageFromDiskCacheForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)diskImageDataBySearchingAllPathsForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)diskImageForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)scaledImageForKey:(NSString *)key image:(UIImage *)image llslog:(NSString *)llslog;
- (void)queryDiskCacheForKey:(NSString *)key done:(SDWebImageQueryCompletedBlock)doneBlock llslog:(NSString *)llslog;
- (void)removeImageForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)removeImageForKey:(NSString *)key withCompletion:(SDWebImageNoParamsBlock)completion llslog:(NSString *)llslog;
- (void)removeImageForKey:(NSString *)key fromDisk:(BOOL)fromDisk llslog:(NSString *)llslog;
- (void)removeImageForKey:(NSString *)key fromDisk:(BOOL)fromDisk withCompletion:(SDWebImageNoParamsBlock)completion llslog:(NSString *)llslog;
- (void)setMaxMemoryCost:(NSUInteger)maxMemoryCost llslog:(NSString *)llslog;
- (void)maxMemoryCostLlslog:(NSString *)llslog;
- (void)maxMemoryCountLimitLlslog:(NSString *)llslog;
- (void)setMaxMemoryCountLimit:(NSUInteger)maxCountLimit llslog:(NSString *)llslog;
- (void)clearMemoryLlslog:(NSString *)llslog;
- (void)clearDiskLlslog:(NSString *)llslog;
- (void)clearDiskOnCompletion:(SDWebImageNoParamsBlock)completion llslog:(NSString *)llslog;
- (void)cleanDiskLlslog:(NSString *)llslog;
- (void)cleanDiskWithCompletionBlock:(SDWebImageNoParamsBlock)completionBlock llslog:(NSString *)llslog;
- (void)backgroundCleanDiskLlslog:(NSString *)llslog;
- (void)getSizeLlslog:(NSString *)llslog;
- (void)getDiskCountLlslog:(NSString *)llslog;
- (void)calculateSizeWithCompletionBlock:(SDWebImageCalculateSizeBlock)completionBlock llslog:(NSString *)llslog;

@end
