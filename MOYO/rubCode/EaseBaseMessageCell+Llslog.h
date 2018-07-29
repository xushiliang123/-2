#import "EaseMessageCell.h"
#import "EaseBaseMessageCell.h"
#import "UIImageView+WebCache.h"

@interface EaseBaseMessageCell (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                        model:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)updateIMGAndVideoWidthContainLlslog:(NSString *)llslog;
- (void)configureLayoutConstraintsWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)configureSendLayoutConstraintsLlslog:(NSString *)llslog;
- (void)configureRecvLayoutConstraintsLlslog:(NSString *)llslog;
- (void)_updateAvatarViewWidthConstraintLlslog:(NSString *)llslog;
- (void)_updateNameHeightConstraintLlslog:(NSString *)llslog;
- (void)setModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)setMessageNameFont:(UIFont *)messageNameFont llslog:(NSString *)llslog;
- (void)setMessageNameColor:(UIColor *)messageNameColor llslog:(NSString *)llslog;
- (void)setMessageNameHeight:(CGFloat)messageNameHeight llslog:(NSString *)llslog;
- (void)setAvatarSize:(CGFloat)avatarSize llslog:(NSString *)llslog;
- (void)setAvatarCornerRadius:(CGFloat)avatarCornerRadius llslog:(NSString *)llslog;
- (void)setMessageNameIsHidden:(BOOL)messageNameIsHidden llslog:(NSString *)llslog;
+ (void)cellHeightWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog;

@end
