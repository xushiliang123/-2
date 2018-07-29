#import <Foundation/Foundation.h>
#import "FMResultSet.h"
#import "FMDatabasePool.h"
#import "FMDatabase.h"
#import "unistd.h"
#import <objc/runtime.h>
//#import <sqlite3/sqlite3.h>
#import <sqlite3.h>

@interface FMDatabase (Llslog)
+ (void)databaseWithPath:(NSString *)aPath llslog:(NSString *)llslog;
+ (void)databaseWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithURL:(NSURL *)url llslog:(NSString *)llslog;
- (void)initWithPath:(NSString *)path llslog:(NSString *)llslog;
- (void)finalizeLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)databaseURLLlslog:(NSString *)llslog;
+ (void)FMDBUserVersionLlslog:(NSString *)llslog;
+ (void)FMDBVersionLlslog:(NSString *)llslog;
+ (void)sqliteLibVersionLlslog:(NSString *)llslog;
+ (void)isSQLiteThreadSafeLlslog:(NSString *)llslog;
- (void)sqliteHandleLlslog:(NSString *)llslog;
- (void)sqlitePathLlslog:(NSString *)llslog;
- (void)openLlslog:(NSString *)llslog;
- (void)openWithFlags:(int)flags llslog:(NSString *)llslog;
- (void)openWithFlags:(int)flags vfs:(NSString *)vfsName llslog:(NSString *)llslog;
- (void)closeLlslog:(NSString *)llslog;
- (void)setMaxBusyRetryTimeInterval:(NSTimeInterval)timeout llslog:(NSString *)llslog;
- (void)maxBusyRetryTimeIntervalLlslog:(NSString *)llslog;
- (void)busyRetryTimeoutLlslog:(NSString *)llslog;
- (void)setBusyRetryTimeout:(int)i llslog:(NSString *)llslog;
- (void)hasOpenResultSetsLlslog:(NSString *)llslog;
- (void)closeOpenResultSetsLlslog:(NSString *)llslog;
- (void)resultSetDidClose:(FMResultSet *)resultSet llslog:(NSString *)llslog;
- (void)clearCachedStatementsLlslog:(NSString *)llslog;
- (void)cachedStatementForQuery:(NSString*)query llslog:(NSString *)llslog;
- (void)setCachedStatement:(FMStatement*)statement forQuery:(NSString*)query llslog:(NSString *)llslog;
- (void)rekey:(NSString*)key llslog:(NSString *)llslog;
- (void)rekeyWithData:(NSData *)keyData llslog:(NSString *)llslog;
- (void)setKey:(NSString*)key llslog:(NSString *)llslog;
- (void)setKeyWithData:(NSData *)keyData llslog:(NSString *)llslog;
+ (void)storeableDateFormat:(NSString *)format llslog:(NSString *)llslog;
- (void)hasDateFormatterLlslog:(NSString *)llslog;
- (void)setDateFormat:(NSDateFormatter *)format llslog:(NSString *)llslog;
- (void)dateFromString:(NSString *)s llslog:(NSString *)llslog;
- (void)stringFromDate:(NSDate *)date llslog:(NSString *)llslog;
- (void)goodConnectionLlslog:(NSString *)llslog;
- (void)warnInUseLlslog:(NSString *)llslog;
- (void)databaseExistsLlslog:(NSString *)llslog;
- (void)lastErrorMessageLlslog:(NSString *)llslog;
- (void)hadErrorLlslog:(NSString *)llslog;
- (void)lastErrorCodeLlslog:(NSString *)llslog;
- (void)lastExtendedErrorCodeLlslog:(NSString *)llslog;
- (void)errorWithMessage:(NSString *)message llslog:(NSString *)llslog;
- (void)lastErrorLlslog:(NSString *)llslog;
- (void)lastInsertRowIdLlslog:(NSString *)llslog;
- (void)changesLlslog:(NSString *)llslog;
- (void)bindObject:(id)obj toColumn:(int)idx inStatement:(sqlite3_stmt*)pStmt llslog:(NSString *)llslog;
- (void)extractSQL:(NSString *)sql argumentsList:(va_list)args intoString:(NSMutableString *)cleanedSQL arguments:(NSMutableArray *)arguments llslog:(NSString *)llslog;
- (void)executeQuery:(NSString *)sql withParameterDictionary:(NSDictionary *)arguments llslog:(NSString *)llslog;
- (void)executeQuery:(NSString *)sql withArgumentsInArray:(NSArray*)arrayArgs orDictionary:(NSDictionary *)dictionaryArgs orVAList:(va_list)args llslog:(NSString *)llslog;
- (void)executeQuery:(NSString*)sql    llslog:(NSString *)llslog;
- (void)executeQueryWithFormat:(NSString*)format    llslog:(NSString *)llslog;
- (void)executeQuery:(NSString *)sql withArgumentsInArray:(NSArray *)arguments llslog:(NSString *)llslog;
- (void)executeQuery:(NSString *)sql values:(NSArray *)values error:(NSError * __autoreleasing *)error llslog:(NSString *)llslog;
- (void)executeQuery:(NSString*)sql withVAList:(va_list)args llslog:(NSString *)llslog;
- (void)executeUpdate:(NSString*)sql error:(NSError**)outErr withArgumentsInArray:(NSArray*)arrayArgs orDictionary:(NSDictionary *)dictionaryArgs orVAList:(va_list)args llslog:(NSString *)llslog;
- (void)executeUpdate:(NSString*)sql    llslog:(NSString *)llslog;
- (void)executeUpdate:(NSString*)sql withArgumentsInArray:(NSArray *)arguments llslog:(NSString *)llslog;
- (void)executeUpdate:(NSString*)sql values:(NSArray *)values error:(NSError * __autoreleasing *)error llslog:(NSString *)llslog;
- (void)executeUpdate:(NSString*)sql withParameterDictionary:(NSDictionary *)arguments llslog:(NSString *)llslog;
- (void)executeUpdate:(NSString*)sql withVAList:(va_list)args llslog:(NSString *)llslog;
- (void)executeUpdateWithFormat:(NSString*)format    llslog:(NSString *)llslog;
- (void)executeStatements:(NSString *)sql llslog:(NSString *)llslog;
- (void)executeStatements:(NSString *)sql withResultBlock:(FMDBExecuteStatementsCallbackBlock)block llslog:(NSString *)llslog;
- (void)executeUpdate:(NSString*)sql withErrorAndBindings:(NSError**)outErr    llslog:(NSString *)llslog;
- (void)update:(NSString*)sql withErrorAndBindings:(NSError**)outErr    llslog:(NSString *)llslog;
- (void)rollbackLlslog:(NSString *)llslog;
- (void)commitLlslog:(NSString *)llslog;
- (void)beginDeferredTransactionLlslog:(NSString *)llslog;
- (void)beginTransactionLlslog:(NSString *)llslog;
- (void)inTransactionLlslog:(NSString *)llslog;
- (void)interruptLlslog:(NSString *)llslog;
- (void)startSavePointWithName:(NSString*)name error:(NSError**)outErr llslog:(NSString *)llslog;
- (void)releaseSavePointWithName:(NSString*)name error:(NSError**)outErr llslog:(NSString *)llslog;
- (void)rollbackToSavePointWithName:(NSString*)name error:(NSError**)outErr llslog:(NSString *)llslog;
- (void)inSavePoint:(void (^)(BOOL *rollback))block llslog:(NSString *)llslog;
- (void)shouldCacheStatementsLlslog:(NSString *)llslog;
- (void)setShouldCacheStatements:(BOOL)value llslog:(NSString *)llslog;
- (void)makeFunctionNamed:(NSString *)name maximumArguments:(int)arguments withBlock:(void (^)(void *context, int argc, void **argv))block llslog:(NSString *)llslog;
- (void)makeFunctionNamed:(NSString *)name arguments:(int)arguments block:(void (^)(void *context, int argc, void **argv))block llslog:(NSString *)llslog;
- (void)valueType:(void *)value llslog:(NSString *)llslog;
- (void)valueInt:(void *)value llslog:(NSString *)llslog;
- (void)valueLong:(void *)value llslog:(NSString *)llslog;
- (void)valueDouble:(void *)value llslog:(NSString *)llslog;
- (void)valueData:(void *)value llslog:(NSString *)llslog;
- (void)valueString:(void *)value llslog:(NSString *)llslog;
- (void)resultNullInContext:(void *)context llslog:(NSString *)llslog;
- (void)resultInt:(int) value context:(void *)context llslog:(NSString *)llslog;
- (void)resultLong:(long long)value context:(void *)context llslog:(NSString *)llslog;
- (void)resultDouble:(double)value context:(void *)context llslog:(NSString *)llslog;
- (void)resultData:(NSData *)data context:(void *)context llslog:(NSString *)llslog;
- (void)resultString:(NSString *)value context:(void *)context llslog:(NSString *)llslog;
- (void)resultError:(NSString *)error context:(void *)context llslog:(NSString *)llslog;
- (void)resultErrorCode:(int)errorCode context:(void *)context llslog:(NSString *)llslog;
- (void)resultErrorNoMemoryInContext:(void *)context llslog:(NSString *)llslog;
- (void)resultErrorTooBigInContext:(void *)context llslog:(NSString *)llslog;

@end
