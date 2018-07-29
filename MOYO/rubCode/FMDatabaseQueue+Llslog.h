#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"
#import <sqlite3.h>

@interface FMDatabaseQueue (Llslog)
+ (void)databaseQueueWithPath:(NSString *)aPath llslog:(NSString *)llslog;
+ (void)databaseQueueWithURL:(NSURL *)url llslog:(NSString *)llslog;
+ (void)databaseQueueWithPath:(NSString *)aPath flags:(int)openFlags llslog:(NSString *)llslog;
+ (void)databaseQueueWithURL:(NSURL *)url flags:(int)openFlags llslog:(NSString *)llslog;
+ (void)databaseClassLlslog:(NSString *)llslog;
- (void)initWithURL:(NSURL *)url flags:(int)openFlags vfs:(NSString *)vfsName llslog:(NSString *)llslog;
- (void)initWithPath:(NSString*)aPath flags:(int)openFlags vfs:(NSString *)vfsName llslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)aPath flags:(int)openFlags llslog:(NSString *)llslog;
- (void)initWithURL:(NSURL *)url flags:(int)openFlags llslog:(NSString *)llslog;
- (void)initWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)aPath llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)closeLlslog:(NSString *)llslog;
- (void)interruptLlslog:(NSString *)llslog;
- (void)databaseLlslog:(NSString *)llslog;
- (void)inDatabase:(void (^)(FMDatabase *db))block llslog:(NSString *)llslog;
- (void)beginTransaction:(BOOL)useDeferred withBlock:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog;
- (void)inDeferredTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog;
- (void)inTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog;
- (void)inSavePoint:(void (^)(FMDatabase *db, BOOL *rollback))block llslog:(NSString *)llslog;

@end
