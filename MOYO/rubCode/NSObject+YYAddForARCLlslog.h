#import <Foundation/Foundation.h>
#import "NSObject+YYAddForARC.h"

@interface NSObject (YYAddForARCLlslog)
- (void)arcDebugRetainLlslog:(NSString *)llslog;
- (void)arcDebugReleaseLlslog:(NSString *)llslog;
- (void)arcDebugAutoreleaseLlslog:(NSString *)llslog;
- (void)arcDebugRetainCountLlslog:(NSString *)llslog;

@end
