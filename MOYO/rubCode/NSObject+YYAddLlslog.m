#import "NSObject+YYAddLlslog.h"
@implementation NSObject (YYAddLlslog)
- (void)performSelectorWithArgs:(SEL)sel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)performSelectorWithArgs:(SEL)sel afterDelay:(NSTimeInterval)delay llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)performSelectorWithArgsOnMainThread:(SEL)sel waitUntilDone:(BOOL)wait llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)performSelectorWithArgs:(SEL)sel onThread:(NSThread *)thr waitUntilDone:(BOOL)wait llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)performSelectorWithArgsInBackground:(SEL)sel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)getReturnFromInv:(NSInvocation *)inv withSig:(NSMethodSignature *)sig llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)setInv:(NSInvocation *)inv withSig:(NSMethodSignature *)sig andArgs:(va_list)args llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)performSelector:(SEL)sel afterDelay:(NSTimeInterval)delay llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAssociateValue:(id)value withKey:(void *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAssociateWeakValue:(id)value withKey:(void *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeAssociatedValuesLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)getAssociatedValueForKey:(void *)key llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
+ (void)classNameLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)classNameLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deepCopyLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)deepCopyWithArchiver:(Class)archiver unarchiver:(Class)unarchiver llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
