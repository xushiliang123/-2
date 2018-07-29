#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "YYClassInfo.h"
#import <objc/runtime.h>

@interface YYClassIvarInfo (Llslog)
- (void)initWithIvar:(Ivar)ivar llslog:(NSString *)llslog;

@end
