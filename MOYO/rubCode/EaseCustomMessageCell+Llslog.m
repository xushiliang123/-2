#import "EaseCustomMessageCell+Llslog.h"
@implementation EaseCustomMessageCell (Llslog)
+ (void)initializeLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setIsGroupChat:(BOOL)isGroupChat llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isCustomBubbleView:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setCustomModel:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setCustomBubbleView:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)updateCustomBubbleViewMargin:(UIEdgeInsets)bubbleMargin model:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)cellIdentifierWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)cellHeightWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
