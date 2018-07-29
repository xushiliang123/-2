#import <Foundation/Foundation.h>
#import "NSObject+YYAdd.h"
#import "YYKitMacro.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@interface NSObject (YYAddLlslog)
- (void)performSelectorWithArgs:(SEL)sel  llslog:(NSString *)llslog;
- (void)performSelectorWithArgs:(SEL)sel afterDelay:(NSTimeInterval)delay  llslog:(NSString *)llslog;
- (void)performSelectorWithArgsOnMainThread:(SEL)sel waitUntilDone:(BOOL)wait llslog:(NSString *)llslog;
- (void)performSelectorWithArgs:(SEL)sel onThread:(NSThread *)thr waitUntilDone:(BOOL)wait llslog:(NSString *)llslog;
- (void)performSelectorWithArgsInBackground:(SEL)sel llslog:(NSString *)llslog;
+ (void)getReturnFromInv:(NSInvocation *)inv withSig:(NSMethodSignature *)sig llslog:(NSString *)llslog;
+ (void)setInv:(NSInvocation *)inv withSig:(NSMethodSignature *)sig andArgs:(va_list)args llslog:(NSString *)llslog;
- (void)performSelector:(SEL)sel afterDelay:(NSTimeInterval)delay llslog:(NSString *)llslog;
+ (void)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel llslog:(NSString *)llslog;
+ (void)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel llslog:(NSString *)llslog;
- (void)setAssociateValue:(id)value withKey:(void *)key llslog:(NSString *)llslog;
- (void)setAssociateWeakValue:(id)value withKey:(void *)key llslog:(NSString *)llslog;
- (void)removeAssociatedValuesLlslog:(NSString *)llslog;
- (void)getAssociatedValueForKey:(void *)key llslog:(NSString *)llslog;
+ (void)classNameLlslog:(NSString *)llslog;
- (void)classNameLlslog:(NSString *)llslog;
- (void)deepCopyLlslog:(NSString *)llslog;
- (void)deepCopyWithArchiver:(Class)archiver unarchiver:(Class)unarchiver llslog:(NSString *)llslog;

@end
