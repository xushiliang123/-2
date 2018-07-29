#import <UIKit/UIKit.h>
#import "MY_LLSystemMessageCell.h"

@interface MY_LLSystemMessageCell (Llslog)
- (void)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier llslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
