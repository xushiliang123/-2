#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface BaseModel (Llslog)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog;

@end
