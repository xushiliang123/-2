#import <UIKit/UIKit.h>
#import "MY_GLShareView.h"
#import "ShareMenuItem.h"

@interface MY_GLShareView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame withDic:(NSDictionary *)bodyDic type:(NSInteger)type typeId:(NSNumber *)typeId sharetype:(NSInteger)sharetype llslog:(NSString *)llslog;
- (void)createShareLlslog:(NSString *)llslog;
- (void)createShareForPYQLlslog:(NSString *)llslog;
- (void)selectedIndex:(ShareMenuItem *)item llslog:(NSString *)llslog;
- (void)shareFinish:(NSString*)shareTp llslog:(NSString *)llslog;
- (void)dismissAlertLlslog:(NSString *)llslog;
- (void)showLlslog:(NSString *)llslog;
- (void)appRootViewControllerLlslog:(NSString *)llslog;
- (void)removeFromSuperviewLlslog:(NSString *)llslog;
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)hideShareClick:(UIButton *)btn llslog:(NSString *)llslog;

@end
