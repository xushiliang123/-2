#import <Foundation/Foundation.h>
#import "BarrageHeader.h"
#import "BarrageRenderer.h"
#import "BarrageCanvas.h"
#import "BarrageDispatcher.h"
#import "BarrageSprite.h"
#import "BarrageSpriteFactory.h"
#import "BarrageClock.h"
#import "BarrageDescriptor.h"

@interface BarrageRenderer (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)initClockLlslog:(NSString *)llslog;
- (void)receive:(BarrageDescriptor *)descriptor llslog:(NSString *)llslog;
- (void)startLlslog:(NSString *)llslog;
- (void)pauseLlslog:(NSString *)llslog;
- (void)stopLlslog:(NSString *)llslog;
- (void)setSpeed:(CGFloat)speed llslog:(NSString *)llslog;
- (void)speedLlslog:(NSString *)llslog;
- (void)setRedisplay:(BOOL)redisplay llslog:(NSString *)llslog;
- (void)pausedDurationLlslog:(NSString *)llslog;
- (void)currentTimeLlslog:(NSString *)llslog;
- (void)convertDelayTime:(BarrageDescriptor *)descriptor llslog:(NSString *)llslog;
- (void)spritesNumberWithName:(NSString *)spriteName llslog:(NSString *)llslog;
- (void)recordDescriptor:(BarrageDescriptor *)descriptor llslog:(NSString *)llslog;
- (void)recordsLlslog:(NSString *)llslog;
- (void)load:(NSArray *)descriptors llslog:(NSString *)llslog;
- (void)updateLlslog:(NSString *)llslog;
- (void)shouldActiveSprite:(BarrageSprite *)sprite llslog:(NSString *)llslog;
- (void)willActiveSprite:(BarrageSprite *)sprite llslog:(NSString *)llslog;
- (void)viewIndexOfSprite:(BarrageSprite *)sprite llslog:(NSString *)llslog;
- (void)willDeactiveSprite:(BarrageSprite *)sprite llslog:(NSString *)llslog;
- (void)timeForBarrageDispatcher:(BarrageDispatcher *)dispatcher llslog:(NSString *)llslog;
- (void)indexAddSprite:(BarrageSprite *)sprite llslog:(NSString *)llslog;
- (void)indexRemoveSprite:(BarrageSprite *)sprite llslog:(NSString *)llslog;
- (void)viewLlslog:(NSString *)llslog;
- (void)setCanvasMargin:(UIEdgeInsets)canvasMargin llslog:(NSString *)llslog;
- (void)setMasked:(BOOL)masked llslog:(NSString *)llslog;

@end
