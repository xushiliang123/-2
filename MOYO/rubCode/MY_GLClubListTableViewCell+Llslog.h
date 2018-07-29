#import <UIKit/UIKit.h>
#import "MY_GLClubModel.h"
#import "MY_GLClubListTableViewCell.h"

@interface MY_GLClubListTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;
- (void)setModel:(MY_GLClubModel *)model llslog:(NSString *)llslog;

@end
