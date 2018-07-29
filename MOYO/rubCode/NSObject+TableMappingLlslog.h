#import "LKDBUtils.h"
#import "LKDB+Mapping.h"
#import "NSObject+LKModel.h"

@interface NSObject (TableMappingLlslog)
+ (void)getTableMappingLlslog:(NSString *)llslog;
+ (void)setUserCalculateForCN:(NSString *)columnName llslog:(NSString *)llslog;
+ (void)setUserCalculateForPTN:(NSString *)propertyTypeName llslog:(NSString *)llslog;
+ (void)setTableColumnName:(NSString *)columnName bindingPropertyName:(NSString *)propertyName llslog:(NSString *)llslog;
+ (void)removePropertyWithColumnNameArray:(NSArray *)columnNameArray llslog:(NSString *)llslog;
+ (void)removePropertyWithColumnName:(NSString *)columnName llslog:(NSString *)llslog;

@end
