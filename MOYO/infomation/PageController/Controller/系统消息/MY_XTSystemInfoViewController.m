//
//  MY_XTSystemInfoViewController.m
//  VTIME
//
//  Created by tingting on 2017/10/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTSystemInfoViewController.h"
#import "MessageSystemCell.h"               //  灰色系统消息
#import "RealTimeCallCell.h"                //  实时通话
#import "DemoCallManager.h"
#import "MY_LLPayViewController.h"             //  支付
#import "MY_LLBlackPaceter.h"
#import "MY_LLRedPacketCell.h"                 //  红包消息
#import "MY_LLSystemMessageCell.h"             //  系统消息
#import "MY_TTLMeModel.h"
#import "MY_XTSystemMessageCell.h"
#import "CRWebViewController.h"

#import "MY_XTFirstNoticeTableViewCell.h"
#import "MY_XTFirstNoticeListTableViewCell.h"
#import "MY_TTLInviteFriendViewController.h"
#import "MY_TTLUpHomePageViewController.h"
#import "MY_TTLToBeNobilityViewController.h"
#import "MY_TTLBodyInformationViewController.h"
#import "MY_LYMessageInfoModel.h"
@interface MY_XTSystemInfoViewController ()<EaseMessageViewControllerDelegate, EaseMessageViewControllerDataSource, EMCallEndDelegate>
{
    NSInteger _hid;
    //    MY_LLPersonInfoModel * _infoModel;
}

@property (nonatomic, strong) UIView * redPacketView;
@property (nonatomic, strong) UIAlertView * myAlertView;
@property (nonatomic, strong) UIAlertView * myAlertView2;
@property (nonatomic, strong) UIView * affirmView;
@property (nonatomic, copy) NSString * userId;
@property (nonatomic, copy) NSString * urllink;

@property (strong, nonatomic) MY_TTLMeModel* model;

@end

@implementation MY_XTSystemInfoViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //  隐藏TabBar
    self.tabBarController.tabBar.hidden = YES;
    
     [self.chatToolbar setHidden:YES];
    
    [TLHTTPRequest MY_getWithBaseUrl:UserInfoMineUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            self.model = [[MY_TTLMeModel alloc] init];
             NSDictionary *userDict = [data objectForKey:@"info"];
            [self.model setValuesForKeysWithDictionary:[userDict objectForKey:@"user"]];
            
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *mmodel = arry.firstObject;
//            MY_LLPersonInfoModel *mmodel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
            mmodel.headIcon = self.model.headIcon;
//            [[MessageInfoModel sharedManager] insertModelWith:mmodel];
            [[MY_LLDBManager sharedManager] updateModel:mmodel withWhere:where];
//            NSString *where = [NSString stringWithFormat:@"userId = %td", [USERID integerValue]];
//            [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//                for (BaseModel * model in dataArray) {
//                    if ([model isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                        MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)model;
//                        if (userModel.userId == [USERID integerValue]) {
//
//                            userModel.headIcon = self.model.headIcon;
//                            [[MY_LLDBManager sharedManager] updateModel:userModel withWhere:where];
//                        }
//                    }
//                }
//            }];
            
        }else {
            
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"cuowu");
    }];
    
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //  显示TabBar
    self.tabBarController.tabBar.hidden = NO;
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"系统通知";
//    self.userId = [NSString stringWithFormat:@"%td", self.model.userId];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [DemoCallManager sharedManager].delegate = self;
    
    CGRect rect = self.tableView.frame;
    rect.origin.y = 0;
    rect.size.height = rect.size.height+44;
    self.tableView.frame = rect;
    self.tableView.contentOffset = CGPointMake(0, 30);
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_XTFirstNoticeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_XTFirstNoticeTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MY_XTFirstNoticeListTableViewCell" bundle:nil] forCellReuseIdentifier:@"MY_XTFirstNoticeListTableViewCell"];
    
    self.view.backgroundColor = BGCOLOR;
    
    
    self.delegate = self;
    self.dataSource = self;
    
    self.showRefreshHeader = YES;
    
    //      右滑返回
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
//    [self addHeaderAffirmView];
    
//    [self addHeaderRedPacketView];
    
    [self setNavBarButton];
    
    //  两者之间的红包
//    [self getOrderRedPaceketStatus];
    
    [self update];
    
}

#pragma mark - 更新数据库
- (void)update {
    
//    MY_LLPersonInfoModel *mmodel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[self.model.userId integerValue]];
//    mmodel.headIcon = self.model.headIcon;
//    self.model.nickName = oldModel.nickName;
//    [[MessageInfoModel sharedManager] insertModelWith:self.model];
    NSString * where = [NSString stringWithFormat:@"userId = %td",[self.model.userId integerValue]];
    [[MY_LLDBManager sharedManager] updateModel:self.model withWhere:where];

//    NSString * where = [NSString stringWithFormat:@"userId = %td", self.model.userId];
//
//    [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//        MY_LLPersonInfoModel * oldModel = [[MY_LLPersonInfoModel alloc] init];
//
//        for (BaseModel * pModel in dataArray) {
//
//            if ([pModel isKindOfClass:[MY_LLPersonInfoModel class]]) {
//
//                MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)pModel;
//
//                if (userModel.userId == self.model.userId) {
//
//                    oldModel = userModel;
//                    [[MY_LLDBManager sharedManager] deleteDataClass:[MY_LLPersonInfoModel class] WithWhere:where];
//                }
//            }
//        }
//        if (!self.model.nickName) {
//            self.model.nickName = oldModel.nickName;
//        }
//        if (!self.model.headIcon) {
//            self.model.headIcon = oldModel.headIcon;
//        }
//        [[MY_LLDBManager sharedManager] insertWithModel:self.model];
//    }];
}

//  导航栏
- (void)setNavBarButton{
    
//    UIBarButtonItem * ringhtBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"EaseUIResource.bundle/figure"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(ringhtBatBtnClick)];
//    self.navigationItem.rightBarButtonItem = ringhtBarBtn;
    
    UIBarButtonItem * leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"backButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}

#pragma mark - 左边按钮点击
- (void)backClick{
    
//    if (self.isPayPush) {
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }
//    else {
        [self.navigationController popViewControllerAnimated:YES];
//    }
}

#pragma mrak - 自定义实时通话的Cell
- (UITableViewCell *)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel
{
    
    if ([messageModel isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSDictionary *ext = messageModel.message.ext;
    if (ext[@"xiTongMsgType"])
         {
    if ([ext[@"xiTongMsgType"] integerValue] == 1) {
        
                static NSString * cellId0 = @"MY_XTFirstNoticeTableViewCell";
        
                MY_XTFirstNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId0];
                if (cell == nil) {
                    cell = [[MY_XTFirstNoticeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId0];
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.Erweima sd_setImageWithURL:[NSURL URLWithString:ext[@"xiTongMsgFirstImgUrl"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        cell.Erweima.tag = 10001;
        
        //1.创建长按手势
        UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(imglongTapClick:)];
        
//        longTap.minimumPressDuration = 1;
//        longTap.numberOfTouchesRequired = 1;
//        longTap.allowableMovement = 100.0f;
        //2.开启人机交互
        cell.Erweima.userInteractionEnabled = YES;
        
        //2.添加手势
        [cell.Erweima addGestureRecognizer:longTap];
      
        

        NSArray *a = [[NSArray alloc]init];
        a = ext[@"xiTongMsgFirstList"];
        
        cell.NoticeLabel.text = [NSString stringWithFormat:@"        %@",ext[@"xiTongMsgFirstTitle"]];
        
        [cell.TagIcon1 sd_setImageWithURL:[NSURL URLWithString:[[ext[@"xiTongMsgFirstList"] objectAtIndex:0] objectForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        [cell.TagIcon2 sd_setImageWithURL:[NSURL URLWithString:[[ext[@"xiTongMsgFirstList"] objectAtIndex:1] objectForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        [cell.TagIcon3 sd_setImageWithURL:[NSURL URLWithString:[[ext[@"xiTongMsgFirstList"] objectAtIndex:2] objectForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        [cell.TagIcon4 sd_setImageWithURL:[NSURL URLWithString:[[ext[@"xiTongMsgFirstList"] objectAtIndex:3] objectForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
        
        cell.TagLabel1.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:0] objectForKey:@"title"];
        self.urllink = [[ext[@"xiTongMsgFirstList"] objectAtIndex:0] objectForKey:@"link"];
        cell.TagLabel2.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:1] objectForKey:@"title"];
        cell.TagLabel3.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:2] objectForKey:@"title"];
        cell.TagLabel4.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:3] objectForKey:@"title"];
        
        cell.TagInfoLabel1.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:0] objectForKey:@"msg"];
        cell.TagInfoLabel2.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:1] objectForKey:@"msg"];
        cell.TagInfoLabel3.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:2] objectForKey:@"msg"];
        cell.TagInfoLabel4.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:3] objectForKey:@"msg"];
        
        
        cell.view1.backgroundColor = self.tableView.backgroundColor;
        cell.view2.backgroundColor = self.tableView.backgroundColor;
        
        
        cell.clickview1.userInteractionEnabled = YES;
        cell.clickview1.tag = [[[ext[@"xiTongMsgFirstList"] objectAtIndex:0] objectForKey:@"id"] intValue];
        cell.clickview2.userInteractionEnabled = YES;
        cell.clickview2.tag = [[[ext[@"xiTongMsgFirstList"] objectAtIndex:1] objectForKey:@"id"] intValue];
        cell.clickview3.userInteractionEnabled = YES;
        cell.clickview3.tag = [[[ext[@"xiTongMsgFirstList"] objectAtIndex:2] objectForKey:@"id"] intValue];
        cell.clickview4.userInteractionEnabled = YES;
        cell.clickview4.tag = [[[ext[@"xiTongMsgFirstList"] objectAtIndex:3] objectForKey:@"id"] intValue];
        
        UITapGestureRecognizer *tapGesturRecognizer1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        UITapGestureRecognizer *tapGesturRecognizer2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        UITapGestureRecognizer *tapGesturRecognizer3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        UITapGestureRecognizer *tapGesturRecognizer4=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        [cell.clickview1 addGestureRecognizer:tapGesturRecognizer1];
        [cell.clickview2 addGestureRecognizer:tapGesturRecognizer2];
        [cell.clickview3 addGestureRecognizer:tapGesturRecognizer3];
        [cell.clickview4 addGestureRecognizer:tapGesturRecognizer4];
        
        
        
        if (![[NSUserDefaults standardUserDefaults] valueForKey:@"dianji1"])
        {
            [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"dianji1"];
            cell.Bradge1.hidden = NO;
        }
        else
        {
            if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"dianji1"] isEqualToString:@"YES"])
            {
                cell.Bradge1.hidden = YES;
            }
            else
            {
                cell.Bradge1.hidden = NO;
            }
        }
        
        if (![[NSUserDefaults standardUserDefaults] valueForKey:@"dianji2"])
        {
            [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"dianji2"];
            cell.Bradge2.hidden = NO;
        }
        else
        {
            if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"dianji2"] isEqualToString:@"YES"])
            {
                cell.Bradge2.hidden = YES;
            }
            else
            {
                cell.Bradge2.hidden = NO;
            }
        }
        
        if (![[NSUserDefaults standardUserDefaults] valueForKey:@"dianji3"])
        {
            [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"dianji3"];
            cell.Bradge3.hidden = NO;
        }
        else
        {
            if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"dianji3"] isEqualToString:@"YES"])
            {
                cell.Bradge3.hidden = YES;
            }
            else
            {
                cell.Bradge3.hidden = NO;
            }
        }
        
        
        
        
        
       
        if(a.count == 4)
        {
            
            
            if (![[NSUserDefaults standardUserDefaults] valueForKey:@"dianji5"])
            {
                [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"dianji5"];
                cell.Bradge4.hidden = NO;
            }
            else
            {
                if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"dianji5"] isEqualToString:@"YES"])
                {
                    cell.Bradge4.hidden = YES;
                }
                else
                {
                    cell.Bradge4.hidden = NO;
                }
            }
            
            
            cell.TagIcon5.hidden = YES;
            cell.TagLabel5.hidden = YES;
            cell.clickview5.hidden = YES;
            cell.TagInfoLabel5.hidden = YES;
            cell.RJT5.hidden = YES;
            cell.Bradge5.hidden = YES;
        }
        
        
        
        if(a.count == 5)
        {
            
            if (![[NSUserDefaults standardUserDefaults] valueForKey:@"dianji4"])
            {
                [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"dianji4"];
                cell.Bradge4.hidden = NO;
            }
            else
            {
                if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"dianji4"] isEqualToString:@"YES"])
                {
                    cell.Bradge4.hidden = YES;
                }
                else
                {
                    cell.Bradge4.hidden = NO;
                }
            }
            
            if (![[NSUserDefaults standardUserDefaults] valueForKey:@"dianji5"])
            {
                [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"dianji5"];
                cell.Bradge5.hidden = NO;
            }
            else
            {
                if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"dianji5"] isEqualToString:@"YES"])
                {
                    cell.Bradge5.hidden = YES;
                }
                else
                {
                    cell.Bradge5.hidden = NO;
                }
            }
            [cell.TagIcon5 sd_setImageWithURL:[NSURL URLWithString:[[ext[@"xiTongMsgFirstList"] objectAtIndex:4] objectForKey:@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
            cell.TagLabel5.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:4] objectForKey:@"title"];
            cell.TagInfoLabel5.text = [[ext[@"xiTongMsgFirstList"] objectAtIndex:4] objectForKey:@"msg"];
            cell.clickview5.userInteractionEnabled = YES;
            cell.clickview5.tag = [[[ext[@"xiTongMsgFirstList"] objectAtIndex:4] objectForKey:@"id"] intValue];
            UITapGestureRecognizer *tapGesturRecognizer4=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
             [cell.clickview5 addGestureRecognizer:tapGesturRecognizer4];
            
        }
        
        
        
        
        return cell;
        }
    else if ([ext[@"xiTongMsgType"] integerValue] == 0) {
        if(!ext[@"xiTongMsgDetail"])
        {
            static NSString * cId = @"MY_XTSystemMessageCell";
            
            //            if ([typeStr isEqualToString:@"askHongbaoSuccess"]) {
            //
            //                self.redPacketView.hidden = YES;
            //            }
            //            else {
            //                self.redPacketView.hidden = NO;
            //            }
            
            MY_XTSystemMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
            if (cell == nil) {
                cell = [[MY_XTSystemMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.messageLabel.text = messageModel.text;

            return cell;
        }
        else
        {
            static NSString * cellId1 = @"MY_XTFirstNoticeListTableViewCell";
            
            MY_XTFirstNoticeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId1];
            if (cell == nil) {
                cell = [[MY_XTFirstNoticeListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId1];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentView.backgroundColor = self.tableView.backgroundColor;
            
            cell.TagLabel.text = messageModel.text;
            cell.InfoLabel.text = ext[@"xiTongMsgDetail"];
            return cell;
        }
        
        
        
        
        
    }
//    if (ext[@"realTimeCall"]) {
//
//        static NSString * cId = @"RealTimeCallCell";
//
//        RealTimeCallCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
//        if (cell == nil) {
//            cell = [[RealTimeCallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId];
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        messageModel.avatarURLPath = ext[@"avatarURLPath"];
//        cell.model = messageModel;
//        return cell;
//    }
//    else if (ext[@"type"]) {
//
//        NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
//
//        if ([typeStr isEqualToString:@"askHongbao"]) {
//
//            static NSString * cId = @"MY_LLRedPacketCell";
//
//            MY_LLRedPacketCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
//            if (cell == nil) {
//                cell = [[MY_LLRedPacketCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId];
//            }
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//            [cell setMessageData:messageModel withUserId:self.userId];
//
//            cell.btnClickBlock = ^(BOOL isCancel) {
//
//                NSString *typeStr = ext[@"typeMsg"];
//
//                NSData *jsonData = [typeStr dataUsingEncoding:NSUTF8StringEncoding];
//                NSDictionary *typeMsg = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
//
//                [self grepRedPacketWith:!isCancel withHid:[typeMsg[@"hid"] integerValue]];
//            };
//
//            return cell;
//        }
         }
        else {
            static NSString * cId = @"MY_LLSystemMessageCell";
            
//            if ([typeStr isEqualToString:@"askHongbaoSuccess"]) {
//
//                self.redPacketView.hidden = YES;
//            }
//            else {
//                self.redPacketView.hidden = NO;
//            }
    
            MY_LLSystemMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
            if (cell == nil) {
                cell = [[MY_LLSystemMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.messageLabel.text = messageModel.text;
            return cell;
        }
//    }
    return nil;
}

-(void)tapAction:(UITapGestureRecognizer *)gesture
{
    if(gesture.view.tag == 1)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"dianji2"];
        NSIndexPath *indexPathA = [NSIndexPath indexPathForRow:1 inSection:0]; //刷新第0段第2行
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPathA,nil] withRowAnimation:UITableViewRowAnimationNone];
        MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//        noVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:noVc animated:YES];
    }
    else if(gesture.view.tag == 2)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"dianji3"];
        NSIndexPath *indexPathA = [NSIndexPath indexPathForRow:1 inSection:0]; //刷新第0段第2行
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPathA,nil] withRowAnimation:UITableViewRowAnimationNone];
        CRWebViewController* inviVc = [[CRWebViewController alloc]init];
//        inviVc.hidesBottomBarWhenPushed = YES;
        inviVc.webURL = [Utility getH5Url:InvitedFriendsURL(USERID)];
        inviVc.strTitle = @"邀请好友";
        inviVc.stringfrom = @"邀请好友";
        [self.navigationController pushViewController:inviVc animated:YES];
    }
    else if(gesture.view.tag == 3)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"dianji4"];
        NSIndexPath *indexPathA = [NSIndexPath indexPathForRow:1 inSection:0]; //刷新第0段第2行
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPathA,nil] withRowAnimation:UITableViewRowAnimationNone];
        MY_TTLUpHomePageViewController* homeVc = [[MY_TTLUpHomePageViewController alloc]init];
//        homeVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:homeVc animated:YES];
    }
    else if(gesture.view.tag == 4)
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"dianji5"];
        NSIndexPath *indexPathA = [NSIndexPath indexPathForRow:1 inSection:0]; //刷新第0段第2行
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPathA,nil] withRowAnimation:UITableViewRowAnimationNone];
        MY_TTLBodyInformationViewController* atVc = [[MY_TTLBodyInformationViewController alloc]init];
//        atVc.hidesBottomBarWhenPushed = YES;
        atVc.model = self.model;
        [self.navigationController pushViewController:atVc animated:YES];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"dianji1"];
        NSIndexPath *indexPathA = [NSIndexPath indexPathForRow:1 inSection:0]; //刷新第0段第2行
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPathA,nil] withRowAnimation:UITableViewRowAnimationNone];
        CRWebViewController * vc = [[CRWebViewController alloc] init];
        vc.strTitle = @"MOYO宝典";
        vc.webURL = self.urllink;
//        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
   
    
    
    
}

//长按手势
- (void)imglongTapClick:(UILongPressGestureRecognizer *)longPress{
    // 手势的状态
    if (longPress.state == UIGestureRecognizerStateBegan) {
        // 当手势的状态处于刚开始的状态
        
        self.myAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您要保存当前图片到相册中吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"保存", nil];
        [self.myAlertView show];
    }
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        // 保存照片
        UIImageView *myImageView = (UIImageView *)[self.view viewWithTag:10001];
        UIImageWriteToSavedPhotosAlbum(myImageView.image, self, @selector(image:didFinshSavingWithError:contextInfo:), nil);
    }
}

// 保存图片错误提示方法
- (void)image:(UIImage *)image didFinshSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *mes = nil;
    if (error != nil) {
        mes = @"保存图片失败";
    } else {
        mes = @"保存图片成功";
    }
    self.myAlertView2 = [[UIAlertView alloc] initWithTitle:@"提示" message:mes delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [self.myAlertView2 show];
    
    [NSTimer scheduledTimerWithTimeInterval:0.8f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
}

- (void)performDismiss:(NSTimer *)timer
{
    [self.myAlertView2 dismissWithClickedButtonIndex:0 animated:YES];
}



//  返回cell高度
- (CGFloat)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth
{
    
    if ([messageModel isKindOfClass:[NSString class]]) {
        return 0;
    }
    
    NSDictionary *ext = messageModel.message.ext;
    
    NSArray *a = [[NSArray alloc]init];
    
    a = ext[@"xiTongMsgFirstList"];
    
    if (ext[@"type"]) {
        
        NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
        
        if ([typeStr isEqualToString:@"askHongbao"]) {
            //  5 + 4 + 13 + 文字高度 + 13 + 29
            return 212 / 2 + 5 + 15;
        }
        else {
            CGFloat height = [Utility stringSizeWithString:messageModel.text textSize:12 width:SCREEN_WIDTH - 80 height:0].height;
            return height + 10 + 15 + 2;
        }
    }
    else if (ext[@"realTimeCall"]) {
        
        return 53;
    }
    else if([ext[@"xiTongMsgType"] integerValue] == 1)
    {
        if(a.count == 4)
        {
            return 386;
        }
        return 446;
    }
    else if([ext[@"xiTongMsgType"] integerValue] == 0)
    {
        if(!ext[@"xiTongMsgDetail"])
        {
            CGFloat height = [Utility stringSizeWithString:messageModel.text textSize:12 width:SCREEN_WIDTH - 60 height:0].height;
            
            return height + 40;
        }else
        {
            
            CGFloat height = [Utility stringSizeWithString:ext[@"xiTongMsgDetail"] textSize:13 width:SCREEN_WIDTH - 45 height:0].height;
            return height + 90;
            
            
        }
        
    }
    //    NSDictionary *ext = messageModel.message.ext;
    //    if ([RedpacketMessageModel isRedpacket:ext] || [RedpacketMessageModel isRedpacketTransferMessage:ext])    {
    //    }else if ([RedpacketMessageModel isRedpacketTakenMessage:ext]) {
    //        return [RedpacketTakenMessageTipCell heightForRedpacketMessageTipCell];
    //    }
    return 0;
}


//- (void)callDidEndSenderMessageWithDictionary:(NSDictionary *)dict{
//    
//    //  生成message
//    EMMessage * message = nil;
//    if ([dict[@"isCaller"] boolValue]) { //  主叫
//        
//        NSString * to = self.conversation.conversationId;
//        
//        message = [EaseSDKHelper sendTextMessage:dict[@"message"]
//                                              to:to
//                                     messageType:EMChatTypeChat
//                                      messageExt:dict];
//        
//        message.status = EMMessageStatusSucceed;
//        //        [[EMClient sharedClient].chatManager importMessages:@[message] completion:^(EMError *aError) {
//        //
//        //        }];
//        
//        [self sendTextMessage:dict[@"message"] withExt:dict];
//    }
//}

- (void)dealloc {
    
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
