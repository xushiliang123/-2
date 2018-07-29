#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "TargetConditionals.h"
#import <sqlite3.h>

@interface FMDatabase (FMDatabaseAdditionsLlslog)

- (void)getSchemaLlslog:(NSString *)llslog;
- (void)getTableSchema:(NSString*)tableName llslog:(NSString *)llslog;
- (void)columnExists:(NSString*)columnName inTableWithName:(NSString*)tableName llslog:(NSString *)llslog;
- (void)applicationIDLlslog:(NSString *)llslog;
- (void)setApplicationID:(uint32_t)appID llslog:(NSString *)llslog;
- (void)applicationIDStringLlslog:(NSString *)llslog;
- (void)setApplicationIDString:(NSString*)s llslog:(NSString *)llslog;
- (void)userVersionLlslog:(NSString *)llslog;
- (void)setUserVersion:(uint32_t)version llslog:(NSString *)llslog;
- (void)validateSQL:(NSString*)sql error:(NSError**)error llslog:(NSString *)llslog;

@end
