#import "LKDBHelper+DatabaseExecuteLlslog.h"
@implementation LKDBHelper (DatabaseExecuteLlslog)
- (void)modelValueWithProperty:(LKDBProperty *)property model:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)asyncBlock:(void (^)(void))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)rowCount:(Class)modelClass where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)rowCount:(Class)modelClass where:(id)where callback:(void (^)(NSInteger))callback llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)rowCountWithTableName:(NSString *)tableName where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)search:(Class)modelClass where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)search:(Class)modelClass column:(id)columns where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)searchSingle:(Class)modelClass where:(id)where orderBy:(NSString *)orderBy llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)search:(Class)modelClass where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count callback:(void (^)(NSMutableArray *))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)searchBaseWithParams:(LKDBQueryParams *)params llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)searchWithParams:(LKDBQueryParams *)params llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)searchBase:(Class)modelClass columns:(id)columns where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)replaceTableNameIfNeeded:(NSString *)sql withModelClass:(Class)modelClass llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)searchWithSQL:(NSString *)sql toClass:(Class)modelClass llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)searchWithRAWSQL:(NSString *)sql toClass:(Class)modelClass llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

- (void)sqlString:(NSMutableString *)sql groupBy:(NSString *)groupBy orderBy:(NSString *)orderby offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)executeOneColumnResult:(FMResultSet *)set llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)executeResult:(FMResultSet *)set Class:(Class)modelClass tableName:(NSString *)tableName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertToDB:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertToDB:(NSObject *)model callback:(void (^)(BOOL))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertWhenNotExists:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertWhenNotExists:(NSObject *)model callback:(void (^)(BOOL))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)insertBase:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateToDB:(NSObject *)model where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateToDB:(NSObject *)model where:(id)where callback:(void (^)(BOOL))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateToDBBase:(NSObject *)model where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateToDB:(Class)modelClass set:(NSString *)sets where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateToDBWithTableName:(NSString *)tableName set:(NSString *)sets where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteToDB:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteToDB:(NSObject *)model callback:(void (^)(BOOL))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteToDBBase:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteWithClass:(Class)modelClass where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteWithClass:(Class)modelClass where:(id)where callback:(void (^)(BOOL))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteWithTableName:(NSString *)tableName where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isExistsModel:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isExistsClass:(Class)modelClass where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isExistsWithTableName:(NSString *)tableName where:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)clearTableData:(Class)modelClass llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)clearNoneImage:(Class)modelClass columns:(NSArray *)columns llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)clearNoneData:(Class)modelClass columns:(NSArray *)columns llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)clearFileWithTable:(Class)modelClass columns:(NSArray *)columns type:(NSInteger)type llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
