#import "LMJTab+Llslog.h"
@implementation LMJTab (Llslog)
- (void)initLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setItemsWithTitle:(NSArray *)titles normalItemColor:(UIColor *)nItemColor selectItemColor:(UIColor *)sItemColor normalTitleColor:(UIColor *)nTitleColor selectTitleColor:(UIColor *)sTitleColor titleTextSize:(CGFloat)size selectItemNumber:(NSInteger)number llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)clickedButton:(UIButton *)button llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
