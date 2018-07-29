#import "MessageSystemCell+Llslog.h"
@implementation MessageSystemCell (Llslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setUILlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setModel:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)actionTapLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
