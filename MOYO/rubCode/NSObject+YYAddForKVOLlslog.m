#import "NSObject+YYAddForKVOLlslog.h"
@implementation NSObject (YYAddForKVOLlslog)
- (void)addObserverBlockForKeyPath:(NSString *)keyPath block:(void (^)(__weak id obj, id oldVal, id newVal))block llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeObserverBlocksForKeyPath:(NSString *)keyPath llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeObserverBlocksLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)_yy_allNSObjectObserverBlocksLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
