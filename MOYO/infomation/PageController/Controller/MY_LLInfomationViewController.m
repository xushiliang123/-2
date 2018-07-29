//
//  MY_LLInfomationViewController.m
//  VTIME
//
//  Created by Louie on 2017/9/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLInfomationViewController.h"
#import "ChatViewController.h"
#import "ChatDemoHelper.h"
#import "MY_TTLClubNoticeViewController.h"
#import "MY_XTSystemInfoViewController.h"
#import "MY_LLCustomerServiceViewController.h"

#import "MY_TTLOfficialNoticeViewController.h"
#import "MY_LYVTaskViewController.h"
// 群聊俱乐部
#import "MY_TTLClubChatViewController.h"

@interface MY_LLInfomationViewController ()
<EaseConversationListViewControllerDelegate,
EaseConversationListViewControllerDataSource,IConversationModel>

@property (nonatomic, strong) UIView *networkStateView;

@end

@implementation MY_LLInfomationViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self tableViewDidTriggerHeaderRefresh];
    
}


- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
//    [[EaseEmotionEscape sharedInstance]setEaseEmotionEscapePattern:@"\[.+?\]"];
    self.showRefreshHeader = YES;
    self.delegate = self;
    self.dataSource = self;
    
    [self networkStateView];
    
//    [self tableViewDidTriggerHeaderRefresh];
    [self removeEmptyConversationsFromDB];
    
}


- (void)removeEmptyConversationsFromDB
{
    
//    [[EMClient sharedClient].chatManager  ];
    
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSMutableArray *needRemoveConversations;
    for (EMConversation *conversation in conversations) {
        if (!conversation.latestMessage || (conversation.type == EMConversationTypeChatRoom)) {
            if (!needRemoveConversations) {
                needRemoveConversations = [[NSMutableArray alloc] initWithCapacity:0];
            }
            
            [needRemoveConversations addObject:conversation];
        }
    }
    
    if (needRemoveConversations && needRemoveConversations.count > 0) {
        [[EMClient sharedClient].chatManager deleteConversations:needRemoveConversations isDeleteMessages:YES completion:nil];
    }
}

#pragma mark - getter

- (UIView *)networkStateView
{
    if (_networkStateView == nil) {
        _networkStateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
        _networkStateView.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:199 / 255.0 blue:199 / 255.0 alpha:0.5];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (_networkStateView.frame.size.height - 20) / 2, 20, 20)];
        imageView.image = [UIImage imageNamed:@"messageSendFail"];
        [_networkStateView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 5, 0, _networkStateView.frame.size.width - (CGRectGetMaxX(imageView.frame) + 15), _networkStateView.frame.size.height)];
        label.font = [UIFont systemFontOfSize:15.0];
        label.textColor = [UIColor grayColor];
        label.backgroundColor = [UIColor clearColor];
        label.text = NSLocalizedString(@"network.disconnection", @"Network disconnection");
        [_networkStateView addSubview:label];
    }
    
    return _networkStateView;
}
#pragma mark - EaseConversationListViewControllerDelegate
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
            didSelectConversationModel:(id<IConversationModel>)conversationModel
{
    if (conversationModel) {
        EMConversation *conversation = conversationModel.conversation;
        if (conversation) {
            /*
            if ([conversation.conversationId isEqualToString:@"tingting1"]) {
                MY_TTLOfficialNoticeViewController* cusVc = [[MY_TTLOfficialNoticeViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
                cusVc.hidesBottomBarWhenPushed=YES;
                cusVc.title = @"官方公告";
                [self.controllerView.navigationController pushViewController:cusVc animated:YES];
                
            } else if ([conversation.conversationId isEqualToString:@"tingting2"]) {
                
                //收礼记录
                
                MY_TTLSaveGiftsRecordViewController* saveVc = [[MY_TTLSaveGiftsRecordViewController alloc]init];
                [self.controllerView.navigationController pushViewController:saveVc animated:YES];
                [conversation markAllMessagesAsRead:nil];
                
            } else if ([conversation.conversationId isEqualToString:@"tingting3"]) {
                
                //订单消息
                MY_TTLOrderNewsViewController* orderVc = [[MY_TTLOrderNewsViewController alloc]init];
                [self.controllerView.navigationController pushViewController:orderVc animated:YES];
                [conversation markAllMessagesAsRead:nil];
                
            } else if ([conversation.conversationId isEqualToString:@"tingting4"]) {
                
                //抢单中心
                MY_TTLRushCenterViewController* ruVc = [[MY_TTLRushCenterViewController alloc]init];
                [self.controllerView.navigationController pushViewController:ruVc animated:YES];
                [conversation markAllMessagesAsRead:nil];
                
            } else if ([conversation.conversationId isEqualToString:@"tingting6"]) {
                
                //求约申请
                MY_TTLBegPackApplyViewController* begVc = [[MY_TTLBegPackApplyViewController alloc]init];
                [self.controllerView.navigationController pushViewController:begVc animated:YES];
                [conversation markAllMessagesAsRead:nil];
                
            } else if ([conversation.conversationId isEqualToString:@"kefu1"]) {
                
                //客服中心
                MY_TTLCustomerServiceViewController* cusVc = [[MY_TTLCustomerServiceViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
                cusVc.title = @"客服";
                [self.controllerView.navigationController pushViewController:cusVc animated:YES];
                
            } else*/
//             if ([conversation.conversationId isEqualToString:@"tingting5"]){
                //                系统通知
//                SystemMessageViewController* cusVc = [[SystemMessageViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
//                cusVc.hidesBottomBarWhenPushed=YES;
//
//                cusVc.title = @"系统通知";
//
//                [self.controllerView.navigationController pushViewController:cusVc animated:YES];
                
//            }else {
            
            if ([conversation.conversationId isEqualToString:@"tingting1"]) {
                MY_TTLOfficialNoticeViewController* cusVc = [[MY_TTLOfficialNoticeViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
                cusVc.hidesBottomBarWhenPushed=YES;
                cusVc.title = @"官方公告";
                [self.controllerView.navigationController pushViewController:cusVc animated:YES];
                
            }else if ([conversation.conversationId isEqualToString:@"tingting3"]) {
            
                // 俱乐部通知
                MY_TTLClubNoticeViewController* orderVc = [[MY_TTLClubNoticeViewController alloc]init];
                orderVc.title = @"俱乐部通知";
                [self.controllerView.navigationController pushViewController:orderVc animated:YES];
                [conversation markAllMessagesAsRead:nil];
                
            }
            else if ([conversation.conversationId isEqualToString:@"kefu1"]) {
                
                //客服中心
                MY_LLCustomerServiceViewController* cusVc = [[MY_LLCustomerServiceViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
                cusVc.title = @"客服";
//                cusVc.hidesBottomBarWhenPushed = YES;
                [self.controllerView.navigationController pushViewController:cusVc animated:YES];
                
            }
            else if ([conversation.conversationId isEqualToString:@"tingting5"] ) {
                
//                MY_LLPersonInfoModel * model = [[MY_LLPersonInfoModel alloc] init];
//                model.userId = conversation.conversationId.integerValue;
//                model.nickName = conversationModel.title;
//                model.headIcon = conversationModel.avatarURLPath;
                
                MY_XTSystemInfoViewController * chatController = [[MY_XTSystemInfoViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
//                chatController.model = model;
//                [chatController setHidesBottomBarWhenPushed:YES];
                [self.controllerView.navigationController pushViewController:chatController animated:YES];
                [conversation markAllMessagesAsRead:nil];
                
            }
            else if ([conversation.conversationId isEqualToString:@"vtimetask"]) {
                
                MY_LYVTaskViewController* cusVc = [[MY_LYVTaskViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
//                cusVc.hidesBottomBarWhenPushed=YES;
                cusVc.title = @"V任务";
                [self.controllerView.navigationController pushViewController:cusVc animated:YES];
            }
            else
            {
                // 如果是群聊
                if (conversation.type == EMConversationTypeGroupChat || conversation.type == EMConversationTypeChatRoom) {
                    
                    MY_GLClubModel * model = [[MY_GLClubModel alloc] init];
                    model.roomId =  conversation.ext[@"roomId"];
                    model.roomName = conversation.ext[@"groupNickName"];
                    model.roomHeadIcon = conversation.ext[@"groupAvaterURLPath"];
                    model.roomGroupId = conversation.conversationId;
                    model.location = conversation.ext[@"userLocation"];
                    
//                    model.userNum = conversation.®
                    NSLog(@"%@",conversation.ext);
                    //                    model.roomId = conversation.e
                    
                    MY_TTLClubChatViewController *clubChatVC = [[MY_TTLClubChatViewController alloc]initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
                    clubChatVC.groupModel = model;
                    clubChatVC.hidesBottomBarWhenPushed = YES;
                    [self.controllerView.navigationController pushViewController:clubChatVC animated:YES];

                }else{
                    
                    MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
                    model.userId = conversation.conversationId.integerValue;
                    model.nickName = conversationModel.title;
                    model.headIcon = conversationModel.avatarURLPath;
                    model.isNoble  =  [conversation.ext[@"noble"] integerValue];

                    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
                    chatController.model = model;
//                    [chatController setHidesBottomBarWhenPushed:YES];
                    [self.controllerView.navigationController pushViewController:chatController animated:YES];
                    [conversation markAllMessagesAsRead:nil];
                    
                }
                
            }
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setupUnreadMessageCount" object:nil];
        [self.tableView reloadData];
    }
}

#pragma mark - EaseConversationListViewControllerDataSource
- (id<IConversationModel>)conversationListViewController:(EaseConversationListViewController *)conversationListViewController modelForConversation:(EMConversation *)conversation
{
//    EMConversation* model = (EMConversation)conversation;
    EaseConversationModel *model = [[EaseConversationModel alloc] initWithConversation:conversation];
//    if (model.conversation.type == EMConversationTypeChat) {
//
//    } else
    
    if (model.conversation.type == EMConversationTypeGroupChat) {
//        NSString *imageName = @"groupPublicHeader";
        // 如果会话群组没有subject 就从自己加入的群组中找
//        NSLog(@"%@",conversation.ext);
        if (model.title != nil )
        {
            // 取出所有的群组
            NSArray *groupArray = [[EMClient sharedClient].groupManager getJoinedGroups];
            for (EMGroup *group in groupArray) {
                // 如果当前会话群组 = 你加入的某一群组   把 ext信息传给会话群组ext
                if ([group.groupId isEqualToString:conversation.conversationId]) {
                    NSMutableDictionary *ext = [NSMutableDictionary dictionaryWithDictionary:conversation.ext];
                    [ext setObject:group.subject forKey:@"subject"];
                    [ext setObject:[NSNumber numberWithBool:group.isPublic] forKey:@"isPublic"];
                    conversation.ext = ext;
                    break;
                }
            }
        }
//        NSDictionary *ext = conversation.ext;
//        model.title = [ext objectForKey:@"groupNickName"];
//
//        imageName = @"占位图";
//        model.avatarImage = [UIImage imageNamed:imageName];
//
//        model.avatarURLPath = ext[@"groupAvaterURLPath"];
    }
    return model;
}

- (NSAttributedString *)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
                latestMessageTitleForConversationModel:(id<IConversationModel>)conversationModel
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@""];
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];
    if (lastMessage) {
        NSString *latestMessageTitle = @"";
        EMMessageBody *messageBody = lastMessage.body;
        switch (messageBody.type) {
            case EMMessageBodyTypeImage:{
                latestMessageTitle = NSLocalizedString(@"[图片]", @"[image]");
            } break;
            case EMMessageBodyTypeText:{
                // 表情映射。
                NSString *didReceiveText = [EaseConvertToCommonEmoticonsHelper
                                            convertToSystemEmoticons:((EMTextMessageBody *)messageBody).text];
                latestMessageTitle = didReceiveText;
                if ([lastMessage.ext objectForKey:MESSAGE_ATTR_IS_BIG_EXPRESSION]) {
                    latestMessageTitle = @"[动画表情]";
                }
            } break;
            case EMMessageBodyTypeVoice:{
                latestMessageTitle = NSLocalizedString(@"[语音]", @"[voice]");
            } break;
            case EMMessageBodyTypeLocation: {
                latestMessageTitle = NSLocalizedString(@"[地理位置]", @"[location]");
            } break;
            case EMMessageBodyTypeVideo: {
                latestMessageTitle = NSLocalizedString(@"[视频]", @"[video]");
            } break;
            case EMMessageBodyTypeFile: {
                latestMessageTitle = NSLocalizedString(@"[文件]", @"[file]");
            } break;
            default: {
            } break;
        }
        
        if (lastMessage.direction == EMMessageDirectionReceive) {

            latestMessageTitle = [NSString stringWithFormat:@"%@", latestMessageTitle];
        }
        NSDictionary *ext = conversationModel.conversation.ext;
        
        NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
        if ( [typeStr isEqualToString:@"send_little_hongbao"] ||  [typeStr isEqualToString:@"sendHongbao"]) {
            if ([messageBody isKindOfClass:[EMTextMessageBody class]]) {
                latestMessageTitle = ((EMTextMessageBody *)messageBody).text;
                attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
            }
           
        }
        else if (ext && [ext[kHaveUnreadAtMessage] intValue] == kAtAllMessage) {
            latestMessageTitle = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"group.atAll", nil), latestMessageTitle];
            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
            [attributedStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:.0 blue:.0 alpha:0.5]} range:NSMakeRange(0, NSLocalizedString(@"group.atAll", nil).length)];
            
        }
        else if (ext && [ext[kHaveUnreadAtMessage] intValue] == kAtYouMessage) {
            latestMessageTitle = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"group.atMe", @"[Somebody @ me]"), latestMessageTitle];
            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
            [attributedStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:.0 blue:.0 alpha:0.5]} range:NSMakeRange(0, NSLocalizedString(@"group.atMe", @"[Somebody @ me]").length)];
        }
        else {
             attributedStr = [[EaseEmotionEscape sharedInstance] attStringFromTextForChatting:latestMessageTitle textFont: [UIFont systemFontOfSize:14]];
//            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
        }
    }
    
    return attributedStr;
}

- (NSString *)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
       latestMessageTimeForConversationModel:(id<IConversationModel>)conversationModel
{
    NSString *latestMessageTime = @"";
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];;
    if (lastMessage) {
        latestMessageTime = [NSDate formattedTimeFromTimeInterval:lastMessage.timestamp];
    }
    return latestMessageTime;
}


- (void)didReceiveMessages:(NSArray *)aMessages{
    
    [self tableViewDidTriggerHeaderRefresh];
}


#pragma mark - public

-(void)refresh
{
    [self refreshAndSortView];
}

-(void)refreshDataSource
{
    [self tableViewDidTriggerHeaderRefresh];
}

- (void)isConnect:(BOOL)isConnect{
    if (!isConnect) {
        self.tableView.tableHeaderView = _networkStateView;
    }
    else{
        self.tableView.tableHeaderView = nil;
    }
    
}

- (void)networkChanged:(EMConnectionState)connectionState
{
    if (connectionState == EMConnectionDisconnected) {
        self.tableView.tableHeaderView = _networkStateView;
    }
    else{
        self.tableView.tableHeaderView = nil;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
