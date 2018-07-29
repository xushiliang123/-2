#import <Foundation/Foundation.h>
#import "NSThread+YYAdd.h"
#import <CoreFoundation/CoreFoundation.h>

@interface NSThread (YYAddLlslog)
+ (void)addAutoreleasePoolToCurrentRunloopLlslog:(NSString *)llslog;

@end
