#import <UIKit/UIKit.h>
#import "MY_TTLPacketRecordModel.h"
#import "MY_TTLPacketRecordTableViewCell.h"

@interface MY_TTLPacketRecordTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)showData:(MY_TTLPacketRecordModel *)model llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
