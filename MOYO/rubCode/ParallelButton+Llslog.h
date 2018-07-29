#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "ParallelButton.h"

@interface ParallelButton (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)setTitle:(NSString *)title llslog:(NSString *)llslog;
- (void)setTitleFont:(UIFont *)titleFont llslog:(NSString *)llslog;
- (void)setTitleColor:(UIColor *)titleColor llslog:(NSString *)llslog;
- (void)setSpace:(CGFloat)space llslog:(NSString *)llslog;
- (void)setImageWidth:(CGFloat)imageWidth llslog:(NSString *)llslog;
- (void)setImageHeight:(CGFloat)imageHeight llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;

@end
