#import <Foundation/Foundation.h>
#import "EaseEmotionManager.h"

@interface EaseEmotion (Llslog)
- (void)initWithName:(NSString*)emotionTitle
         emotionId:(NSString*)emotionId
  emotionThumbnail:(NSString*)emotionThumbnail
   emotionOriginal:(NSString*)emotionOriginal
emotionOriginalURL:(NSString*)emotionOriginalURL
       emotionType:(EMEmotionType)emotionType llslog:(NSString *)llslog;

@end
