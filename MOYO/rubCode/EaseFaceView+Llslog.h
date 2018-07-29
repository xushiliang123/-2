#import <UIKit/UIKit.h>
#import "EaseFacialView.h"
#import "EaseFaceView.h"
#import "EaseEmotionManager.h"
#import "EaseLocalDefine.h"

@interface EaseFaceView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)willMoveToSuperview:(UIView *)newSuperview llslog:(NSString *)llslog;
- (void)facialViewLlslog:(NSString *)llslog;
- (void)_setupButtomLlslog:(NSString *)llslog;
- (void)_setupButtonScrollViewLlslog:(NSString *)llslog;
- (void)_clearupButtomScrollViewLlslog:(NSString *)llslog;
- (void)didSelect:(id)sender llslog:(NSString *)llslog;
- (void)reloadEmotionDataLlslog:(NSString *)llslog;
- (void)selectedFacialView:(NSString*)str llslog:(NSString *)llslog;
- (void)deleteSelected:(NSString *)str llslog:(NSString *)llslog;
- (void)sendFaceLlslog:(NSString *)llslog;
- (void)sendFace:(EaseEmotion *)emotion llslog:(NSString *)llslog;
- (void)stringIsFace:(NSString *)string llslog:(NSString *)llslog;
- (void)setEmotionManagers:(NSArray *)emotionManagers llslog:(NSString *)llslog;

@end
