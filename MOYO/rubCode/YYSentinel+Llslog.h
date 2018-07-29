#import <Foundation/Foundation.h>
#import "YYSentinel.h"
#import <libkern/OSAtomic.h>

@interface YYSentinel (Llslog)
- (void)valueLlslog:(NSString *)llslog;
- (void)increaseLlslog:(NSString *)llslog;

@end
