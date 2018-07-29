#import <UIKit/UIKit.h>
#import "MyTableViewCell.h"

@interface MyTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)showBadgeViewLlslog:(NSString *)llslog;
- (void)hiddenBadgeViewLlslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
