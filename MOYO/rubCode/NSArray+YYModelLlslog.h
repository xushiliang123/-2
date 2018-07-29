#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"
#import "YYClassInfo.h"
#import <objc/message.h>

@interface NSArray (YYModelLlslog)
+ (void)modelArrayWithClass:(Class)cls json:(id)json llslog:(NSString *)llslog;
+ (void)modelArrayWithClass:(Class)cls array:(NSArray *)arr llslog:(NSString *)llslog;

@end
