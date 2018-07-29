#import "LKDBUtils.h"
#import "LKDB+Mapping.h"
#import "NSObject+LKModel.h"

@interface LKModelInfos (Llslog)
- (void)initWithKeyMapping:(NSDictionary *)keyMapping propertyNames:(NSArray *)propertyNames propertyType:(NSArray *)propertyType primaryKeys:(NSArray *)primaryKeys llslog:(NSString *)llslog;
- (void)addDBPropertyWithType:(NSString *)type cname:(NSString *)column_name ctype:(NSString *)ctype pname:(NSString *)pname ptype:(NSString *)ptype llslog:(NSString *)llslog;
- (void)primaryKeysLlslog:(NSString *)llslog;
- (void)countLlslog:(NSString *)llslog;
- (void)objectWithIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)objectWithPropertyName:(NSString *)propertyName llslog:(NSString *)llslog;
- (void)objectWithSqlColumnName:(NSString *)columnName llslog:(NSString *)llslog;
- (void)updateProperty:(LKDBProperty *)property propertyName:(NSString *)propertyName llslog:(NSString *)llslog;
- (void)updateProperty:(LKDBProperty *)property sqlColumnName:(NSString *)columnName llslog:(NSString *)llslog;
- (void)removeWithColumnName:(NSString *)columnName llslog:(NSString *)llslog;

@end
