#import "IQKeyboardManagerConstants.h"
#import <UIKit/UITextView.h>
#import "IQTextView.h"
#import <UIKit/NSTextContainer.h>
#import <UIKit/UILabel.h>
#import <UIKit/UINibLoading.h>

@interface IQTextView (Llslog)
- (void)initializeLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)awakeFromNibLlslog:(NSString *)llslog;
- (void)refreshPlaceholderLlslog:(NSString *)llslog;
- (void)setText:(NSString *)text llslog:(NSString *)llslog;
- (void)setFont:(UIFont *)font llslog:(NSString *)llslog;
- (void)setTextAlignment:(NSTextAlignment)textAlignment llslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)setPlaceholder:(NSString *)placeholder llslog:(NSString *)llslog;
- (void)delegateLlslog:(NSString *)llslog;

@end
