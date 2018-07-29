#import "LKDBHelper+Llslog.h"
@implementation LKDBHelper (Llslog)
+ (void)setLogError:(BOOL)logError llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)setNullToEmpty:(BOOL)empty llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)nullIsEmptyLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbHelperSingleArrayLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbHelperWithPath:(NSString *)dbFilePath save:(LKDBHelper *)helper llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithDBName:(NSString *)dbname llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithDBPath:(NSString *)filePath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)getDBPathWithDBName:(NSString *)dbName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setDBName:(NSString *)dbName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setDBPath:(NSString *)filePath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)executeDB:(void (^)(FMDatabase *db))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)executeSQL:(NSString *)sql arguments:(NSArray *)args llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)executeScalarWithSQL:(NSString *)sql arguments:(NSArray *)args llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)executeForTransaction:(BOOL (^)(LKDBHelper *))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)extractQuery:(NSMutableString *)query where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dictionaryToSqlWhere:(NSDictionary *)dic andValues:(NSMutableArray *)values llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)primaryKeyWhereSQLWithModel:(NSObject *)model addPValues:(NSMutableArray *)addPValues llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setKey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)rekey:(NSString *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)encryptionKeyLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deallocLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
