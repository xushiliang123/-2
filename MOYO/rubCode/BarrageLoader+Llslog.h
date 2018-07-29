#import <Foundation/Foundation.h>
#import "BarrageLoader.h"

@interface BarrageLoader (Llslog)
+ (void)readDescriptorsWithFile:(NSString *)file llslog:(NSString *)llslog;
+ (void)readDescriptorsWithDamakuFile:(NSString *)file llslog:(NSString *)llslog;
+ (void)writeDescriptors:(NSArray *)descriptors toFile:(NSString *)file additional:(BOOL)additional llslog:(NSString *)llslog;

@end
