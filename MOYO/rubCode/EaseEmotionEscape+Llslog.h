#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EaseEmotionEscape.h"

@interface EaseEmotionEscape (Llslog)
+ (void)sharedInstanceLlslog:(NSString *)llslog;
+ (void)attributtedStringFromText:(NSString *) aInputText llslog:(NSString *)llslog;
+ (void)attStringFromTextForChatting:(NSString *) aInputText llslog:(NSString *)llslog;
+ (void)attStringFromTextForInputView:(NSString *) aInputText llslog:(NSString *)llslog;
- (void)attributtedStringFromText:(NSString *) aInputText llslog:(NSString *)llslog;
- (void)attStringFromTextForChatting:(NSString *) aInputText textFont:(UIFont*)font llslog:(NSString *)llslog;
- (void)attStringFromTextForInputView:(NSString *) aInputText textFont:(UIFont*)font llslog:(NSString *)llslog;
- (void)getEmojiTextByKey:(NSString*) aKey llslog:(NSString *)llslog;
- (void)getEmojiImageNameByKey:(NSString*) aKey llslog:(NSString *)llslog;
- (void)setEaseEmotionEscapePattern:(NSString *)pattern llslog:(NSString *)llslog;
- (void)setEaseEmotionEscapeDictionary:(NSDictionary*)dict llslog:(NSString *)llslog;

@end
