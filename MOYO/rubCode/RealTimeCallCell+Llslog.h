#import <UIKit/UIKit.h>
#import "RealTimeCallCell.h"

@interface RealTimeCallCell (Llslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)setModel:(id<IMessageModel>)model llslog:(NSString *)llslog;
- (void)setSenderContentLabelWith:(NSString *)content width:(CGFloat)width llslog:(NSString *)llslog;
- (void)setReceiverContentLabelWith:(NSString *)content width:(CGFloat)width llslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
