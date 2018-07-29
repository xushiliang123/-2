#import "LKDBHelper.h"
#import <Foundation/Foundation.h>
#import "NSObject+LKDBHelper.h"

@interface NSObject (LKDBHelperLlslog)
+ (void)checkModelClass:(NSObject *)model llslog:(NSString *)llslog;
+ (void)rowCountWithWhereFormat:(id)where  llslog:(NSString *)llslog;
+ (void)rowCountWithWhere:(id)where  llslog:(NSString *)llslog;
+ (void)searchColumn:(id)columns where:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog;
+ (void)searchWithWhere:(id)where orderBy:(NSString *)orderBy offset:(NSInteger)offset count:(NSInteger)count llslog:(NSString *)llslog;
+ (void)searchWithWhere:(id)where llslog:(NSString *)llslog;
+ (void)searchWithSQL:(NSString *)sql llslog:(NSString *)llslog;
+ (void)searchSingleWithWhere:(id)where orderBy:(NSString *)orderBy llslog:(NSString *)llslog;
+ (void)insertToDB:(NSObject *)model llslog:(NSString *)llslog;
+ (void)insertWhenNotExists:(NSObject *)model llslog:(NSString *)llslog;
+ (void)updateToDB:(NSObject *)model where:(id)where llslog:(NSString *)llslog;
+ (void)updateToDBWithSet:(NSString *)sets where:(id)where llslog:(NSString *)llslog;
+ (void)deleteToDB:(NSObject *)model llslog:(NSString *)llslog;
+ (void)deleteWithWhere:(id)where llslog:(NSString *)llslog;
+ (void)isExistsWithModel:(NSObject *)model llslog:(NSString *)llslog;
- (void)updateToDBLlslog:(NSString *)llslog;
- (void)saveToDBLlslog:(NSString *)llslog;
- (void)deleteToDBLlslog:(NSString *)llslog;
- (void)isExistsFromDBLlslog:(NSString *)llslog;
+ (void)insertArrayByAsyncToDB:(NSArray *)models llslog:(NSString *)llslog;
+ (void)insertArrayByAsyncToDB:(NSArray *)models completed:(void (^_Nullable)(BOOL))completedBlock llslog:(NSString *)llslog;
+ (void)insertToDBWithArray:(NSArray *)models filter:(void (^)(id model, BOOL inserted, BOOL *rollback))filter llslog:(NSString *)llslog;
+ (void)insertToDBWithArray:(NSArray *)models filter:(void (^)(id model, BOOL inserted, BOOL *rollback))filter completed:(void (^)(BOOL))completedBlock llslog:(NSString *)llslog;

@end
