#import "MY_GLMainTopicTableViewCell+Llslog.h"
@implementation MY_GLMainTopicTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setUIWithArray:(NSArray *)imageArray llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)addBedeView:(HeadBtn*)btn llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)btnClick:(UIButton *)btn llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
