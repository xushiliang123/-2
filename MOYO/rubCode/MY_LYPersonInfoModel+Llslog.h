#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "ChineseString.h"
#import "MY_LYPersonInfoModel.h"

@interface MY_LYPersonInfoModel (Llslog)
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog;
+ (void)getTableNameLlslog:(NSString *)llslog;
+ (void)getPrimaryKeyLlslog:(NSString *)llslog;

@end
