#import "BarrageSprite.h"
#import "BarrageWalkSprite.h"

@interface BarrageWalkSprite (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)sideLlslog:(NSString *)llslog;
- (void)defaultSideWithDirection:(BarrageWalkDirection)direction llslog:(NSString *)llslog;
- (void)validWithTime:(NSTimeInterval)time llslog:(NSString *)llslog;
- (void)rectWithTime:(NSTimeInterval)time llslog:(NSString *)llslog;
- (void)estimateActiveTimeLlslog:(NSString *)llslog;
- (void)originInBounds:(CGRect)rect withSprites:(NSArray *)sprites llslog:(NSString *)llslog;

@end
