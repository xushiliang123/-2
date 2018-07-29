#import <UIKit/UIKit.h>
#import "BarrageCanvas.h"

@interface BarrageCanvas (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)layoutSubviewsLlslog:(NSString *)llslog;
- (void)setMargin:(UIEdgeInsets)margin llslog:(NSString *)llslog;
- (void)didMoveToSuperviewLlslog:(NSString *)llslog;
- (void)hitTest:(CGPoint)point withEvent:(UIEvent *)event llslog:(NSString *)llslog;

@end
