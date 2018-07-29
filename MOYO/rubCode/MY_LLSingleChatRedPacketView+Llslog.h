#import <UIKit/UIKit.h>
#import "MY_LLSingleChatRedPacketView.h"

@interface MY_LLSingleChatRedPacketView (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)showLlslog:(NSString *)llslog;
- (void)appRootViewControllerLlslog:(NSString *)llslog;
- (void)removeFromSuperviewLlslog:(NSString *)llslog;
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)getTotelMoneyRequestLlslog:(NSString *)llslog;
- (void)dismissAlertLlslog:(NSString *)llslog;
- (void)redPaceketBtnClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)bottomBtnClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)sendHongBao:(CGFloat)price llslog:(NSString *)llslog;
- (void)sendChatHongBao:(CGFloat)price llslog:(NSString *)llslog;
- (void)sendRedPacketDynamic:(CGFloat)price llslog:(NSString *)llslog;
- (void)setBigTitle:(NSString *)bigTitle llslog:(NSString *)llslog;
- (void)setDetailTitle:(NSString *)detailTitle llslog:(NSString *)llslog;
- (void)textFieldShouldBeginEditing:(UITextField *)textField llslog:(NSString *)llslog;

@end
