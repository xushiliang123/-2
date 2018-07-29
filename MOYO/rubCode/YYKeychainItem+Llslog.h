#import <Foundation/Foundation.h>
#import "YYKeychain.h"
#import "UIDevice+YYAdd.h"
#import "YYKitMacro.h"
#import <Security/Security.h>

@interface YYKeychainItem (Llslog)
- (void)setPasswordObject:(id <NSCoding> )object llslog:(NSString *)llslog;
- (void)passwordObjectLlslog:(NSString *)llslog;
- (void)setPassword:(NSString *)password llslog:(NSString *)llslog;
- (void)passwordLlslog:(NSString *)llslog;
- (void)queryDicLlslog:(NSString *)llslog;
- (void)dicLlslog:(NSString *)llslog;
- (void)initWithDic:(NSDictionary *)dic llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;

@end
