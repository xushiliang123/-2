#import "MY_GLTaskApplyTableViewCell+Llslog.h"
@implementation MY_GLTaskApplyTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)agreeButtonClick:(UIButton *)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setModel:(MY_LYTaskApplyModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
