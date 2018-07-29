#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EAIntroPage.h"

@interface EAIntroPage (Llslog)
- (void)initLlslog:(NSString *)llslog;
+ (void)pageLlslog:(NSString *)llslog;
+ (void)pageWithCustomView:(UIView *)customV llslog:(NSString *)llslog;
+ (void)pageWithCustomViewFromNibNamed:(NSString *)nibName llslog:(NSString *)llslog;
+ (void)pageWithCustomViewFromNibNamed:(NSString *)nibName bundle:(NSBundle*)aBundle llslog:(NSString *)llslog;

@end
