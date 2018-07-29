#import <UIKit/UIKit.h>
#import "TabBarItem.h"
#import "ViewController.h"

@interface TabBarItem (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setHighlighted:(BOOL)highlighted llslog:(NSString *)llslog;
- (void)imageRectForContentRect:(CGRect)contentRect llslog:(NSString *)llslog;
- (void)titleRectForContentRect:(CGRect)contentRect llslog:(NSString *)llslog;

@end
