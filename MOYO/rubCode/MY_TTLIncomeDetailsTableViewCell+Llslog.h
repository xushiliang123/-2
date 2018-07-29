#import <UIKit/UIKit.h>
#import "MY_TTLIncomeModel.h"
#import "MY_TTLIncomeDetailsTableViewCell.h"

@interface MY_TTLIncomeDetailsTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)showDetail:(MY_TTLIncomeModel *)model llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
