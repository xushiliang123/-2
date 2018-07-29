#import "LocationTableViewCell+Llslog.h"
@implementation LocationTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setCityArray:(NSArray *)cityArray llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)cityBtnClick:(UIButton *)cityBtn llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
