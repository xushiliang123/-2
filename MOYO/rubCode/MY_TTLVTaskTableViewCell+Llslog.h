#import <UIKit/UIKit.h>
#import "MY_TTLVTaskTableViewCell.h"

@interface MY_TTLVTaskTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)createCellLlslog:(NSString *)llslog;
- (void)watchBtnClickLlslog:(NSString *)llslog;
- (void)showData:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
