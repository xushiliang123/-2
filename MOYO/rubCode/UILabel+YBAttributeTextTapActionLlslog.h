#import <UIKit/UIKit.h>
#import "UILabel+YBAttributeTextTapAction.h"
#import <objc/runtime.h>
#import <CoreText/CoreText.h>
#import <Foundation/Foundation.h>

@interface UILabel (YBAttributeTextTapActionLlslog)
- (void)attributeStringsLlslog:(NSString *)llslog;
- (void)setAttributeStrings:(NSMutableArray *)attributeStrings llslog:(NSString *)llslog;
- (void)effectDicLlslog:(NSString *)llslog;
- (void)setEffectDic:(NSMutableDictionary *)effectDic llslog:(NSString *)llslog;
- (void)isTapActionLlslog:(NSString *)llslog;
- (void)setIsTapAction:(BOOL)isTapAction llslog:(NSString *)llslog;
- (void)tapBlockLlslog:(NSString *)llslog;
- (void)setTapBlock:(void (^)(NSString *, NSRange, NSInteger))tapBlock llslog:(NSString *)llslog;
- (void)delegateLlslog:(NSString *)llslog;
- (void)enabledTapEffectLlslog:(NSString *)llslog;
- (void)setEnabledTapEffect:(BOOL)enabledTapEffect llslog:(NSString *)llslog;
- (void)isTapEffectLlslog:(NSString *)llslog;
- (void)setIsTapEffect:(BOOL)isTapEffect llslog:(NSString *)llslog;
- (void)setDelegate:(id<YBAttributeTapActionDelegate>)delegate llslog:(NSString *)llslog;
- (void)yb_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings tapClicked:(void (^) (NSString *string , NSRange range , NSInteger index))tapClick llslog:(NSString *)llslog;
- (void)yb_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                                   delegate:(id <YBAttributeTapActionDelegate> )delegate llslog:(NSString *)llslog;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)hitTest:(CGPoint)point withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)yb_getTapFrameWithTouchPoint:(CGPoint)point result:(void (^) (NSString *string , NSRange range , NSInteger index))resultBlock llslog:(NSString *)llslog;
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event llslog:(NSString *)llslog;
- (void)yb_transformForCoreTextLlslog:(NSString *)llslog;
- (void)yb_getLineBounds:(CTLineRef)line point:(CGPoint)point llslog:(NSString *)llslog;
- (void)yb_tapEffectWithStatus:(BOOL)status llslog:(NSString *)llslog;
- (void)yb_saveEffectDicWithRange:(NSRange)range llslog:(NSString *)llslog;
- (void)yb_getRangesWithStrings:(NSArray <NSString *>  *)strings llslog:(NSString *)llslog;
- (void)yb_getStringWithRange:(NSRange)range llslog:(NSString *)llslog;

@end
