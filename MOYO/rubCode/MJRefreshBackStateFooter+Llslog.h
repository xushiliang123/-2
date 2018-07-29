#import "MJRefreshBackFooter.h"
#import "MJRefreshBackStateFooter.h"

@interface MJRefreshBackStateFooter (Llslog)
- (void)stateTitlesLlslog:(NSString *)llslog;
- (void)stateLabelLlslog:(NSString *)llslog;
- (void)setTitle:(NSString *)title forState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)titleForState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)placeSubviewsLlslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;

@end
