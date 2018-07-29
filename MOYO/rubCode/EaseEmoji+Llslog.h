#import <Foundation/Foundation.h>
#import "EaseEmoji.h"
#import "EaseEmojiEmoticons.h"

@interface EaseEmoji (Llslog)
+ (void)emojiWithCode:(int)code llslog:(NSString *)llslog;
+ (void)allEmojiLlslog:(NSString *)llslog;
+ (void)stringContainsEmoji:(NSString *)string llslog:(NSString *)llslog;

@end
