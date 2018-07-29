#import <UIKit/UIKit.h>
#import "MY_LLSexConsumerView.h"

@interface MY_LLSexConsumerView (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)coder llslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)setSex:(NSInteger)sex age:(NSInteger)age vip:(NSInteger)vip llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;

@end
