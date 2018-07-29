#import "FMDatabasePool+Llslog.h"
@implementation FMDatabasePool (Llslog)
+ (void)databasePoolWithPath:(NSString *)aPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)databasePoolWithURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)databasePoolWithPath:(NSString *)aPath flags:(int)openFlags llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)databasePoolWithURL:(NSURL *)url flags:(int)openFlags llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithURL:(NSURL *)url flags:(int)openFlags vfs:(NSString *)vfsName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithPath:(NSString*)aPath flags:(int)openFlags vfs:(NSString *)vfsName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithPath:(NSString *)aPath flags:(int)openFlags llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithURL:(NSURL *)url flags:(int)openFlags llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithPath:(NSString*)aPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithURL:(NSURL *)url llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)databaseClassLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)executeLocked:(void (^)(void))aBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)pushDatabaseBackInPool:(FMDatabase*)db llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dbLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)countOfCheckedInDatabasesLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)countOfCheckedOutDatabasesLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)countOfOpenDatabasesLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)releaseAllDatabasesLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)inDatabase:(void (^)(FMDatabase *db))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)beginTransaction:(BOOL)useDeferred withBlock:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)inDeferredTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)inTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)inSavePoint:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
