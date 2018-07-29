#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "YYClassInfo.h"
#import <objc/runtime.h>

@interface YYClassPropertyInfo (Llslog)
- (void)initWithProperty:(objc_property_t)property llslog:(NSString *)llslog;

@end
