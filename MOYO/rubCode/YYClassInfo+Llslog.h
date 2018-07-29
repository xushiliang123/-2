#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "YYClassInfo.h"
#import <objc/runtime.h>

@interface YYClassInfo (Llslog)
- (void)initWithClass:(Class)cls llslog:(NSString *)llslog;
- (void)_updateLlslog:(NSString *)llslog;
- (void)setNeedUpdateLlslog:(NSString *)llslog;
- (void)needUpdateLlslog:(NSString *)llslog;
+ (void)classInfoWithClass:(Class)cls llslog:(NSString *)llslog;
+ (void)classInfoWithClassName:(NSString *)className llslog:(NSString *)llslog;

@end
