#import <UIKit/UIKit.h>
#import "ShareMenuItem.h"

@interface ShareMenuItem (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)createUIWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)reloadDataWithImage:(UIImage *)image platformName:(NSString *)platformName llslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;

@end
