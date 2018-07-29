#import "MY_LYEvaluationCell+Llslog.h"
@implementation MY_LYEvaluationCell (Llslog)
+ (void)cellWithTableView:(UITableView *)tableVeiw llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setRating:(CGFloat)rating llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)ratingChanged:(float)newRating viewTag:(NSInteger)tag llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)layoutSubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
