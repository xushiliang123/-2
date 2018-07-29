#import "EaseBaseMessageCell.h"
#import "EaseCustomMessageCell.h"
#import "EaseBubbleView+Gif.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"
#import "IMessageModel.h"

@interface EaseCustomMessageCell (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)setIsGroupChat:(BOOL)isGroupChat llslog:(NSString *)llslog;
- (void)isCustomBubbleView:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)setCustomModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)setCustomBubbleView:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)updateCustomBubbleViewMargin:(UIEdgeInsets)bubbleMargin model:(id<IMessageModel>)model llslog:(NSString *)llslog;
+ (void)cellIdentifierWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
+ (void)cellHeightWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog;

@end
