#import "EaseEmotionManager+Llslog.h"
@implementation EaseEmotionManager (Llslog)
- (void)initWithType:(EMEmotionType)Type
        emotionRow:(NSInteger)emotionRow
        emotionCol:(NSInteger)emotionCol
          emotions:(NSArray*)emotions llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)initWithType:(EMEmotionType)Type
        emotionRow:(NSInteger)emotionRow
        emotionCol:(NSInteger)emotionCol
          emotions:(NSArray*)emotions
          tagImage:(UIImage*)tagImage llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
