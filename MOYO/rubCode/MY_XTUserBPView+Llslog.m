#import "MY_XTUserBPView+Llslog.h"
@implementation MY_XTUserBPView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initContentLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)loadUserModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)animateOutLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)creatBackgroundView:(UIView *)view llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)dissMissPresentVCLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)btn_click:(UIButton *)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)choose:(UIButton *)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
