#import <UIKit/UIKit.h>
#import "IQUIViewController+Additions.h"
#import <objc/runtime.h>

@interface UIViewController (AdditionsLlslog)
- (void)setIQLayoutGuideConstraint:(NSLayoutConstraint *)IQLayoutGuideConstraint llslog:(NSString *)llslog;
- (void)IQLayoutGuideConstraintLlslog:(NSString *)llslog;

@end
