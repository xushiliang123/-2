#import "BaseModel.h"
#import "SystemMarkModel.h"

@interface SystemMarkModel (Llslog)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog;

@end
