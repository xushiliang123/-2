#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"
#import "YYClassInfo.h"
#import <objc/message.h>

@interface NSDictionary (YYModelLlslog)
+ (void)modelDictionaryWithClass:(Class)cls json:(id)json llslog:(NSString *)llslog;
+ (void)modelDictionaryWithClass:(Class)cls dictionary:(NSDictionary *)dic llslog:(NSString *)llslog;

@end
