#import <Foundation/Foundation.h>
#import "YYTransaction.h"

@interface YYTransaction (Llslog)
+ (void)transactionWithTarget:(id)target selector:(SEL)selector llslog:(NSString *)llslog;
- (void)commitLlslog:(NSString *)llslog;
- (void)hashLlslog:(NSString *)llslog;
- (void)isEqual:(id)object llslog:(NSString *)llslog;

@end
