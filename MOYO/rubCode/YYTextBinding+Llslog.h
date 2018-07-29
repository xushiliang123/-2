#import <UIKit/UIKit.h>
#import "YYTextAttribute.h"
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "NSObject+YYAdd.h"
#import "NSAttributedString+YYText.h"
#import "YYAnimatedImageView.h"
#import "YYTextArchiver.h"
#import "UIFont+YYAdd.h"
#import "UIDevice+YYAdd.h"

@interface YYTextBinding (Llslog)
+ (void)bindingWithDeleteConfirm:(BOOL)deleteConfirm llslog:(NSString *)llslog;
- (void)encodeWithCoder:(NSCoder *)aCoder llslog:(NSString *)llslog;
- (void)initWithCoder:(NSCoder *)aDecoder llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
