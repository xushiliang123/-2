#import <Foundation/Foundation.h>
#import "BarrageSpriteFactory.h"
#import "BarrageDescriptor.h"
#import "BarrageSprite.h"

@interface BarrageSpriteFactory (Llslog)
+ (void)createSpriteWithDescriptor:(BarrageDescriptor *)descriptor llslog:(NSString *)llslog;

@end
