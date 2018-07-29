#import <UIKit/UIKit.h>
#import "MY_XTUserBPView.h"

@interface MY_XTUserBPView (Llslog)
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initContentLlslog:(NSString *)llslog;
- (void)loadUserModel:(MY_LYPersonInfoModel *)model llslog:(NSString *)llslog;
- (void)animateOutLlslog:(NSString *)llslog;
- (void)creatBackgroundView:(UIView *)view llslog:(NSString *)llslog;
- (void)dissMissPresentVCLlslog:(NSString *)llslog;
- (void)btn_click:(UIButton *)sender llslog:(NSString *)llslog;
- (void)choose:(UIButton *)sender llslog:(NSString *)llslog;

@end
