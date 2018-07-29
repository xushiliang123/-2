#import <UIKit/UIKit.h>
#import <YYKit/YYTextAttribute.h>
#import <YYKit/YYTextInput.h>
#import "YYTextAttribute.h"
#import "YYTextInput.h"
#import "YYTextSelectionView.h"
#import "YYCGUtilities.h"
#import "YYWeakProxy.h"

@interface YYSelectionGrabber (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setDotDirection:(YYTextDirection)dotDirection llslog:(NSString *)llslog;
- (void)setColor:(UIColor *)color llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)touchRectLlslog:(NSString *)llslog;

@end
