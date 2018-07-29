#import <UIKit/UIKit.h>
#import "UITabBar+badge.h"
#import "UIColor+RCColor.h"
#import "RCDTabBarBtn.h"

@interface UITabBar (badgeLlslog)
- (void)showBadgeOnItemIndex:(int)index llslog:(NSString *)llslog;
- (void)showBadgeOnItemIndex:(int)index badgeValue:(int)badgeValue llslog:(NSString *)llslog;
- (void)hideBadgeOnItemIndex:(int)index llslog:(NSString *)llslog;
- (void)removeBadgeOnItemIndex:(int)index llslog:(NSString *)llslog;
- (void)initUnreadCountButton:(CGRect)frame tag:(NSUInteger)tag badgeValue:(int)badgeValue llslog:(NSString *)llslog;

@end
