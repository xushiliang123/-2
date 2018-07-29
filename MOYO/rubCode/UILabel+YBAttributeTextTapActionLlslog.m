#import "UILabel+YBAttributeTextTapActionLlslog.h"
@implementation UILabel (YBAttributeTextTapActionLlslog)
- (void)attributeStringsLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setAttributeStrings:(NSMutableArray *)attributeStrings llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)effectDicLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setEffectDic:(NSMutableDictionary *)effectDic llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isTapActionLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setIsTapAction:(BOOL)isTapAction llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)tapBlockLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setTapBlock:(void (^)(NSString *, NSRange, NSInteger))tapBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)delegateLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)enabledTapEffectLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setEnabledTapEffect:(BOOL)enabledTapEffect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isTapEffectLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setIsTapEffect:(BOOL)isTapEffect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)setDelegate:(id<YBAttributeTapActionDelegate>)delegate llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings tapClicked:(void (^) (NSString *string , NSRange range , NSInteger index))tapClick llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                                   delegate:(id <YBAttributeTapActionDelegate> )delegate llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)hitTest:(CGPoint)point withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_getTapFrameWithTouchPoint:(CGPoint)point result:(void (^) (NSString *string , NSRange range , NSInteger index))resultBlock llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_transformForCoreTextLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_getLineBounds:(CTLineRef)line point:(CGPoint)point llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_tapEffectWithStatus:(BOOL)status llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_saveEffectDicWithRange:(NSRange)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_getRangesWithStrings:(NSArray <NSString *>  *)strings llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)yb_getStringWithRange:(NSRange)range llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
