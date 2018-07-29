#import <UIKit/UIKit.h>
#import "IConversationModel.h"
#import "IModelCell.h"
#import "EaseImageView.h"
#import "EaseConversationCell.h"
//#import <HyphenateLite/EMConversation.h>
#import <Hyphenate/EMConversation.h>
#import "UIImageView+WebCache.h"

@interface EaseConversationCell (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)_setupSubviewLlslog:(NSString *)llslog;
- (void)_setupAvatarViewConstraintsLlslog:(NSString *)llslog;
- (void)_setupTimeLabelConstraintsLlslog:(NSString *)llslog;
- (void)_setupTitleLabelConstraintsLlslog:(NSString *)llslog;
- (void)_setupVipLabelConstraintsLlslog:(NSString *)llslog;
- (void)_setupDetailLabelConstraintsLlslog:(NSString *)llslog;
- (void)setShowAvatar:(BOOL)showAvatar llslog:(NSString *)llslog;
- (void)setModel:(id<IConversationModel>)model llslog:(NSString *)llslog;
- (void)setTitleLabelFont:(UIFont *)titleLabelFont llslog:(NSString *)llslog;
- (void)setTitleLabelColor:(UIColor *)titleLabelColor llslog:(NSString *)llslog;
- (void)setDetailLabelFont:(UIFont *)detailLabelFont llslog:(NSString *)llslog;
- (void)setDetailLabelColor:(UIColor *)detailLabelColor llslog:(NSString *)llslog;
- (void)setTimeLabelFont:(UIFont *)timeLabelFont llslog:(NSString *)llslog;
- (void)setTimeLabelColor:(UIColor *)timeLabelColor llslog:(NSString *)llslog;
+ (void)cellIdentifierWithModel:(id)model llslog:(NSString *)llslog;
+ (void)cellHeightWithModel:(id)model llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated llslog:(NSString *)llslog;
+ (void)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha llslog:(NSString *)llslog;

@end
