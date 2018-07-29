#import <UIKit/UIKit.h>
#import "YYTextInput.h"
#import "YYKitMacro.h"

@interface YYTextPosition (Llslog)
+ (void)positionWithOffset:(NSInteger)offset llslog:(NSString *)llslog;
+ (void)positionWithOffset:(NSInteger)offset affinity:(YYTextAffinity)affinity llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;
- (void)hashLlslog:(NSString *)llslog;
- (void)isEqual:(YYTextPosition *)object llslog:(NSString *)llslog;
- (void)compare:(YYTextPosition *)otherPosition llslog:(NSString *)llslog;

@end
