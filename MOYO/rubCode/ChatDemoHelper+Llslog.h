#import <Foundation/Foundation.h>
#import "MY_LLInfomationViewController.h"
#import "TabBarController.h"
#import "ChatDemoHelper.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "EaseSDKHelper.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_LYLoginViewController.h"
#import "DemoCallManager.h"

@interface ChatDemoHelper (Llslog)
+ (void)shareHelperLlslog:(NSString *)llslog;
- (void)deallocLlslog:(NSString *)llslog;
- (void)initLlslog:(NSString *)llslog;
- (void)setMainVC:(TabBarController *)mainVC llslog:(NSString *)llslog;
- (void)initHelperLlslog:(NSString *)llslog;
- (void)asyncPushOptionsLlslog:(NSString *)llslog;
- (void)asyncGroupFromServerLlslog:(NSString *)llslog;
- (void)asyncConversationFromDBLlslog:(NSString *)llslog;
- (void)didConnectionStateChanged:(EMConnectionState)connectionState llslog:(NSString *)llslog;
- (void)autoLoginDidCompleteWithError:(EMError *)error llslog:(NSString *)llslog;
- (void)automaticLoginLlslog:(NSString *)llslog;
- (void)loginOutLlslog:(NSString *)llslog;
- (void)connectionStateDidChange:(EMConnectionState)aConnectionState llslog:(NSString *)llslog;
- (void)userAccountDidLoginFromOtherDeviceLlslog:(NSString *)llslog;
- (void)userAccountDidRemoveFromServerLlslog:(NSString *)llslog;
- (void)userDidForbidByServerLlslog:(NSString *)llslog;
- (void)didServersChangedLlslog:(NSString *)llslog;
- (void)didAppkeyChangedLlslog:(NSString *)llslog;
- (void)didUpdateConversationList:(NSArray *)aConversationList llslog:(NSString *)llslog;
- (void)didReceiveMessages:(NSArray *)aMessages llslog:(NSString *)llslog;
- (void)insertFirstMessageWithMessage:(EMMessage *)message llslog:(NSString *)llslog;
- (void)receiveSystemNotication:(EMMessage *)message llslog:(NSString *)llslog;
- (void)receiveZhaohuHB:(EMMessage *)message llslog:(NSString *)llslog;
- (void)didReceiveLeavedGroup:(EMGroup *)aGroup
                       reason:(EMGroupLeaveReason)aReason llslog:(NSString *)llslog;
- (void)didReceiveJoinGroupApplication:(EMGroup *)aGroup
                             applicant:(NSString *)aApplicant
                                reason:(NSString *)aReason llslog:(NSString *)llslog;
- (void)didJoinedGroup:(EMGroup *)aGroup
               inviter:(NSString *)aInviter
               message:(NSString *)aMessage llslog:(NSString *)llslog;
- (void)groupInvitationDidDecline:(EMGroup *)aGroup
                          invitee:(NSString *)aInvitee
                           reason:(NSString *)aReason llslog:(NSString *)llslog;
- (void)groupInvitationDidAccept:(EMGroup *)aGroup
                         invitee:(NSString *)aInvitee llslog:(NSString *)llslog;
- (void)didReceiveDeclinedJoinGroup:(NSString *)aGroupId
                             reason:(NSString *)aReason llslog:(NSString *)llslog;
- (void)joinGroupRequestDidApprove:(EMGroup *)aGroup llslog:(NSString *)llslog;
- (void)didReceiveGroupInvitation:(NSString *)aGroupId
                          inviter:(NSString *)aInviter
                          message:(NSString *)aMessage llslog:(NSString *)llslog;
- (void)groupMuteListDidUpdate:(EMGroup *)aGroup
             addedMutedMembers:(NSArray *)aMutedMembers
                    muteExpire:(NSInteger)aMuteExpire llslog:(NSString *)llslog;
- (void)groupMuteListDidUpdate:(EMGroup *)aGroup
           removedMutedMembers:(NSArray *)aMutedMembers llslog:(NSString *)llslog;
- (void)groupAdminListDidUpdate:(EMGroup *)aGroup
                     addedAdmin:(NSString *)aAdmin llslog:(NSString *)llslog;
- (void)groupAdminListDidUpdate:(EMGroup *)aGroup
                   removedAdmin:(NSString *)aAdmin llslog:(NSString *)llslog;
- (void)groupOwnerDidUpdate:(EMGroup *)aGroup
                   newOwner:(NSString *)aNewOwner
                   oldOwner:(NSString *)aOldOwner llslog:(NSString *)llslog;
- (void)didReceiveAgreedFromUsername:(NSString *)aUsername llslog:(NSString *)llslog;
- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername llslog:(NSString *)llslog;
- (void)didReceiveDeletedFromUsername:(NSString *)aUsername llslog:(NSString *)llslog;
- (void)didReceiveAddedFromUsername:(NSString *)aUsername llslog:(NSString *)llslog;
- (void)didReceiveFriendInvitationFromUsername:(NSString *)aUsername
                                       message:(NSString *)aMessage llslog:(NSString *)llslog;
- (void)didReceiveUserJoinedChatroom:(EMChatroom *)aChatroom
                            username:(NSString *)aUsername llslog:(NSString *)llslog;
- (void)didReceiveUserLeavedChatroom:(EMChatroom *)aChatroom
                            username:(NSString *)aUsername llslog:(NSString *)llslog;
- (void)didReceiveKickedFromChatroom:(EMChatroom *)aChatroom
                              reason:(EMChatroomBeKickedReason)aReason llslog:(NSString *)llslog;
- (void)chatroomMuteListDidUpdate:(EMChatroom *)aChatroom
                addedMutedMembers:(NSArray *)aMutes
                       muteExpire:(NSInteger)aMuteExpire llslog:(NSString *)llslog;
- (void)chatroomMuteListDidUpdate:(EMChatroom *)aChatroom
              removedMutedMembers:(NSArray *)aMutes llslog:(NSString *)llslog;
- (void)chatroomAdminListDidUpdate:(EMChatroom *)aChatroom
                        addedAdmin:(NSString *)aAdmin llslog:(NSString *)llslog;
- (void)chatroomAdminListDidUpdate:(EMChatroom *)aChatroom
                      removedAdmin:(NSString *)aAdmin llslog:(NSString *)llslog;
- (void)chatroomOwnerDidUpdate:(EMChatroom *)aChatroom
                      newOwner:(NSString *)aNewOwner
                      oldOwner:(NSString *)aOldOwner llslog:(NSString *)llslog;
- (void)_needShowNotification:(NSString *)fromChatter llslog:(NSString *)llslog;
- (void)_clearHelperLlslog:(NSString *)llslog;
- (void)_handleReceivedAtMessage:(EMMessage*)aMessage llslog:(NSString *)llslog;
- (void)addAttentionWithUserId:(NSInteger)userId nickName:(NSString *)nickName headIcon:(NSString *)headIcon llslog:(NSString *)llslog;

@end
