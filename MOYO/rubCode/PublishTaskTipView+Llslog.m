#import "PublishTaskTipView+Llslog.h"
@implementation PublishTaskTipView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)gotoBecomeGZBtn:(UIButton *)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)gotoUpHomePage:(UIButton *)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)invitedFriends:(UIButton *)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end