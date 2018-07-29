#import "LKModelInfos+Llslog.h"
@implementation LKModelInfos (Llslog)
- (void)initWithKeyMapping:(NSDictionary *)keyMapping propertyNames:(NSArray *)propertyNames propertyType:(NSArray *)propertyType primaryKeys:(NSArray *)primaryKeys llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)addDBPropertyWithType:(NSString *)type cname:(NSString *)column_name ctype:(NSString *)ctype pname:(NSString *)pname ptype:(NSString *)ptype llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)primaryKeysLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)countLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectWithIndex:(NSInteger)index llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectWithPropertyName:(NSString *)propertyName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)objectWithSqlColumnName:(NSString *)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateProperty:(LKDBProperty *)property propertyName:(NSString *)propertyName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateProperty:(LKDBProperty *)property sqlColumnName:(NSString *)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeWithColumnName:(NSString *)columnName llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
