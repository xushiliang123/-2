#import <Foundation/NSObjCRuntime.h>
#import "IQKeyboardManagerConstants.h"
#import "IQBarButtonItem.h"
#import "IQTitleBarButtonItem.h"
#import "IQKeyboardManagerConstants.h"
#import "IQKeyboardManagerConstantsInternal.h"
#import <UIKit/UILabel.h>
#import <UIKit/UIButton.h>

@interface IQTitleBarButtonItem (Llslog)
- (void)initWithTitle:(nullable NSString *)title llslog:(NSString *)llslog;
- (void)setTitleFont:(UIFont *)titleFont llslog:(NSString *)llslog;
- (void)setTitle:(NSString *)title llslog:(NSString *)llslog;
- (void)setSelectableTextColor:(UIColor*)selectableTextColor llslog:(NSString *)llslog;
- (void)setInvocation:(NSInvocation *)invocation llslog:(NSString *)llslog;

@end
