#import <UIKit/UIKit.h>
#import "LocationTableViewCell.h"

@interface LocationTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setCityArray:(NSArray *)cityArray llslog:(NSString *)llslog;
- (void)cityBtnClick:(UIButton *)cityBtn llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
