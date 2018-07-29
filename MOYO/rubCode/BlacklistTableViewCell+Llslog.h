#import <UIKit/UIKit.h>
#import "BlacklistTableViewCell.h"
#import "BlacklistModel.h"

@interface BlacklistTableViewCell (Llslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)createCellUILlslog:(NSString *)llslog;
- (void)testLlslog:(NSString *)llslog;
- (void)setModel:(BlacklistModel *)model llslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
