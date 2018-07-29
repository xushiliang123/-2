#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"
#import "YYClassInfo.h"
#import <objc/message.h>

@interface NSObject (YYModelLlslog)
+ (void)_yy_dictionaryWithJSON:(id)json llslog:(NSString *)llslog;
+ (void)modelWithJSON:(id)json llslog:(NSString *)llslog;
+ (void)modelWithDictionary:(NSDictionary *)dictionary llslog:(NSString *)llslog;
- (void)modelSetWithJSON:(id)json llslog:(NSString *)llslog;
- (void)modelSetWithDictionary:(NSDictionary *)dic llslog:(NSString *)llslog;
- (void)modelToJSONObjectLlslog:(NSString *)llslog;
- (void)modelToJSONDataLlslog:(NSString *)llslog;
- (void)modelToJSONStringLlslog:(NSString *)llslog;
- (void)modelCopyLlslog:(NSString *)llslog;
- (void)modelEncodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)modelInitWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)modelHashLlslog:(NSString *)llslog;
- (void)modelIsEqual:(id)model llslog:(NSString *)llslog;
- (void)modelDescriptionLlslog:(NSString *)llslog;

@end
