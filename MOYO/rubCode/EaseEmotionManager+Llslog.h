#import <Foundation/Foundation.h>
#import "EaseEmotionManager.h"

@interface EaseEmotionManager (Llslog)
- (void)initWithType:(EMEmotionType)Type
        emotionRow:(NSInteger)emotionRow
        emotionCol:(NSInteger)emotionCol
          emotions:(NSArray*)emotions llslog:(NSString *)llslog;
- (void)initWithType:(EMEmotionType)Type
        emotionRow:(NSInteger)emotionRow
        emotionCol:(NSInteger)emotionCol
          emotions:(NSArray*)emotions
          tagImage:(UIImage*)tagImage llslog:(NSString *)llslog;

@end
