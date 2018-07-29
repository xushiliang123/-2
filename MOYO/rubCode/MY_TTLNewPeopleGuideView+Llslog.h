#import <UIKit/UIKit.h>
#import "MY_TTLNewPeopleGuideView.h"

@interface MY_TTLNewPeopleGuideView (Llslog)
- (void)initWithButtonFrame:(CGRect)btnFrame buttonImgName:(NSString *)btnName imgFrame:(CGRect)imgFrame guideImgName:(NSString *)imgName promptString:(NSString *)promptStr corneRadius:(NSUInteger)radius Alpha:(CGFloat)Alpha llslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)jumpActionLlslog:(NSString *)llslog;
- (void)cancelActionLlslog:(NSString *)llslog;
- (void)showLlslog:(NSString *)llslog;
- (void)dismissLlslog:(NSString *)llslog;
- (void)sureTapClick:(UITapGestureRecognizer *)tap llslog:(NSString *)llslog;

@end
