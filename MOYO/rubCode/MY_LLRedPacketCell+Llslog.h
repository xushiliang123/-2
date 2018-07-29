#import <UIKit/UIKit.h>
#import "MY_LLRedPacketCell.h"
#import "MY_LYMessageInfoModel.h"

@interface MY_LLRedPacketCell (Llslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)setMessageData:(id<IMessageModel>)model withUserId:(NSString *)userId llslog:(NSString *)llslog;
- (void)btnClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
