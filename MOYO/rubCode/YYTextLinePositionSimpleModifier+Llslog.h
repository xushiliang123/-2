#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <YYKit/YYTextDebugOption.h>
#import <YYKit/YYTextLine.h>
#import <YYKit/YYTextInput.h>
#import "YYTextDebugOption.h"
#import "YYTextLine.h"
#import "YYTextInput.h"
#import "YYTextLayout.h"
#import "YYKitMacro.h"
#import "YYCGUtilities.h"
#import "YYTextUtilities.h"
#import "YYTextAttribute.h"
#import "YYTextArchiver.h"
#import "NSAttributedString+YYText.h"
#import "UIFont+YYAdd.h"

@interface YYTextLinePositionSimpleModifier (Llslog)
- (void)modifyLines:(NSArray *)lines fromText:(NSAttributedString *)text inContainer:(YYTextContainer *)container llslog:(NSString *)llslog;
- (void)copyWithZone:(NSZone *)zone llslog:(NSString *)llslog;

@end
