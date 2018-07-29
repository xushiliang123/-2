#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "FMDatabasePool.h"
#import "FMDatabase.h"

@interface FMDatabasePool (Llslog)
+ (void)databasePoolWithPath:(NSString *)aPath llslog:(NSString *)llslog;
+ (void)databasePoolWithURL:(NSURL *)url llslog:(NSString *)llslog;
+ (void)databasePoolWithPath:(NSString *)aPath flags:(int)openFlags llslog:(NSString *)llslog;
+ (void)databasePoolWithURL:(NSURL *)url flags:(int)openFlags llslog:(NSString *)llslog;
- (void)initWithURL:(NSURL *)url flags:(int)openFlags vfs:(NSString *)vfsName llslog:(NSString *)llslog;
- (void)initWithPath:(NSString*)aPath flags:(int)openFlags vfs:(NSString *)vfsName llslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)aPath flags:(int)openFlags llslog:(NSString *)llslog;
- (void)initWithURL:(NSURL *)url flags:(int)openFlags llslog:(NSString *)llslog;
- (void)initWithPath:(NSString*)aPath llslog:(NSString *)llslog;
- (void)initWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
+ (void)databaseClassLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)executeLocked:(void (^)(void))aBlock llslog:(NSString *)llslog;
- (void)pushDatabaseBackInPool:(FMDatabase*)db llslog:(NSString *)llslog;
- (void)dbLlslog:(NSString *)llslog;
- (void)countOfCheckedInDatabasesLlslog:(NSString *)llslog;
- (void)countOfCheckedOutDatabasesLlslog:(NSString *)llslog;
- (void)countOfOpenDatabasesLlslog:(NSString *)llslog;
- (void)releaseAllDatabasesLlslog:(NSString *)llslog;
- (void)inDatabase:(void (^)(FMDatabase *db))block llslog:(NSString *)llslog;
- (void)beginTransaction:(BOOL)useDeferred withBlock:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog;
- (void)inDeferredTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog;
- (void)inTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog;
- (void)inSavePoint:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog;

@end
