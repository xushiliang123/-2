#import <UIKit/UIKit.h>
#import "MY_GLBaPingView.h"

@interface MY_GLBaPingView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initContentLlslog:(NSString *)llslog;
- (void)loadMaskViewLlslog:(NSString *)llslog;
- (void)loadMoneyWith:(NSArray *)moneyArr llslog:(NSString *)llslog;
- (void)showInView:(UIView *)view llslog:(NSString *)llslog;
- (void)disMissViewLlslog:(NSString *)llslog;
- (void)btn_click:(id)sender llslog:(NSString *)llslog;
- (void)btn2_click:(id)sender llslog:(NSString *)llslog;
- (void)BuyBaPing:(id)sender llslog:(NSString *)llslog;
- (void)addButtonAction:(ButtonBlock)block llslog:(NSString *)llslog;
- (void)addButtonAction1:(ButtonBlock1)block llslog:(NSString *)llslog;
- (void)UploadImg:(id)sender llslog:(NSString *)llslog;
- (void)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string llslog:(NSString *)llslog;
- (void)textFieldEditChanged:(UITextField *)textField llslog:(NSString *)llslog;
- (void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer llslog:(NSString *)llslog;

@end
