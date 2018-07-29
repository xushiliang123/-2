#import <UIKit/UIKit.h>
#import "MY_LYTaskListModel.h"
#import "MY_XTActivityTableViewCell.h"

@interface MY_XTActivityTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)closeTask:(UIButton *)sender llslog:(NSString *)llslog;
- (void)attendNumber:(UIButton *)sender llslog:(NSString *)llslog;
- (void)setValueWithModel:(MY_LYTaskListModel *)model llslog:(NSString *)llslog;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end