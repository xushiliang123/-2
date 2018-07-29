#import <UIKit/UIKit.h>
#import "LoginTipView.h"
#import "MY_LYMessageInfoModel.h"

@interface LoginTipView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)goInviteGril:(UIButton *)sender llslog:(NSString *)llslog;
- (void)goInviteMan:(UIButton *)sender llslog:(NSString *)llslog;
- (void)invitePersonal:(int)sex llslog:(NSString *)llslog;
- (void)shareFinish:(NSString*)shareType llslog:(NSString *)llslog;
- (void)closeTipsView:(UIButton *)sender llslog:(NSString *)llslog;

@end
