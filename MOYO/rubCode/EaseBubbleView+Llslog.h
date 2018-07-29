#import <UIKit/UIKit.h>
#import "EaseBubbleView.h"
#import "EaseBubbleView+Text.h"
#import "EaseBubbleView+Image.h"
#import "EaseBubbleView+Location.h"
#import "EaseBubbleView+Voice.h"
#import "EaseBubbleView+Video.h"
#import "EaseBubbleView+File.h"

@interface EaseBubbleView (Llslog)
- (void)initWithMargin:(UIEdgeInsets)margin
                      isSender:(BOOL)isSender llslog:(NSString *)llslog;
- (void)_setupBackgroundImageViewConstraintsLlslog:(NSString *)llslog;
- (void)backgroundImageViewLlslog:(NSString *)llslog;

@end
