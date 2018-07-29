#import "LKDB+Mapping.h"
#import "LKDBUtils.h"
#import "NSObject+LKDBHelper.h"
#import "NSObject+LKModel.h"
#import <FMDB/FMDB.h>
#import <Foundation/Foundation.h>
#import "LKDBHelper.h"
#import <sqlite3.h>

@interface LKDBHelper (DatabaseManagerLlslog)
- (void)dropAllTableLlslog:(NSString *)llslog;
- (void)dropTableWithClass:(Class)modelClass llslog:(NSString *)llslog;
- (void)dropTableWithTableName:(NSString *)tableName llslog:(NSString *)llslog;
- (void)fixSqlColumnsWithClass:(Class)clazz tableName:(NSString *)tableName llslog:(NSString *)llslog;
- (void)_createTableWithModelClass:(Class)modelClass tableName:(NSString *)tableName llslog:(NSString *)llslog;
- (void)getTableCreatedWithClass:(Class)modelClass llslog:(NSString *)llslog;
- (void)getTableCreatedWithTableName:(NSString *)tableName llslog:(NSString *)llslog;

@end
