#import <Foundation/Foundation.h>
#import "NSObject+YYAddForKVO.h"
#import "YYKitMacro.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@interface NSObject (YYAddForKVOLlslog)
- (void)addObserverBlockForKeyPath:(NSString *)keyPath block:(void (^)(__weak id obj, id oldVal, id newVal))block llslog:(NSString *)llslog;
- (void)removeObserverBlocksForKeyPath:(NSString *)keyPath llslog:(NSString *)llslog;
- (void)removeObserverBlocksLlslog:(NSString *)llslog;
- (void)_yy_allNSObjectObserverBlocksLlslog:(NSString *)llslog;

@end
