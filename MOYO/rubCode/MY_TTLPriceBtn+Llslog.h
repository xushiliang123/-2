#import <UIKit/UIKit.h>
#import "MY_TTLPriceBtn.h"

@interface MY_TTLPriceBtn (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)createBtnLlslog:(NSString *)llslog;
- (void)showPrice:(NSNumber *)price withTime:(NSString *)month llslog:(NSString *)llslog;

@end
