#import "MY_GLClubListTableViewCell+Llslog.h"
@implementation MY_GLClubListTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setModel:(MY_GLClubModel *)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
