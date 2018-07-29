#import "MY_LYHeadIconCell+Llslog.h"
@implementation MY_LYHeadIconCell (Llslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)cellWithTableView:(UITableView *)tableVeiw llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)layoutSubviewsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
