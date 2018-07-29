#import <UIKit/UIKit.h>
#import "MY_TTLCerTextTableViewCell.h"

@interface MY_TTLCerTextTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)textViewDidChange:(UITextView *)textView llslog:(NSString *)llslog;
- (void)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text llslog:(NSString *)llslog;
- (void)textViewDidEndEditing:(UITextView *)textView llslog:(NSString *)llslog;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog;

@end
