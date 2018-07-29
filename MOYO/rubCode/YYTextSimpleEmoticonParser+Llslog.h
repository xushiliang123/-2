#import <UIKit/UIKit.h>
#import "YYTextParser.h"
#import "YYCGUtilities.h"
#import "YYTextUtilities.h"
#import "YYTextAttribute.h"
#import "NSAttributedString+YYText.h"
#import "NSParagraphStyle+YYText.h"
#import "UIFont+YYAdd.h"

@interface YYTextSimpleEmoticonParser (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)emoticonMapperLlslog:(NSString *)llslog;
- (void)setEmoticonMapper:(NSDictionary *)emoticonMapper llslog:(NSString *)llslog;
- (void)_replaceTextInRange:(NSRange)range withLength:(NSUInteger)length selectedRange:(NSRange)selectedRange llslog:(NSString *)llslog;
- (void)parseText:(NSMutableAttributedString *)text selectedRange:(NSRangePointer)range llslog:(NSString *)llslog;

@end
