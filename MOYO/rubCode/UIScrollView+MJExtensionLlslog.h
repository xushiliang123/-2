#import <UIKit/UIKit.h>
#import "UIScrollView+MJExtension.h"
#import <objc/runtime.h>

@interface UIScrollView (MJExtensionLlslog)
- (void)setMj_insetT:(CGFloat)mj_insetT llslog:(NSString *)llslog;
- (void)mj_insetTLlslog:(NSString *)llslog;
- (void)setMj_insetB:(CGFloat)mj_insetB llslog:(NSString *)llslog;
- (void)mj_insetBLlslog:(NSString *)llslog;
- (void)setMj_insetL:(CGFloat)mj_insetL llslog:(NSString *)llslog;
- (void)mj_insetLLlslog:(NSString *)llslog;
- (void)setMj_insetR:(CGFloat)mj_insetR llslog:(NSString *)llslog;
- (void)mj_insetRLlslog:(NSString *)llslog;
- (void)setMj_offsetX:(CGFloat)mj_offsetX llslog:(NSString *)llslog;
- (void)mj_offsetXLlslog:(NSString *)llslog;
- (void)setMj_offsetY:(CGFloat)mj_offsetY llslog:(NSString *)llslog;
- (void)mj_offsetYLlslog:(NSString *)llslog;
- (void)setMj_contentW:(CGFloat)mj_contentW llslog:(NSString *)llslog;
- (void)mj_contentWLlslog:(NSString *)llslog;
- (void)setMj_contentH:(CGFloat)mj_contentH llslog:(NSString *)llslog;
- (void)mj_contentHLlslog:(NSString *)llslog;

@end
