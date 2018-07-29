#import <UIKit/UIKit.h>
#import "MY_TTLMeModel.h"
#import "MY_LLSexConsumerView.h"
#import "MY_TTLMyHeaderTableViewCell.h"

@interface MY_TTLMyHeaderTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)showData:(MY_TTLMeModel *)model llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
