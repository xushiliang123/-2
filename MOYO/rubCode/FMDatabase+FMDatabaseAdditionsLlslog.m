#import "FMDatabase+FMDatabaseAdditionsLlslog.h"
@implementation FMDatabase (FMDatabaseAdditionsLlslog)

- (void)tableExists:(NSString*)tableName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getSchemaLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getTableSchema:(NSString*)tableName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)columnExists:(NSString*)columnName inTableWithName:(NSString*)tableName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)applicationIDLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setApplicationID:(uint32_t)appID llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)applicationIDStringLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setApplicationIDString:(NSString*)s llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)userVersionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setUserVersion:(uint32_t)version llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

- (void)validateSQL:(NSString*)sql error:(NSError**)error llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
