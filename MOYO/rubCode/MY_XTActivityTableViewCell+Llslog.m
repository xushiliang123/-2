#import "MY_XTActivityTableViewCell+Llslog.h"
@implementation MY_XTActivityTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)closeTask:(UIButton *)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)attendNumber:(UIButton *)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setValueWithModel:(MY_LYTaskListModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
