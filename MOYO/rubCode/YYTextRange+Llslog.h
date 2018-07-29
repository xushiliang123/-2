#import <UIKit/UIKit.h>
#import "YYTextInput.h"
#import "YYKitMacro.h"

@interface YYTextRange (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)startLlslog:(NSString *)llslog;
- (void)endLlslog:(NSString *)llslog;
- (void)isEmptyLlslog:(NSString *)llslog;
- (void)asRangeLlslog:(NSString *)llslog;
+ (void)rangeWithRange:(NSRange)range llslog:(NSString *)llslog;
+ (void)rangeWithRange:(NSRange)range affinity:(YYTextAffinity)affinity llslog:(NSString *)llslog;
+ (void)rangeWithStart:(YYTextPosition *)start end:(YYTextPosition *)end llslog:(NSString *)llslog;
+ (void)defaultRangeLlslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;
- (void)descriptionLlslog:(NSString *)llslog;
- (void)hashLlslog:(NSString *)llslog;
- (void)isEqual:(YYTextRange *)object llslog:(NSString *)llslog;

@end
