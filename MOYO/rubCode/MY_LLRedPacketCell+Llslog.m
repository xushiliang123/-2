#import "MY_LLRedPacketCell+Llslog.h"
@implementation MY_LLRedPacketCell (Llslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setUILlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setMessageData:(id<IMessageModel>)model withUserId:(NSString *)userId llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)btnClick:(UIButton *)btn llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
