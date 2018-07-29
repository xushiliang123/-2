#import "MY_LLInfomationViewController+Llslog.h"
@implementation MY_LLInfomationViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)viewDidLoadLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)removeEmptyConversationsFromDBLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)networkStateViewLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
            didSelectConversationModel:(id<IConversationModel>)conversationModel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController modelForConversation:(EMConversation *)conversation llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
                latestMessageTitleForConversationModel:(id<IConversationModel>)conversationModel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
       latestMessageTimeForConversationModel:(id<IConversationModel>)conversationModel llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceiveMessages:(NSArray *)aMessages llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)refreshLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)refreshDataSourceLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)isConnect:(BOOL)isConnect llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)networkChanged:(EMConnectionState)connectionState llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender llslog:(NSString *)llslog {
    NSLog(@"%@", llslog);
}

@end
