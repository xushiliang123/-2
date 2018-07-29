#import <UIKit/UIKit.h>
#import "MY_LYTaskApplyModel.h"
#import "MY_GLTaskApplyTableViewCell.h"

@interface MY_GLTaskApplyTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)agreeButtonClick:(UIButton *)sender llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)setModel:(MY_LYTaskApplyModel *)model llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
