#import "EaseEmoji+Llslog.h"
@implementation EaseEmoji (Llslog)
+ (void)emojiWithCode:(int)code llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)allEmojiLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)stringContainsEmoji:(NSString *)string llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
