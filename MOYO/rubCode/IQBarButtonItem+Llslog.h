#import <UIKit/UIBarButtonItem.h>
#import "IQBarButtonItem.h"
#import "IQKeyboardManagerConstantsInternal.h"

@interface IQBarButtonItem (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(nullable id)target action:(nullable SEL)action llslog:(NSString *)llslog;
- (void)setTarget:(nullable id)target action:(nullable SEL)action llslog:(NSString *)llslog;

@end
