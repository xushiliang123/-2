#import "EaseUI.h"
#import "MY_LLInfomationViewController.h"
#import "ChatViewController.h"
#import "ChatDemoHelper.h"
#import "MY_TTLClubNoticeViewController.h"
#import "MY_XTSystemInfoViewController.h"
#import "MY_LLCustomerServiceViewController.h"
#import "MY_TTLOfficialNoticeViewController.h"
#import "MY_LYVTaskViewController.h"
#import "MY_TTLClubChatViewController.h"

@interface MY_LLInfomationViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)removeEmptyConversationsFromDBLlslog:(NSString *)llslog;
- (void)networkStateViewLlslog:(NSString *)llslog;
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
            didSelectConversationModel:(id<IConversationModel>)conversationModel llslog:(NSString *)llslog;
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController modelForConversation:(EMConversation *)conversation llslog:(NSString *)llslog;
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
                latestMessageTitleForConversationModel:(id<IConversationModel>)conversationModel llslog:(NSString *)llslog;
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
       latestMessageTimeForConversationModel:(id<IConversationModel>)conversationModel llslog:(NSString *)llslog;
- (void)didReceiveMessages:(NSArray *)aMessages llslog:(NSString *)llslog;
- (void)refreshLlslog:(NSString *)llslog;
- (void)refreshDataSourceLlslog:(NSString *)llslog;
- (void)isConnect:(BOOL)isConnect llslog:(NSString *)llslog;
- (void)networkChanged:(EMConnectionState)connectionState llslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog;

@end
