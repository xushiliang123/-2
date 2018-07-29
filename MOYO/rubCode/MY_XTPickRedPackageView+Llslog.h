#import <UIKit/UIKit.h>
#import "MY_XTPickRedPackageView.h"

@interface MY_XTPickRedPackageView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initContentLlslog:(NSString *)llslog;
- (void)showInView:(UIView *)view llslog:(NSString *)llslog;
- (void)disMissViewLlslog:(NSString *)llslog;
- (void)btn_click:(UIButton *)Btn llslog:(NSString *)llslog;
- (void)textFieldDidChange:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textFieldDidEndEditing:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string llslog:(NSString *)llslog;

@end
