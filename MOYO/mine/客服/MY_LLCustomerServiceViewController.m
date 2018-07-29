//
//  MY_LLCustomerServiceViewController.m
//  VTIME
//
//  Created by Louie on 2017/9/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLCustomerServiceViewController.h"

@interface MY_LLCustomerServiceViewController ()<EaseMessageViewControllerDelegate, EaseMessageViewControllerDataSource>

@end

@implementation MY_LLCustomerServiceViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //  隐藏TabBar
    self.tabBarController.tabBar.hidden = YES;
//    self.tabBarController.tabBar.bounds = CGRectMake(0, 0, 0, 0);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //  显示TabBar
    self.tabBarController.tabBar.hidden = NO;
//    self.tabBarController.tabBar.bounds = CGRectMake(0, self.view.frame.origin.y - 64, self.view.frame.size.width, 49);
    
    [self.chatToolbar endEditing:YES];
//    [[EMClient sharedClient].cha]
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //  右滑返回
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
    [self setNavBarButton];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         [self addMessage];
    });
    
    if ([self.conversation.conversationId isEqualToString:@"kefu1"]) {
        [self.chatBarMoreView hidenItematIndex:1];
        [self.chatBarMoreView hidenItematIndex:3];
        [self.chatBarMoreView hidenItematIndex:4];
    }
}


- (void)setNavBarButton{
    
    UIBarButtonItem * leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"backButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}

-(void)addMessage
{

//    EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:@"要发送的消息"];
//    NSString *from = [[EMClient sharedClient] currentUsername];
//
//    //生成Message
//    EMMessage *message = [[EMMessage alloc] initWithConversationID:@"kefu1" from:from to:@"6001" body:body ext:nil];
//    message.chatType = EMChatTypeChat;// 设置为单聊消息
    EMMessage * message = nil;
    EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"尊贵的MOYO用户，您好，欢迎您使用MOYO，如果您在使用过程中有任何问题或者意见反馈，可以给我们留言或者发送图片的形式，我们可能不能及时回复，但是我们会尽快为您处理，您也可以添加我们的客服微信"];
    NSString * from = [[EMClient sharedClient] currentUsername];
    NSString * to = self.conversation.conversationId;
    NSMutableDictionary * ext = [NSMutableDictionary dictionary];//
    [ext setObject:@"http://time.tingting365.com/images/kefu1.png" forKey:@"avatarURLPath"];
    [ext setObject:@"客服" forKey:@"nickname"];
    [ext setObject:@"kefu1" forKey:@"callType"];

    

    message = [[EMMessage alloc] initWithConversationID:@"kefu1" from:to to:from body:body ext:ext];
    message.direction =EMMessageDirectionReceive;
    message.chatType = EMChatTypeChat;
    message.status = EMMessageStatusSucceed;//
    [self addMessageToDataSource:message progress:nil];//
    [[EMClient sharedClient].chatManager importMessages:@[message] completion:^(EMError *aError)
     {
         
     }];

    
    EMError * error = [[EMError alloc] init];//
    [self.conversation insertMessage:message error:&error];
    

    NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"erweima"]);
    EMImageMessageBody *imgBody = [[EMImageMessageBody alloc]initWithData:data thumbnailData:data];
//    imgBody.type = EMMessageBodyTypeImage;
    imgBody.downloadStatus = EMDownloadStatusSuccessed;
    imgBody.thumbnailDownloadStatus = EMDownloadStatusSuccessed;
    NSMutableDictionary * imgext = [NSMutableDictionary dictionary];//
    [imgext setObject:@"http://time.tingting365.com/images/kefu1.png" forKey:@"avatarURLPath"];
    [imgext setObject:@"客服" forKey:@"nickname"];
    [imgext setObject:@"kefu1" forKey:@"callType"];
    
    EMMessage * imgmessage = nil;
    imgmessage = [[EMMessage alloc] initWithConversationID:@"kefu1" from:to to:from body:imgBody ext:imgext];
    imgmessage.direction =EMMessageDirectionReceive;
    imgmessage.chatType = EMChatTypeChat;
    imgmessage.status = EMMessageStatusSucceed;//
    [self addMessageToDataSource:imgmessage progress:nil];//
    [[EMClient sharedClient].chatManager importMessages:@[imgmessage] completion:^(EMError *aError)
     {
         
     }];
    EMError * error1 = [[EMError alloc] init];//
    [self.conversation insertMessage:imgmessage error:&error1];
    
    

}

#pragma mark - EaseMessageViewControllerDelegate
- (id<IMessageModel>)messageViewController:(EaseMessageViewController *)viewController
                           modelForMessage:(EMMessage *)message {
    
    id<IMessageModel> model = nil;
    model = [[EaseMessageModel alloc] initWithMessage:message];
    
    if (model.isSender) { //    自己头像
        
//        model.avatarURLPath = UserObject(@"headIcon");
//        model.nickname = UserObject(NickName);
        
    } else {    //  别人头像
        
        model.avatarURLPath = message.ext[@"avatarURL"];
        model.nickname = message.ext[@"nickname"];
    }
    
    model.failImageName = @"EaseUIResource.bundle/imageDownloadFail";
    return model;
}

#pragma mark - - 收到消息
- (void)messageViewController:(EaseMessageViewController *)viewController
            didReceiveMessage:(EMMessage *)message{
    id<IMessageModel> model = nil;
    model = [[EaseMessageModel alloc] initWithMessage:message];
    NSDictionary *ext = model.message.ext;
    
}

#pragma mrak - 自定义实时通话的Cell
- (UITableViewCell *)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel
{
    
    if ([messageModel isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSDictionary *ext = messageModel.message.ext;
    
    
    return nil;
}



//  返回cell高度
- (CGFloat)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth
{
    return 100;
}

//如果是登录状态 接收消息走的是接收在线消息的回调方法
-(void)didReceiveMessage:(EMMessage *)message
{
    NSLog(@"在线消息");
}
//如果是离线状态 走的是接收离线消息的回调方法
- (void)didReceiveOfflineMessages:(NSArray *)offlineMessages
{

}

#pragma mark - 左边按钮点击
- (void)backClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)dealloc{
    
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
