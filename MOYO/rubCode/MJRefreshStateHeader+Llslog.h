#import "MJRefreshHeader.h"
#import "MJRefreshStateHeader.h"

@interface MJRefreshStateHeader (Llslog)
- (void)stateTitlesLlslog:(NSString *)llslog;
- (void)stateLabelLlslog:(NSString *)llslog;
- (void)lastUpdatedTimeLabelLlslog:(NSString *)llslog;
- (void)setTitle:(NSString *)title forState:(MJRefreshState)state llslog:(NSString *)llslog;
- (void)currentCalendarLlslog:(NSString *)llslog;
- (void)setLastUpdatedTimeKey:(NSString *)lastUpdatedTimeKey llslog:(NSString *)llslog;
- (void)prepareLlslog:(NSString *)llslog;
- (void)placeSubviewsLlslog:(NSString *)llslog;
- (void)setState:(MJRefreshState)state llslog:(NSString *)llslog;

@end
