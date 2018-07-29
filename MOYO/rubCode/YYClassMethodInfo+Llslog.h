#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "YYClassInfo.h"
#import <objc/runtime.h>

@interface YYClassMethodInfo (Llslog)
- (void)initWithMethod:(Method)method llslog:(NSString *)llslog;

@end
