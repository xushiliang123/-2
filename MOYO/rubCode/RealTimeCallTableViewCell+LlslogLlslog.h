#import "EaseUI.h"
#import "RealTimeCallTableViewCell.h"
#import "RealTimeCallModel.h"
#import "RealTimeCallTableViewCell+Llslog.h"

@interface RealTimeCallTableViewCell (LlslogLlslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)isCustomBubbleView:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setCustomModel:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setCustomBubbleView:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)updateCustomBubbleViewMargin:(UIEdgeInsets)bubbleMargin model:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
+ (void)cellIdentifierWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
+ (void)cellHeightWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)setModel:(id<IMessageModel>)model llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)addRealTimeCallMeassageWithMessage:(NSString *)message ext:(NSDictionary *)ext llslog:(NSString *)llslog llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog llslog:(NSString *)llslog;

@end
