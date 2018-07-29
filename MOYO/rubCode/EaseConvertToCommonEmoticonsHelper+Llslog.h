#import <Foundation/Foundation.h>
#import "EaseConvertToCommonEmoticonsHelper.h"
#import "EaseEmoji.h"

@interface EaseConvertToCommonEmoticonsHelper (Llslog)
+ (void)convertToCommonEmoticons:(NSString *)text llslog:(NSString *)llslog;
+ (void)convertToSystemEmoticons:(NSString *)text llslog:(NSString *)llslog;

@end
