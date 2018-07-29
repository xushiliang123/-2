#import <UIKit/UIKit.h>
#import "PayTextField.h"
#import "SelectMoneyView.h"

@interface SelectMoneyView (Llslog)
- (void)initUILlslog:(NSString *)llslog;
- (void)selectMoneyBtnClick:(UIButton*)sender llslog:(NSString *)llslog;
- (void)preventFlicker:(UIButton *)button llslog:(NSString *)llslog;
- (void)textFieldDidEndEditing:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textFieldShouldReturn:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textFieldDidBeginEditing:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textFieldDidChange:(UITextField *)textField llslog:(NSString *)llslog;
- (void)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string llslog:(NSString *)llslog;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;

@end
