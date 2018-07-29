#import <Foundation/Foundation.h>
#import "LKDBHelper.h"
#import "NSObject+LKModel.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@interface NSObject (LKModelLlslog)
+ (void)getUsingLKDBHelperLlslog:(NSString *)llslog;
+ (void)getTableNameLlslog:(NSString *)llslog;
+ (void)getPrimaryKeyLlslog:(NSString *)llslog;
+ (void)getPrimaryKeyUnionArrayLlslog:(NSString *)llslog;
+ (void)columnAttributeWithProperty:(LKDBProperty *)property llslog:(NSString *)llslog;
- (void)setRowid:(NSInteger)rowid llslog:(NSString *)llslog;
- (void)rowidLlslog:(NSString *)llslog;
- (void)setDb_tableName:(NSString *)db_tableName llslog:(NSString *)llslog;
- (void)db_tableNameLlslog:(NSString *)llslog;
- (void)db_insertingLlslog:(NSString *)llslog;
- (void)setDb_inserting:(BOOL)db_inserting llslog:(NSString *)llslog;
+ (void)getDBImagePathWithName:(NSString *)filename llslog:(NSString *)llslog;
+ (void)getDBDataPathWithName:(NSString *)filename llslog:(NSString *)llslog;
+ (void)getTableMappingLlslog:(NSString *)llslog;
+ (void)getModelDateFormatterLlslog:(NSString *)llslog;
- (void)modelGetValue:(LKDBProperty *)property llslog:(NSString *)llslog;
- (void)modelSetValue:(LKDBProperty *)property value:(NSString *)value llslog:(NSString *)llslog;
- (void)db_jsonObjectFromDictionary:(NSDictionary *)dic llslog:(NSString *)llslog;
- (void)db_jsonObjectFromArray:(NSArray *)array llslog:(NSString *)llslog;
- (void)db_jsonObjectWithObject:(id)obj llslog:(NSString *)llslog;
- (void)db_jsonObjectFromModel:(NSObject *)model llslog:(NSString *)llslog;
- (void)db_readInfoWithModel:(NSObject *)model class:(Class)clazz llslog:(NSString *)llslog;
- (void)db_jsonStringFromObject : (NSObject *)jsonObject llslog:(NSString *)llslog;
- (void)db_modelWithJsonValue:(id)value llslog:(NSString *)llslog;
- (void)db_objectWithArray:(NSArray *)array llslog:(NSString *)llslog;
- (void)db_objectWithDictionary:(NSDictionary *)dic llslog:(NSString *)llslog;
- (void)setNilValueForKey:(NSString *)key llslog:(NSString *)llslog;
- (void)valueForUndefinedKey:(NSString *)key llslog:(NSString *)llslog;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog;
- (void)userSetValueForModel:(LKDBProperty *)property value:(id)value llslog:(NSString *)llslog;
- (void)userGetValueForModel:(LKDBProperty *)property llslog:(NSString *)llslog;
- (void)db_getPrimaryKeysValuesLlslog:(NSString *)llslog;
- (void)singlePrimaryKeyValueIsEmptyLlslog:(NSString *)llslog;
- (void)singlePrimaryKeyPropertyLlslog:(NSString *)llslog;
- (void)singlePrimaryKeyValueLlslog:(NSString *)llslog;
+ (void)db_rowidAliasNameLlslog:(NSString *)llslog;
+ (void)getModelInfosLlslog:(NSString *)llslog;
+ (void)isContainParentLlslog:(NSString *)llslog;
+ (void)isContainSelfLlslog:(NSString *)llslog;
+ (void)getSelfPropertys:(NSMutableArray *)pronames protypes:(NSMutableArray *)protypes llslog:(NSString *)llslog;
- (void)getAllPropertysStringLlslog:(NSString *)llslog;
- (void)printAllPropertysLlslog:(NSString *)llslog;
- (void)printAllPropertysIsContainParent:(BOOL)containParent llslog:(NSString *)llslog;
- (void)mutableString:(NSMutableString *)sb appendPropertyStringWithClass:(Class)clazz containParent:(BOOL)containParent llslog:(NSString *)llslog;

@end
