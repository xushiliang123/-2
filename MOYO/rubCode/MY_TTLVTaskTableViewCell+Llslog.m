#import "MY_TTLVTaskTableViewCell+Llslog.h"
@implementation MY_TTLVTaskTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)createCellLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)watchBtnClickLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)showData:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
