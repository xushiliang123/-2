#import "MJRefreshAutoStateFooter.h"
#import "MJRefreshAutoGifFooter.h"

@interface MJRefreshAutoGifFooter (Llslog)
- (void)gifViewLlslog:(NSString *)llslog;
- (void)stateImagesLlslog:(NSString *)llslog;
- (void)stateDurationsLlslog:(NSString *)llslog;
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)setImages:(NSArray *)images forState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)placeSubviewsLlslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;

@end
