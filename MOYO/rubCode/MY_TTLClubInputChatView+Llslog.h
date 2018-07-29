#import <UIKit/UIKit.h>
#import "EaseChatToolbar.h"
#import "EaseFaceView.h"
#import "EaseTextView.h"
#import "EaseRecordView.h"
#import "EaseChatBarMoreView.h"
#import "EaseChatToolbarItem.h"
#import "MY_TTLClubInputChatView.h"

@interface MY_TTLClubInputChatView (Llslog)
- (void)initWithFrame:(CGRect)frame
                         type:(EMChatToolbarType)type llslog:(NSString *)llslog;
- (void)setupMySubviewsLlslog:(NSString *)llslog;
- (void)photoButtonAction:(UIButton*)sender llslog:(NSString *)llslog;
- (void)messButtonAction:(UIButton*)sender llslog:(NSString *)llslog;
- (void)faceButtonAction:(id)sender llslog:(NSString *)llslog;

@end
