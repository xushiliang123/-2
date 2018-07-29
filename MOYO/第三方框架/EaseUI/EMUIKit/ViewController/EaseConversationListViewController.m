/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import "EaseConversationListViewController.h"

#import "EaseEmotionEscape.h"
#import "EaseConversationCell.h"
#import "EaseConvertToCommonEmoticonsHelper.h"
#import "EaseMessageViewController.h"
#import "NSDate+Category.h"
#import "EaseLocalDefine.h"
#import "UserProfileManager.h"
#import "MY_LYMessageInfoModel.h"
@interface EaseConversationListViewController ()
{
    UIImageView * _imageView;
    UILabel * _placeLabel;
    
}
@end

@implementation EaseConversationListViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"setupUnreadMessageCount" object:nil];
    
    
    [self tableViewDidTriggerHeaderRefresh];
    [self registerNotifications];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self unregisterNotifications];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    CGFloat y = ([UIScreen mainScreen].bounds.size.height - 150 - 64 -49) / 2;
    
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 115) / 2;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, 115, 110)];
    
    _imageView.image = [UIImage imageNamed:@"EaseUIResource.bundle/noMessage"];
    
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _imageView.layer.masksToBounds = YES;
    
    [self.view addSubview:_imageView];
    
    _placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 23, [UIScreen mainScreen].bounds.size.width, 17)];
    _placeLabel.text = @"你居然不聊天···";
    _placeLabel.textAlignment = NSTextAlignmentCenter;
    _placeLabel.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1.0];
    [self.view addSubview:_placeLabel];
    
    CGRect rect = self.tableView.frame;
    rect.size.height = [UIScreen mainScreen].bounds.size.height;
    self.tableView.frame = rect;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:248 / 255.0 green:248 / 255.0 blue:248 / 255.0 alpha:1.0];
    
//    [self tableViewDidTriggerHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -EMChatManagerDelegate
- (void)messagesDidReceive:(NSArray *)aMessages{
//    [self refreshAndSortView];
    for (NSInteger i = 0; i < aMessages.count; i++) {
        EMMessage * fromMessage = aMessages[i];
        NSDictionary *extDict = fromMessage.ext;

        
        
    }
    
    
    [self tableViewDidTriggerHeaderRefresh];
    
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (self.dataArray.count > 0) {
        _imageView.hidden = YES;
        _placeLabel.hidden = YES;
    } else {
        _imageView.hidden = NO;
        _placeLabel.hidden = NO;
    }
    
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [EaseConversationCell cellIdentifierWithModel:nil];
    EaseConversationCell *cell = (EaseConversationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[EaseConversationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if ([self.dataArray count] <= indexPath.row) {
        return cell;
    }
    id<IConversationModel> model = [self.dataArray objectAtIndex:indexPath.row];
    cell.model = model;
    
    if (_dataSource && [_dataSource respondsToSelector:@selector(conversationListViewController:latestMessageTitleForConversationModel:)]) {
        NSMutableAttributedString *attributedText = [[_dataSource conversationListViewController:self latestMessageTitleForConversationModel:model] mutableCopy];
        [attributedText addAttributes:@{NSFontAttributeName : cell.detailLabel.font} range:NSMakeRange(0, attributedText.length)];
        
        cell.detailLabel.attributedText =  attributedText;
    } else {
        cell.detailLabel.attributedText =  [[EaseEmotionEscape sharedInstance] attStringFromTextForChatting:[self _latestMessageTitleForConversationModel:model]textFont:cell.detailLabel.font];
    }
    
    if (_dataSource && [_dataSource respondsToSelector:@selector(conversationListViewController:latestMessageTimeForConversationModel:)]) {
        cell.timeLabel.text = [_dataSource conversationListViewController:self latestMessageTimeForConversationModel:model];
    } else {
        cell.timeLabel.text = [self _latestMessageTimeForConversationModel:model];
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EaseConversationCell cellHeightWithModel:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_delegate && [_delegate respondsToSelector:@selector(conversationListViewController:didSelectConversationModel:)]) {
        EaseConversationModel *model = [self.dataArray objectAtIndex:indexPath.row];
        [_delegate conversationListViewController:self didSelectConversationModel:model];
    } else {
        EaseConversationModel *model = [self.dataArray objectAtIndex:indexPath.row];
        EaseMessageViewController *viewController = [[EaseMessageViewController alloc] initWithConversationChatter:model.conversation.conversationId conversationType:model.conversation.type];
        viewController.title = model.title;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (self.dataArray.count) {
            EaseConversationModel *model = [self.dataArray objectAtIndex:indexPath.row];
            [[EMClient sharedClient].chatManager deleteConversation:model.conversation.conversationId isDeleteMessages:YES completion:nil];
            [self.dataArray removeObjectAtIndex:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}

//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}

#pragma mark - data
-(void)refreshAndSortView
{
    if ([self.dataArray count] > 1) {
        if ([[self.dataArray objectAtIndex:0] isKindOfClass:[EaseConversationModel class]]) {
            NSArray* sorted = [self.dataArray sortedArrayUsingComparator:
                               ^(EaseConversationModel *obj1, EaseConversationModel* obj2){
                                   EMMessage *message1 = [obj1.conversation latestMessage];
                                   EMMessage *message2 = [obj2.conversation latestMessage];
                                   if(message1.timestamp > message2.timestamp) {
                                       return(NSComparisonResult)NSOrderedAscending;
                                   }else {
                                       return(NSComparisonResult)NSOrderedDescending;
                                   }
                               }];
            [self.dataArray removeAllObjects];
            [self.dataArray addObjectsFromArray:sorted];
        }
    }
    
    [self.tableView reloadData];
    
}

/*!
 @method
 @brief 加载会话列表
 @discussion
 @result
 */
- (void)tableViewDidTriggerHeaderRefresh
{
    
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSArray* sorted = [conversations sortedArrayUsingComparator:
                       ^(EMConversation *obj1, EMConversation* obj2){
                           EMMessage *message1 = [obj1 latestMessage];
                           EMMessage *message2 = [obj2 latestMessage];
                           if(message1.timestamp > message2.timestamp) {
                               return(NSComparisonResult)NSOrderedAscending;
                           }else {
                               return(NSComparisonResult)NSOrderedDescending;
                           }
                       }];
    
    [self.dataArray removeAllObjects];
    
    for (NSInteger i = 0; i < sorted.count; i++) {
        
        EMConversation * converstion = sorted[i];
        
//        NSDictionary * dic = converstion.ext;
        EaseConversationModel *model = nil;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(conversationListViewController:modelForConversation:)]) {
            model = [self.dataSource conversationListViewController:self
                                                   modelForConversation:converstion];
        }
        else{
            model = [[EaseConversationModel alloc] initWithConversation:converstion];
        }
        
        if (model) {
            if ([model.conversation.conversationId isEqualToString:WorldChannelID]) continue;
            EMMessage * fromMessage = model.conversation.latestMessageFromOthers;
            EMMessage * lastMessage = model.conversation.latestMessage;
//            if (!fromMessage && !lastMessage) {
//                return;
//            }
            NSDictionary * ext = lastMessage.ext;
//            NSLog(@"to:%@  --from:%@  conversi:%@",)
            NSString * to = nil;
            if (!fromMessage) {
                if (lastMessage.direction == EMMessageDirectionSend) {
                    to = lastMessage.to;
                }
                else {
                   to = lastMessage.from;
                }
//                ext = lastMessage.ext;
            }
            else {
                to = fromMessage.conversationId;
                ext = fromMessage.ext;
            }

            if (!to) {
                to = model.conversation.conversationId;
            }
            NSString * nickName = [Utility setNickNameWithConversationId:to];
            
            UIImage * avatarImage = [self setHeadIconWithConversationId:to];
//            if ([to isEqualToString:@"vtimetask"]) { //v任务
//
//            }else
            if ([to isEqualToString:@"kefu1"] || [to isEqualToString:@"tingting1"] || [to isEqualToString:@"tingting5"] || [to isEqualToString:@"tingting3"] || [to isEqualToString:VTaskM]) { //tingting1   tingting5
                NSString *nicStr = ext[@"nickname"];
                NSString *avarStr = ext[@"avatarURLPath"];
                if (nicStr.length >0) {
                    model.title = nicStr;
                    model.avatarURLPath = avarStr;
                }
                model.conversation.ext = ext;
            }else if(converstion.type == EMConversationTypeGroupChat){//先从对话中的message取
                NSString *nicGRStr = [ext objectForKey:@"groupNickName"];
                NSString *avaterGRStr = ext[@"groupAvaterURLPath"];
                if (nicGRStr.length >0 && avaterGRStr.length> 0) {
                    model.title = nicGRStr;
                    model.avatarURLPath = avaterGRStr;
                    
                }else{   //取不到再到converstion取
                    NSDictionary *nExt = converstion.ext;
                     model.title = [nExt objectForKey:@"groupNickName"];
                     model.avatarURLPath = nExt[@"groupAvaterURLPath"];
            
                }
                if (ext) {
                     model.conversation.ext = ext;
                }
                NSString * imageName = @"占位图";
                model.avatarImage = [UIImage imageNamed:imageName];
                
            }else{
                NSLog(@"%@",USERID);
                NSString * where = [NSString stringWithFormat:@"userId = %td",[to integerValue]];
                NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
                MY_LYPersonInfoModel *personModel = arry.firstObject;
//                MY_LLPersonInfoModel *personModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:to.integerValue];
                //           UserProfileEntity *proe = [[UserProfileManager sharedInstance] getUserProfileByUsername:model.conversation.conversationId];
                
                NSString *nicStr = ext[@"nickname"];
                NSString *avarStr = ext[@"avatarURLPath"];
                if (personModel) {
                    
                    model.title = personModel.nickName;
                    model.avatarURLPath = personModel.headIcon;
                    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithDictionary:ext];
                    if (!ext[@"noble"]) {
                        
                        mdict[@"noble"] = @(personModel.isNoble);
                    }
                    
                    ext = mdict;
                }else{
                    model.title = nicStr;
                    model.avatarURLPath = avarStr;
                    if (fromMessage || lastMessage.direction != EMMessageDirectionSend) {
                        MY_LYPersonInfoModel *pmodel = [[MY_LYPersonInfoModel alloc]init];
                        pmodel.userId = to.integerValue;
                        pmodel.nickName = nicStr;
                        pmodel.headIcon = avarStr;
//                        [[MessageInfoModel sharedManager] insertModelWith:pmodel];

                        [[MY_LLDBManager sharedManager] insertWithModel:pmodel];
                    }
//                    [self insertDBUserId:pmodel.userId headIcon:pmodel.headIcon nickName:pmodel.nickName];
                }
                model.conversation.ext = ext;
            }
            
            if (!model.title ) {
                model.title = nickName;
            }
            if (!model.avatarURLPath && !avatarImage) {
               model.avatarImage = [UIImage imageNamed:@"8686"];
            }
            
            if (![model.title isEqualToString:WorldChannelID]) {
                 [self.dataArray addObject:model];
            }

        }
    }
    [self.tableView reloadData];
    [self tableViewDidFinishTriggerHeader:YES reload:NO];
}

  //数据库没有数据添加到数据库中
//- (void)insertDBUserId:(NSString *)userId headIcon:(NSString *)headIcon nickName:(NSString *)nickName {
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        MY_LLPersonInfoModel * model = [[MY_LLPersonInfoModel alloc] init];
//        model.headIcon = headIcon;
//        model.nickName = nickName;
//        model.userId = userId.integerValue;
//        [[MY_LLDBManager sharedManager] insertWithModel:model];
//    });
//}
//  设置头像
- (UIImage *)setHeadIconWithConversationId:(NSString *)conversationId {
    
    UIImage * avatarImage = nil;
    //  头像
    if ([conversationId isEqualToString:@"tingting1"]) {
        avatarImage = [UIImage imageNamed:@"占位图"];//EaseUIResource.bundle/gfgg
    }
    else if ([conversationId isEqualToString:@"tingting2"]) {
        avatarImage = [UIImage imageNamed:@"EaseUIResource.bundle/giftsrecord"];
    }
    else if ([conversationId isEqualToString:@"tingting3"]) {
        avatarImage = [UIImage imageNamed:@"EaseUIResource.bundle/ordernews"];
    }
    else if ([conversationId isEqualToString:@"tingting4"]) {
        avatarImage = [UIImage imageNamed:@"EaseUIResource.bundle/qdcenter"];
    }
    else if ([conversationId isEqualToString:@"tingting5"]) {
        avatarImage = [UIImage imageNamed:@"EaseUIResource.bundle/systemnews"];
    }
    else if ([conversationId isEqualToString:@"tingting6"]) {
        avatarImage = [UIImage imageNamed:@"EaseUIResource.bundle/qysq"];
    }
    else if ([conversationId isEqualToString:@"kefu1"]) {
        avatarImage = [UIImage imageNamed:@"占位图"];
       
    }
    return avatarImage;
}



#pragma mark - EMGroupManagerDelegate
- (void)didUpdateGroupList:(NSArray *)groupList
{
    [self tableViewDidTriggerHeaderRefresh];
}

#pragma mark - registerNotifications
-(void)registerNotifications{
    [self unregisterNotifications];
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].groupManager addDelegate:self delegateQueue:nil];
}

-(void)unregisterNotifications{
    [[EMClient sharedClient].chatManager removeDelegate:self];
    [[EMClient sharedClient].groupManager removeDelegate:self];
}

- (void)dealloc{
    [self unregisterNotifications];
}

#pragma mark - private

/*!
 @method
 @brief 获取会话最近一条消息内容提示
 @discussion
 @param conversationModel  会话model
 @result 返回传入会话model最近一条消息提示
 */
- (NSString *)_latestMessageTitleForConversationModel:(id<IConversationModel>)conversationModel
{
    NSString *latestMessageTitle = @"";
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];
    if (lastMessage) {
        EMMessageBody *messageBody = lastMessage.body;
        switch (messageBody.type) {
            case EMMessageBodyTypeImage:{
                latestMessageTitle = NSEaseLocalizedString(@"[图片]", @"[image]");
            } break;
            case EMMessageBodyTypeText:{
                NSString *didReceiveText = [EaseConvertToCommonEmoticonsHelper
                                            convertToSystemEmoticons:((EMTextMessageBody *)messageBody).text];
                latestMessageTitle = didReceiveText;
            } break;
            case EMMessageBodyTypeVoice:{
                latestMessageTitle = NSEaseLocalizedString(@"[语音]", @"[voice]");
            } break;
            case EMMessageBodyTypeLocation: {
                latestMessageTitle = NSEaseLocalizedString(@"[地理位置]", @"[location]");
            } break;
            case EMMessageBodyTypeVideo: {
                latestMessageTitle = NSEaseLocalizedString(@"message.video1", @"[video]");
            } break;
            case EMMessageBodyTypeFile: {
                latestMessageTitle = NSEaseLocalizedString(@"message.file1", @"[file]");
            } break;
            default: {
            } break;
        }
    }
    return latestMessageTitle;
}

/*!
 @method
 @brief 获取会话最近一条消息时间
 @discussion
 @param conversationModel  会话model
 @result 返回传入会话model最近一条消息时间
 */
- (NSString *)_latestMessageTimeForConversationModel:(id<IConversationModel>)conversationModel
{
    NSString *latestMessageTime = @"";
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];;
    if (lastMessage) {
        double timeInterval = lastMessage.timestamp ;
        if(timeInterval > 140000000000) {
            timeInterval = timeInterval / 1000;
        }
        NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"YYYY-MM-dd"];
        latestMessageTime = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
    }
    return latestMessageTime;
}

@end
