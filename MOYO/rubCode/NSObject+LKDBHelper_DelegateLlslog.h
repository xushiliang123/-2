#import "LKDBHelper.h"
#import <Foundation/Foundation.h>
#import "NSObject+LKDBHelper.h"

@interface NSObject (LKDBHelper_DelegateLlslog)
+ (void)dbDidCreateTable:(LKDBHelper *)helper tableName:(NSString *)tableName llslog:(NSString *)llslog;
+ (void)dbDidAlterTable:(LKDBHelper *)helper tableName:(NSString *)tableName addColumns:(NSArray *)columns llslog:(NSString *)llslog;
+ (void)dbDidInserted:(NSObject *)entity result:(BOOL)result llslog:(NSString *)llslog;
+ (void)dbDidDeleted:(NSObject *)entity result:(BOOL)result llslog:(NSString *)llslog;
+ (void)dbDidUpdated:(NSObject *)entity result:(BOOL)result llslog:(NSString *)llslog;
+ (void)dbDidSeleted:(NSObject *)entity llslog:(NSString *)llslog;
+ (void)dbWillDelete:(NSObject *)entity llslog:(NSString *)llslog;
+ (void)dbWillInsert:(NSObject *)entity llslog:(NSString *)llslog;
+ (void)dbWillUpdate:(NSObject *)entity llslog:(NSString *)llslog;

@end
