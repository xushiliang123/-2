#import <UIKit/UIKit.h>
#import "LMJTab.h"

@interface LMJTab (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor llslog:(NSString *)llslog;
- (void)setItemsWithTitle:(NSArray *)titles normalItemColor:(UIColor *)nItemColor selectItemColor:(UIColor *)sItemColor normalTitleColor:(UIColor *)nTitleColor selectTitleColor:(UIColor *)sTitleColor titleTextSize:(CGFloat)size selectItemNumber:(NSInteger)number llslog:(NSString *)llslog;
- (void)clickedButton:(UIButton *)button llslog:(NSString *)llslog;

@end
