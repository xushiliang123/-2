#import <UIKit/UIKit.h>
#import "MY_TTLIncomeChooseView.h"

@interface MY_TTLIncomeChooseView (Llslog)
- (void)initWithFrame:(CGRect)frame withChoose:(NSInteger)page llslog:(NSString *)llslog;
- (void)createUILlslog:(NSString *)llslog;
- (void)mapBtnClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)dismissAlertLlslog:(NSString *)llslog;
- (void)showLlslog:(NSString *)llslog;
- (void)appRootViewControllerLlslog:(NSString *)llslog;
- (void)removeFromSuperviewLlslog:(NSString *)llslog;
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)hideShareClick:(UIButton *)btn llslog:(NSString *)llslog;

@end
