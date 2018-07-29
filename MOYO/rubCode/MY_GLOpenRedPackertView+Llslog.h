#import <UIKit/UIKit.h>
#import "MY_GLOpenRedPackertView.h"

@interface MY_GLOpenRedPackertView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setRedViewMoney:(NSString*)money withModel:(NSDictionary*)dic llslog:(NSString *)llslog;
- (void)setupUILlslog:(NSString *)llslog;
- (void)knownTaClickMethod:(UIButton*)sender llslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;

@end
