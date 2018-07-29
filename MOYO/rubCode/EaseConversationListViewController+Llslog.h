#import "EaseRefreshTableViewController.h"
#import "EaseConversationModel.h"
#import "EaseConversationCell.h"
//#import <HyphenateLite/HyphenateLite.h>
#import <Hyphenate/Hyphenate.h>
#import "EaseConversationListViewController.h"
#import "EaseEmotionEscape.h"
#import "EaseConversationCell.h"
#import "EaseConvertToCommonEmoticonsHelper.h"
#import "EaseMessageViewController.h"
#import "NSDate+Category.h"
#import "EaseLocalDefine.h"
#import "UserProfileManager.h"
#import "MY_LYMessageInfoModel.h"

@interface EaseConversationListViewController (Llslog)
- (void)viewWillAppear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewWillDisappear:(BOOL)animated llslog:(NSString *)llslog;
- (void)viewDidLoadLlslog:(NSString *)llslog;
- (void)didReceiveMemoryWarningLlslog:(NSString *)llslog;
- (void)messagesDidReceive:(NSArray *)aMessages llslog:(NSString *)llslog;
- (void)numberOfSectionsInTableView:(UITableView *)tableView llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath llslog:(NSString *)llslog;
- (void)refreshAndSortViewLlslog:(NSString *)llslog;
- (void)tableViewDidTriggerHeaderRefreshLlslog:(NSString *)llslog;
- (void)setHeadIconWithConversationId:(NSString *)conversationId llslog:(NSString *)llslog;
- (void)didUpdateGroupList:(NSArray *)groupList llslog:(NSString *)llslog;
- (void)registerNotificationsLlslog:(NSString *)llslog;
- (void)unregisterNotificationsLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)_latestMessageTitleForConversationModel:(id<IConversationModel>)conversationModel llslog:(NSString *)llslog;
- (void)_latestMessageTimeForConversationModel:(id<IConversationModel>)conversationModel llslog:(NSString *)llslog;

@end
