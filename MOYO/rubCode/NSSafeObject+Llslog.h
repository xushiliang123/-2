#import <Foundation/Foundation.h>
#import "NSSafeObject.h"

@interface NSSafeObject (Llslog)
- (void)initWithObject:(id)object llslog:(NSString *)llslog;
- (void)initWithObject:(id)object withSelector:(SEL)selector llslog:(NSString *)llslog;
- (void)excuteLlslog:(NSString *)llslog;

@end
