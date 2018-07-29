#import <UIKit/UIKit.h>
#import "MY_GLRedPacketView.h"
#import "RechargeViewController.h"

@interface MY_GLRedPacketView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)drawUILlslog:(NSString *)llslog;
- (void)requestAddStatusClickMethod:(UIButton*)seder llslog:(NSString *)llslog;
- (void)selectedUserStyleIndex2ClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)clickBackButton:(id)sender llslog:(NSString *)llslog;
- (void)textViewDidBeginEditing:(UITextView *)textView llslog:(NSString *)llslog;
- (void)textViewDidChange:(UITextView *)textView llslog:(NSString *)llslog;
- (void)goToRechargeButtonClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)sendRedPacketButtonClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)WXPAYSuccess:(NSNotification *)not llslog:(NSString *)llslog;
- (void)WXPAYERROR:(NSNotification *)not llslog:(NSString *)llslog;
- (void)textFieldShouldReturn:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textFieldDidBeginEditing:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textFieldDidEndEditing:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string llslog:(NSString *)llslog;
- (void)moneyTextFieldTextChange:(UITextField*)txf llslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)topViewControllerLlslog:(NSString *)llslog;
- (void)_topViewController:(UIViewController *)vc llslog:(NSString *)llslog;

@end
