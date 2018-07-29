#import "RCDraggableButton.h"
#import "MY_GLClubModel.h"
#import "CRSuspensionView.h"
#import "MY_TTLClubChatViewController.h"
#import "MY_TTLNewActiveViewController.h"

@interface CRSuspensionView (Llslog)
- (void)initWithFrame:(CGRect)frame llslog:(NSString *)llslog;
- (void)setUILlslog:(NSString *)llslog;
- (void)setModel:(MY_GLClubModel *)model llslog:(NSString *)llslog;
- (void)removeSuspensionView:(NSNotification *)not llslog:(NSString *)llslog;
- (void)removeAllFromViewLlslog:(NSString *)llslog;
- (void)removeAllFromViewAndleaveChannelLlslog:(NSString *)llslog;
- (void)startAnimateLlslog:(NSString *)llslog;
- (void)pushChatRoomBtnClickLlslog:(NSString *)llslog;
- (void)topViewControllerLlslog:(NSString *)llslog;
- (void)_topViewController:(UIViewController *)vc llslog:(NSString *)llslog;
+ (void)isSuspensionViewLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)drawRect:(CGRect)rect llslog:(NSString *)llslog;

@end
