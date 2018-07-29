#import <UIKit/UIKit.h>
#import "IMessageModel.h"
#import "EaseBubbleView.h"
#import "MY_TTLFullScreenPhotoCell.h"
#import "EaseBubbleView+Text.h"
#import "EaseBubbleView+Image.h"
#import "EaseBubbleView+Location.h"
#import "EaseBubbleView+Voice.h"
#import "EaseBubbleView+Video.h"
#import "EaseBubbleView+File.h"
#import "UIImageView+WebCache.h"
#import "EaseEmotionEscape.h"
#import "EaseLocalDefine.h"

@interface MY_TTLFullScreenPhotoCell (Llslog)
+ (void)cellForTableView:(UITableView *)tableView withModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model llslog:(NSString *)llslog;
+ (void)initializeLlslog:(NSString *)llslog;
- (void)setUIWith:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)configureLayoutConstraintsWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)configureRecvLayoutConstraintsLlslog:(NSString *)llslog;
- (void)_updateBubbleMaxWidthConstraintLlslog:(NSString *)llslog;
- (void)setModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)setNameLablWidth:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)setAvatarCornerRadius:(CGFloat)avatarCornerRadius llslog:(NSString *)llslog;
- (void)bubbleViewTapAction:(UITapGestureRecognizer *)tapRecognizer llslog:(NSString *)llslog;
- (void)avatarViewTapAction:(UITapGestureRecognizer *)tapRecognizer llslog:(NSString *)llslog;
- (void)statusActionLlslog:(NSString *)llslog;
- (void)setSendBubbleBackgroundImage:(UIImage *)sendBubbleBackgroundImage llslog:(NSString *)llslog;
- (void)setRecvBubbleBackgroundImage:(UIImage *)recvBubbleBackgroundImage llslog:(NSString *)llslog;
- (void)setBubbleMaxWidth:(CGFloat)bubbleMaxWidth llslog:(NSString *)llslog;
- (void)setRightBubbleMargin:(UIEdgeInsets)rightBubbleMargin llslog:(NSString *)llslog;
- (void)setLeftBubbleMargin:(UIEdgeInsets)leftBubbleMargin llslog:(NSString *)llslog;
- (void)setBubbleMargin:(UIEdgeInsets)bubbleMargin llslog:(NSString *)llslog;
- (void)setMessageTextFont:(UIFont *)messageTextFont llslog:(NSString *)llslog;
- (void)setMessageTextColor:(UIColor *)messageTextColor llslog:(NSString *)llslog;
+ (void)cellHeightWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)LongPoint:(UILongPressGestureRecognizer *)lgz llslog:(NSString *)llslog;

@end
