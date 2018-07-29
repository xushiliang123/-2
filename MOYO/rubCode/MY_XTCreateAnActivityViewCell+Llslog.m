#import "MY_XTCreateAnActivityViewCell+Llslog.h"
@implementation MY_XTCreateAnActivityViewCell (Llslog)
- (void)awakeFromNibLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textViewDidBeginEditing:(UITextView *)textView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textViewDidChange:(UITextView *)textView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)textViewDidEndEditing:(UITextView *)textView llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
