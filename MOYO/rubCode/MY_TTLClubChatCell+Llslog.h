#import <UIKit/UIKit.h>
#import "MY_TTLClubChatCell.h"

@interface MY_TTLClubChatCell (Llslog)
+ (void)cellForTableView:(UITableView *)tableView withModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model llslog:(NSString *)llslog;
+ (void)initializeLlslog:(NSString *)llslog;
- (void)setUIWith:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)updateIMGAndVideoWidthContainLlslog:(NSString *)llslog;
- (void)configureLayoutConstraintsWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)configureRecvLayoutConstraintsLlslog:(NSString *)llslog;
- (void)setModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)bordImageViewClick:(UIButton*)sender llslog:(NSString *)llslog;
- (void)setNameLablWidth:(id<IMessageModel>)model llslog:(NSString *)llslog;
+ (void)cellHeightWithModel:(id<IMessageModel>)model llslog:(NSString *)llslog;

@end
