#import "NSObject+LKDBHelperLlslog.h"
@implementation NSObject (LKDBHelperLlslog)
+ (void)checkModelClass:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)rowCountWithWhereFormat:(id)where   llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)rowCountWithWhere:(id)where   llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)searchColumn:(id)columns where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)searchWithWhere:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)searchWithWhere:(id)where llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)searchWithSQL:(NSString *)sql llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)searchSingleWithWhere:(id)where orderBy:(NSString *)orderBy llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)insertToDB:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)insertWhenNotExists:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)updateToDB:(NSObject *)model where:(id)where   llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)updateToDBWithSet:(NSString *)sets where:(id)where   llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)deleteToDB:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)deleteWithWhere:(id)where   llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)isExistsWithModel:(NSObject *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateToDBLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)saveToDBLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deleteToDBLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isExistsFromDBLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)insertArrayByAsyncToDB:(NSArray *)models llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)insertArrayByAsyncToDB:(NSArray *)models completed:(void (^_Nullable)(BOOL))completedBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)insertToDBWithArray:(NSArray *)models filter:(void (^)(id model, BOOL inserted, BOOL *rollback))filter llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)insertToDBWithArray:(NSArray *)models filter:(void (^)(id model, BOOL inserted, BOOL *rollback))filter completed:(void (^)(BOOL))completedBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
