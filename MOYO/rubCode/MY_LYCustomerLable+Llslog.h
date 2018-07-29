#import <UIKit/UIKit.h>
#import "MY_LYCustomerLable.h"

@interface MY_LYCustomerLable (Llslog)
- (void)setVerticalAlignment:(myVerticalAlignment)verticalAlignment llslog:(NSString *)llslog;
- (void)drawTextInRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines llslog:(NSString *)llslog;

@end
