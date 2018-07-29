#import <UIKit/UIKit.h>
#import "MY_GLHomeAddStatusView.h"

@interface MY_GLHomeAddStatusView (Llslog)
- (void)initWithFrame:(CGRect)frame withInstroduce:(BOOL)isInstro llslog:(NSString *)llslog;
- (void)setUpInstroUILlslog:(NSString *)llslog;
- (void)setUpStatusUILlslog:(NSString *)llslog;
- (void)selectedClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)requestAddStatusClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)selectedUserStyleIndex2ClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;

@end
