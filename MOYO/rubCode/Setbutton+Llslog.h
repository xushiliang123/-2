#import <UIKit/UIKit.h>
#import "Setbutton.h"

@interface Setbutton (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)setHighlighted:(BOOL)highlighted llslog:(NSString *)llslog;
- (void)imageRectForContentRect:(CGRect)contentRect llslog:(NSString *)llslog;
- (void)titleRectForContentRect:(CGRect)contentRect llslog:(NSString *)llslog;

@end
