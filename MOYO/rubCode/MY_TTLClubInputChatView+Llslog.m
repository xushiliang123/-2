#import "MY_TTLClubInputChatView+Llslog.h"
@implementation MY_TTLClubInputChatView (Llslog)
- (void)initWithFrame:(CGRect)frame
                         type:(EMChatToolbarType)type llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setupMySubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)photoButtonAction:(UIButton*)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)messButtonAction:(UIButton*)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)faceButtonAction:(id)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
