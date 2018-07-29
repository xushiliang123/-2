#import "LKDB+Mapping.h"
#import "LKDBUtils.h"
#import "NSObject+LKDBHelper.h"
#import "NSObject+LKModel.h"
#import <FMDB/FMDB.h>
#import <Foundation/Foundation.h>
#import "LKDBHelper.h"
#import <sqlite3.h>

@interface LKDBHelper (DatabaseExecuteLlslog)
- (void)modelValueWithProperty:(LKDBProperty *)property model:(NSObject *)model llslog:(NSString *)llslog;
- (void)asyncBlock:(void (^)(void))block llslog:(NSString *)llslog;
- (void)rowCount:(Class)modelClass where:(id)where llslog:(NSString *)llslog;
- (void)rowCount:(Class)modelClass where:(id)where callback:(void (^)(NSInteger))callback llslog:(NSString *)llslog;
- (void)rowCountWithTableName:(NSString *)tableName where:(id)where llslog:(NSString *)llslog;
- (void)search:(Class)modelClass where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog;
- (void)search:(Class)modelClass column:(id)columns where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog;
- (void)searchSingle:(Class)modelClass where:(id)where orderBy:(NSString *)orderBy llslog:(NSString *)llslog;
- (void)search:(Class)modelClass where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count callback:(void (^)(NSMutableArray *))block llslog:(NSString *)llslog;
- (void)searchBaseWithParams:(LKDBQueryParams *)params llslog:(NSString *)llslog;
- (void)searchWithParams:(LKDBQueryParams *)params llslog:(NSString *)llslog;
- (void)searchBase:(Class)modelClass columns:(id)columns where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog;
- (void)replaceTableNameIfNeeded:(NSString *)sql withModelClass:(Class)modelClass llslog:(NSString *)llslog;
- (void)searchWithSQL:(NSString *)sql toClass:(Class)modelClass llslog:(NSString *)llslog;
- (void)searchWithRAWSQL:(NSString *)sql toClass:(Class)modelClass llslog:(NSString *)llslog;


- (void)executeOneColumnResult:(FMResultSet *)set llslog:(NSString *)llslog;
- (void)executeResult:(FMResultSet *)set Class:(Class)modelClass tableName:(NSString *)tableName llslog:(NSString *)llslog;
- (void)insertToDB:(NSObject *)model llslog:(NSString *)llslog;
- (void)insertToDB:(NSObject *)model callback:(void (^)(BOOL))block llslog:(NSString *)llslog;
- (void)insertWhenNotExists:(NSObject *)model llslog:(NSString *)llslog;
- (void)insertWhenNotExists:(NSObject *)model callback:(void (^)(BOOL))block llslog:(NSString *)llslog;
- (void)insertBase:(NSObject *)model llslog:(NSString *)llslog;
- (void)updateToDB:(NSObject *)model where:(id)where llslog:(NSString *)llslog;
- (void)updateToDB:(NSObject *)model where:(id)where callback:(void (^)(BOOL))block llslog:(NSString *)llslog;
- (void)updateToDBBase:(NSObject *)model where:(id)where llslog:(NSString *)llslog;
- (void)updateToDB:(Class)modelClass set:(NSString *)sets where:(id)where llslog:(NSString *)llslog;
- (void)updateToDBWithTableName:(NSString *)tableName set:(NSString *)sets where:(id)where llslog:(NSString *)llslog;
- (void)deleteToDB:(NSObject *)model llslog:(NSString *)llslog;
- (void)deleteToDB:(NSObject *)model callback:(void (^)(BOOL))block llslog:(NSString *)llslog;
- (void)deleteToDBBase:(NSObject *)model llslog:(NSString *)llslog;
- (void)deleteWithClass:(Class)modelClass where:(id)where llslog:(NSString *)llslog;
- (void)deleteWithClass:(Class)modelClass where:(id)where callback:(void (^)(BOOL))block llslog:(NSString *)llslog;
- (void)deleteWithTableName:(NSString *)tableName where:(id)where llslog:(NSString *)llslog;
- (void)isExistsModel:(NSObject *)model llslog:(NSString *)llslog;
- (void)isExistsClass:(Class)modelClass where:(id)where llslog:(NSString *)llslog;
- (void)isExistsWithTableName:(NSString *)tableName where:(id)where llslog:(NSString *)llslog;
+ (void)clearTableData:(Class)modelClass llslog:(NSString *)llslog;
+ (void)clearNoneImage:(Class)modelClass columns:(NSArray *)columns llslog:(NSString *)llslog;
+ (void)clearNoneData:(Class)modelClass columns:(NSArray *)columns llslog:(NSString *)llslog;
+ (void)clearFileWithTable:(Class)modelClass columns:(NSArray *)columns type:(NSInteger)type llslog:(NSString *)llslog;

@end
