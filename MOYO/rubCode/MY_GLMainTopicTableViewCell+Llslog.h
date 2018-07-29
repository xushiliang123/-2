#import <UIKit/UIKit.h>
#import "MY_GLMainTopicTableViewCell.h"
#import "HeadBtn.h"

@interface MY_GLMainTopicTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)setUIWithArray:(NSArray *)imageArray llslog:(NSString *)llslog;
- (void)addBedeView:(HeadBtn*)btn llslog:(NSString *)llslog;
- (void)btnClick:(UIButton *)btn llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
