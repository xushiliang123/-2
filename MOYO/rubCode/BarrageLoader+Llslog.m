#import "BarrageLoader+Llslog.h"
@implementation BarrageLoader (Llslog)
+ (void)readDescriptorsWithFile:(NSString *)file llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)readDescriptorsWithDamakuFile:(NSString *)file llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)writeDescriptors:(NSArray *)descriptors toFile:(NSString *)file additional:(BOOL)additional llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
