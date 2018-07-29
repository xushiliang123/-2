#import <Foundation/Foundation.h>
#import "YYDiskCache.h"
#import "YYKVStorage.h"
#import "NSString+YYAdd.h"
#import "UIDevice+YYAdd.h"
#import <objc/runtime.h>
#import <time.h>

@interface YYDiskCache (Llslog)
- (void)_trimRecursivelyLlslog:(NSString *)llslog;
- (void)_trimInBackgroundLlslog:(NSString *)llslog;
- (void)_trimToCost:(NSUInteger)costLimit llslog:(NSString *)llslog;
- (void)_trimToCount:(NSUInteger)countLimit llslog:(NSString *)llslog;
- (void)_trimToAge:(NSTimeInterval)ageLimit llslog:(NSString *)llslog;
- (void)_trimToFreeDiskSpace:(NSUInteger)targetFreeDiskSpace llslog:(NSString *)llslog;
- (void)_filenameForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)_appWillBeTerminatedLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)path llslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)path
             inlineThreshold:(NSUInteger)threshold llslog:(NSString *)llslog;
- (void)containsObjectForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)containsObjectForKey:(NSString *)key withBlock:(void(^)(NSString *key, BOOL contains))block llslog:(NSString *)llslog;
- (void)objectForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)objectForKey:(NSString *)key withBlock:(void(^)(NSString *key, id<NSCoding> object))block llslog:(NSString *)llslog;
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key llslog:(NSString *)llslog;
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key withBlock:(void(^)(void))block llslog:(NSString *)llslog;
- (void)removeObjectForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)removeObjectForKey:(NSString *)key withBlock:(void(^)(NSString *key))block llslog:(NSString *)llslog;
- (void)removeAllObjectsLlslog:(NSString *)llslog;
- (void)removeAllObjectsWithBlock:(void(^)(void))block llslog:(NSString *)llslog;
- (void)removeAllObjectsWithProgressBlock:(void(^)(int removedCount, int totalCount))progress
                                 endBlock:(void(^)(BOOL error))end llslog:(NSString *)llslog;
- (void)totalCountLlslog:(NSString *)llslog;
- (void)totalCountWithBlock:(void(^)(NSInteger totalCount))block llslog:(NSString *)llslog;
- (void)totalCostLlslog:(NSString *)llslog;
- (void)totalCostWithBlock:(void(^)(NSInteger totalCost))block llslog:(NSString *)llslog;
- (void)trimToCount:(NSUInteger)count llslog:(NSString *)llslog;
- (void)trimToCount:(NSUInteger)count withBlock:(void(^)(void))block llslog:(NSString *)llslog;
- (void)trimToCost:(NSUInteger)cost llslog:(NSString *)llslog;
- (void)trimToCost:(NSUInteger)cost withBlock:(void(^)(void))block llslog:(NSString *)llslog;
- (void)trimToAge:(NSTimeInterval)age llslog:(NSString *)llslog;
- (void)trimToAge:(NSTimeInterval)age withBlock:(void(^)(void))block llslog:(NSString *)llslog;
+ (void)getExtendedDataFromObject:(id)object llslog:(NSString *)llslog;
+ (void)setExtendedData:(NSData *)extendedData toObject:(id)object llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;
- (void)errorLogsEnabledLlslog:(NSString *)llslog;
- (void)setErrorLogsEnabled:(BOOL)errorLogsEnabled llslog:(NSString *)llslog;

@end
