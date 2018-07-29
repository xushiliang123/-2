#import "NSObject+LKDBHelper_DelegateLlslog.h"
@implementation NSObject (LKDBHelper_DelegateLlslog)
+ (void)dbDidCreateTable:(LKDBHelper *)helper tableName:(NSString *)tableName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbDidAlterTable:(LKDBHelper *)helper tableName:(NSString *)tableName addColumns:(NSArray *)columns llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbDidInserted:(NSObject *)entity result:(BOOL)result llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbDidDeleted:(NSObject *)entity result:(BOOL)result llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbDidUpdated:(NSObject *)entity result:(BOOL)result llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbDidSeleted:(NSObject *)entity llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbWillDelete:(NSObject *)entity llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbWillInsert:(NSObject *)entity llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)dbWillUpdate:(NSObject *)entity llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
