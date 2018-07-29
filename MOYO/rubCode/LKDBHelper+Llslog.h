#import "LKDB+Mapping.h"
#import "LKDBUtils.h"
#import "NSObject+LKDBHelper.h"
#import "NSObject+LKModel.h"
#import <FMDB/FMDB.h>
#import <Foundation/Foundation.h>
#import "LKDBHelper.h"
#import <sqlite3.h>

@interface LKDBHelper (Llslog)
+ (void)setLogError:(BOOL)logError llslog:(NSString *)llslog;
+ (void)setNullToEmpty:(BOOL)empty llslog:(NSString *)llslog;
+ (void)nullIsEmptyLlslog:(NSString *)llslog;
+ (void)dbHelperSingleArrayLlslog:(NSString *)llslog;
+ (void)dbHelperWithPath:(NSString *)dbFilePath save:(LKDBHelper *)helper llslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithDBName:(NSString *)dbname llslog:(NSString *)llslog;
- (void)initWithDBPath:(NSString *)filePath llslog:(NSString *)llslog;
+ (void)getDBPathWithDBName:(NSString *)dbName llslog:(NSString *)llslog;
- (void)setDBName:(NSString *)dbName llslog:(NSString *)llslog;
- (void)setDBPath:(NSString *)filePath llslog:(NSString *)llslog;
- (void)executeDB:(void (^)(FMDatabase *db))block llslog:(NSString *)llslog;
- (void)executeSQL:(NSString *)sql arguments:(NSArray *)args llslog:(NSString *)llslog;
- (void)executeScalarWithSQL:(NSString *)sql arguments:(NSArray *)args llslog:(NSString *)llslog;
- (void)executeForTransaction:(BOOL (^)(LKDBHelper *))block llslog:(NSString *)llslog;
- (void)extractQuery:(NSMutableString *)query where:(id)where llslog:(NSString *)llslog;
- (void)dictionaryToSqlWhere:(NSDictionary *)dic andValues:(NSMutableArray *)values llslog:(NSString *)llslog;
- (void)primaryKeyWhereSQLWithModel:(NSObject *)model addPValues:(NSMutableArray *)addPValues llslog:(NSString *)llslog;
- (void)setKey:(NSString *)key llslog:(NSString *)llslog;
- (void)rekey:(NSString *)key llslog:(NSString *)llslog;
- (void)encryptionKeyLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;

@end
