#import <UIKit/UIKit.h>
#import "EaseChatBarMoreView.h"

@interface EaseChatBarMoreView (Llslog)
+ (void)initializeLlslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame type:(EMChatToolbarType)type llslog:(NSString *)llslog;
- (void)setupSubviewsForType:(EMChatToolbarType)type llslog:(NSString *)llslog;
- (void)insertItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highLightedImage title:(NSString *)title llslog:(NSString *)llslog;
- (void)updateItemWithImage:(UIImage *)image highlightedImage:(UIImage *)highLightedImage title:(NSString *)title atIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)hidenItematIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)removeItematIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)_resetItemFromIndex:(NSInteger)index llslog:(NSString *)llslog;
- (void)setMoreViewBackgroundColor:(UIColor *)moreViewBackgroundColor llslog:(NSString *)llslog;
- (void)setMoreViewButtonImages:(NSArray *)moreViewButtonImages llslog:(NSString *)llslog;
- (void)setMoreViewButtonHignlightImages:(NSArray *)moreViewButtonHignlightImages llslog:(NSString *)llslog;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView llslog:(NSString *)llslog;
- (void)takePicActionLlslog:(NSString *)llslog;
- (void)photoActionLlslog:(NSString *)llslog;
- (void)locationActionLlslog:(NSString *)llslog;
- (void)takeAudioCallActionLlslog:(NSString *)llslog;
- (void)takeVideoCallActionLlslog:(NSString *)llslog;
- (void)moreAction:(id)sender llslog:(NSString *)llslog;

@end
