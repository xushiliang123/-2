#import "MJRefreshBackStateFooter.h"
#import "MJRefreshBackGifFooter.h"

@interface MJRefreshBackGifFooter (Llslog)
- (void)gifViewLlslog:(NSString *)llslog;
- (void)stateImagesLlslog:(NSString *)llslog;
- (void)stateDurationsLlslog:(NSString *)llslog;
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)setImages:(NSArray *)images forState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)setPullingPercent:(CGFloat)pullingPercent llslog:(NSString *)llslog;
- (void)placeSubviewsLlslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;

@end
