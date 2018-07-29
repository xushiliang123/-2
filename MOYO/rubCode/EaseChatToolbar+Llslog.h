#import <UIKit/UIKit.h>
#import "EaseFaceView.h"
#import "EaseTextView.h"
#import "EaseRecordView.h"
#import "EaseChatBarMoreView.h"
#import "EaseChatToolbarItem.h"
#import "EaseChatToolbar.h"
#import "EaseFaceView.h"
#import "EaseEmoji.h"
#import "EaseEmotionEscape.h"
#import "EaseEmotionManager.h"
#import "EaseLocalDefine.h"

@interface EaseChatToolbar (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame
                         type:(EMChatToolbarType)type llslog:(NSString *)llslog;
- (void)initWithFrame:(CGRect)frame
            horizontalPadding:(CGFloat)horizontalPadding
              verticalPadding:(CGFloat)verticalPadding
           inputViewMinHeight:(CGFloat)inputViewMinHeight
           inputViewMaxHeight:(CGFloat)inputViewMaxHeight
                         type:(EMChatToolbarType)type llslog:(NSString *)llslog;
- (void)_setupSubviewsLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)recordViewLlslog:(NSString *)llslog;
- (void)faceViewLlslog:(NSString *)llslog;
- (void)moreViewLlslog:(NSString *)llslog;
- (void)setDelegate:(id)delegate llslog:(NSString *)llslog;
- (void)setRecordView:(UIView *)recordView llslog:(NSString *)llslog;
- (void)setMoreView:(UIView *)moreView llslog:(NSString *)llslog;
- (void)setFaceView:(UIView *)faceView llslog:(NSString *)llslog;
- (void)inputViewLeftItemsLlslog:(NSString *)llslog;
- (void)setInputViewLeftItems:(NSArray *)inputViewLeftItems llslog:(NSString *)llslog;
- (void)inputViewRightItemsLlslog:(NSString *)llslog;
- (void)setInputViewRightItems:(NSArray *)inputViewRightItems llslog:(NSString *)llslog;
- (void)setBackgroundImage:(UIImage *)backgroundImage llslog:(NSString *)llslog;
- (void)_getTextViewContentH:(UITextView *)textView llslog:(NSString *)llslog;
- (void)_willShowInputTextViewToHeight:(CGFloat)toHeight llslog:(NSString *)llslog;
- (void)_willShowBottomHeight:(CGFloat)bottomHeight llslog:(NSString *)llslog;
- (void)_willShowBottomView:(UIView *)bottomView llslog:(NSString *)llslog;
- (void)_willShowKeyboardFromFrame:(CGRect)beginFrame toFrame:(CGRect)toFrame llslog:(NSString *)llslog;
- (void)textViewShouldBeginEditing:(UITextView *)textView llslog:(NSString *)llslog;
- (void)textViewDidBeginEditing:(UITextView *)textView llslog:(NSString *)llslog;
- (void)textViewDidEndEditing:(UITextView *)textView llslog:(NSString *)llslog;
- (void)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text llslog:(NSString *)llslog;
- (void)textViewDidChange:(UITextView *)textView llslog:(NSString *)llslog;
- (void)selectedFacialView:(NSString *)str isDelete:(BOOL)isDelete llslog:(NSString *)llslog;
- (void)backspaceText:(NSMutableAttributedString*) attr length:(NSInteger)length llslog:(NSString *)llslog;
- (void)sendFaceLlslog:(NSString *)llslog;
- (void)sendFaceWithEmotion:(EaseEmotion *)emotion llslog:(NSString *)llslog;
- (void)chatKeyboardWillChangeFrame:(NSNotification *)notification llslog:(NSString *)llslog;
- (void)styleButtonAction:(id)sender llslog:(NSString *)llslog;
- (void)faceButtonAction:(id)sender llslog:(NSString *)llslog;
- (void)moreButtonAction:(id)sender llslog:(NSString *)llslog;
- (void)recordButtonTouchDownLlslog:(NSString *)llslog;
- (void)recordButtonTouchUpOutsideLlslog:(NSString *)llslog;
- (void)recordButtonTouchUpInsideLlslog:(NSString *)llslog;
- (void)recordDragOutsideLlslog:(NSString *)llslog;
- (void)recordDragInsideLlslog:(NSString *)llslog;
+ (void)defaultHeightLlslog:(NSString *)llslog;
- (void)endEditing:(BOOL)force llslog:(NSString *)llslog;
- (void)cancelTouchRecordLlslog:(NSString *)llslog;
- (void)willShowBottomView:(UIView *)bottomView llslog:(NSString *)llslog;
- (void)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha llslog:(NSString *)llslog;

@end
