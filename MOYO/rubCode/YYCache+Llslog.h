#import <Foundation/Foundation.h>
#import "YYCache.h"
#import "YYMemoryCache.h"
#import "YYDiskCache.h"

@interface YYCache (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithName:(NSString *)name llslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)path llslog:(NSString *)llslog;
+ (void)cacheWithName:(NSString *)name llslog:(NSString *)llslog;
+ (void)cacheWithPath:(NSString *)path llslog:(NSString *)llslog;
- (void)containsObjectForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)containsObjectForKey:(NSString *)key withBlock:(void (^)(NSString *key, BOOL contains))block llslog:(NSString *)llslog;
- (void)objectForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)objectForKey:(NSString *)key withBlock:(void (^)(NSString *key, id<NSCoding> object))block llslog:(NSString *)llslog;
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key llslog:(NSString *)llslog;
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key withBlock:(void (^)(void))block llslog:(NSString *)llslog;
- (void)removeObjectForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)removeObjectForKey:(NSString *)key withBlock:(void (^)(NSString *key))block llslog:(NSString *)llslog;
- (void)removeAllObjectsLlslog:(NSString *)llslog;
- (void)removeAllObjectsWithBlock:(void(^)(void))block llslog:(NSString *)llslog;
- (void)removeAllObjectsWithProgressBlock:(void(^)(int removedCount, int totalCount))progress
                                 endBlock:(void(^)(BOOL error))end llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;

@end
