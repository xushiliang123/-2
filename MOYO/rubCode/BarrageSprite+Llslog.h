#import <Foundation/Foundation.h>
#import "BarrageSpriteUtility.h"
#import "BarrageSpriteProtocol.h"
#import "BarrageSprite.h"

@interface BarrageSprite (Llslog)
- (void)initLlslog:(NSString *)llslog;
- (void)updateWithTime:(NSTimeInterval)time llslog:(NSString *)llslog;
- (void)rectWithTime:(NSTimeInterval)time llslog:(NSString *)llslog;
- (void)validWithTime:(NSTimeInterval)time llslog:(NSString *)llslog;
- (void)activeWithContext:(NSDictionary *)context llslog:(NSString *)llslog;
- (void)configViewLlslog:(NSString *)llslog;
- (void)clickSpriteViewLlslog:(NSString *)llslog;
- (void)bindingViewLlslog:(NSString *)llslog;
- (void)originInBounds:(CGRect)rect withSprites:(NSArray *)sprites llslog:(NSString *)llslog;
- (void)setClickAction:(BarrageClickAction)clickAction llslog:(NSString *)llslog;
- (void)positionLlslog:(NSString *)llslog;
- (void)sizeLlslog:(NSString *)llslog;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key llslog:(NSString *)llslog;

@end
