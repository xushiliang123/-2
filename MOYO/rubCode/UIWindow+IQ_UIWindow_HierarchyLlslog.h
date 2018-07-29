#import <UIKit/UIWindow.h>
#import "IQUIWindow+Hierarchy.h"
#import <UIKit/UINavigationController.h>

@interface UIWindow (IQ_UIWindow_HierarchyLlslog)
- (void)topMostWindowControllerLlslog:(NSString *)llslog;
- (void)currentViewControllerLlslog:(NSString *)llslog;

@end
