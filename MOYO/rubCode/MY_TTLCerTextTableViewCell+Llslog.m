#import "MY_TTLCerTextTableViewCell+Llslog.h"
@implementation MY_TTLCerTextTableViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textViewDidChange:(UITextView *)textView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textViewDidEndEditing:(UITextView *)textView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
