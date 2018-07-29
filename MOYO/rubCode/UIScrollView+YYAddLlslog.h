#import <UIKit/UIKit.h>
#import "UIScrollView+YYAdd.h"
#import "YYKitMacro.h"

@interface UIScrollView (YYAddLlslog)
- (void)scrollToTopLlslog:(NSString *)llslog;
- (void)scrollToBottomLlslog:(NSString *)llslog;
- (void)scrollToLeftLlslog:(NSString *)llslog;
- (void)scrollToRightLlslog:(NSString *)llslog;
- (void)scrollToTopAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)scrollToBottomAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)scrollToLeftAnimated:(BOOL)animated llslog:(NSString *)llslog;
- (void)scrollToRightAnimated:(BOOL)animated llslog:(NSString *)llslog;

@end
