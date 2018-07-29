#import "YYCache+Llslog.h"
@implementation YYCache (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithName:(NSString *)name llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithPath:(NSString *)path llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)cacheWithName:(NSString *)name llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)cacheWithPath:(NSString *)path llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)containsObjectForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)containsObjectForKey:(NSString *)key withBlock:(void (^)(NSString *key, BOOL contains))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectForKey:(NSString *)key withBlock:(void (^)(NSString *key, id<NSCoding> object))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key withBlock:(void (^)(void))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeObjectForKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeObjectForKey:(NSString *)key withBlock:(void (^)(NSString *key))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeAllObjectsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeAllObjectsWithBlock:(void(^)(void))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeAllObjectsWithProgressBlock:(void(^)(int removedCount, int totalCount))progress
                                 endBlock:(void(^)(BOOL error))end llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)descriptionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
