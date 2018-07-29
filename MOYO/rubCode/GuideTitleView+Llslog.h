#import <UIKit/UIKit.h>
#import "GuideTitleView.h"

@interface GuideTitleView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setGuideWithTitle:(NSArray*)titles llslog:(NSString *)llslog;
- (void)clickButton:(UIButton*)sender llslog:(NSString *)llslog;
- (void)changeSelectedIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)getCurrentSelectedIndexLlslog:(NSString *)llslog;
- (void)changeCurrentSelectedIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)hideRedPoint:(BOOL)ishide llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;

@end
