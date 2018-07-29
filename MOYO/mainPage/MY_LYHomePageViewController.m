//
//  MY_TTLHomePageViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/6.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <AMapLocationKit/AMapLocationKit.h>

#import "MY_LYHomePageViewController.h"
#import "GuideTitleView.h"//  导航标题
#import "MY_TTLNewActiveViewController.h"
#import "MY_TTLNewJoinViewController.h"
#import "MY_TTLClubHomeViewController.h"
#import "MY_TTLSendMessageRedEnvelopView.h"

#import "MY_TTLClubChatViewController.h"//  世界频道
#import "FiltratePersonNearByView.h"    //筛选
#import "MY_LYLocationViewController.h"    //定位
#import "MY_LYActivityViewController.h"    //任务列表
#import "MY_GLTaskPageViewController.h"

//  活跃
#import "MY_GLAlivingViewController.h"

#import "MY_GLHomeAddStatusView.h"//挂状态
#import "CRSuspensionView.h"// 世界频道 横幅
#import "EndorsementWebViewController.h"//代言web

#import "LoginTipView.h"//  登录弹框
#import "MY_LYMessageInfoModel.h"

#import "MY_TTLNewPeopleGuideView.h"//新手指导
#import "HomeBlackView.h"
#import "CRWebViewController.h"//邀请好友
#import "MY_LLCreateClubsViewController.h"//创建俱乐部
#import "MY_GLClubListViewController.h"//  我的俱乐部列表
#import "MY_TTLToBeNobilityViewController.h"// 成为贵族

#import "MY_XTGuideViewController.h"// 广告页



@interface MY_LYHomePageViewController ()<GuideTitleViewDelegate,
UIPageViewControllerDataSource,UIPageViewControllerDelegate,
AMapLocationManagerDelegate>
{
    NSInteger HongBNum;
    CGFloat bugHight;
    CGFloat staHight;
    BOOL nation;
}

@property (strong, nonatomic) UIPageViewController  * pageViewController;
@property (strong, nonatomic) NSArray               * viewControllers;
@property (strong, nonatomic) GuideTitleView        * guideTitleView;
@property (nonatomic,strong) MY_LYPersonInfoModel * personalModel;
@property (nonatomic,strong) MY_TTLNewPwopleGuideModel * peopleModel;

@property (nonatomic, strong)UIButton * navLeftBtn;
@property (nonatomic, strong)UIButton * statusBtn;//挂状态
@property (nonatomic, strong)UIButton *bugleBtn;//任务
@property (nonatomic, strong)UIButton *inviteBtn;//邀请好友
@property (nonatomic, strong)MY_GLHomeAddStatusView * addStatusView;

@property (nonatomic, strong) AMapLocationManager *locationManager;

@property(strong,nonatomic)CRSuspensionView *suspensionView;
//@property(strong,nonatomic)HomeBlackView *blackV;

////  记录经纬度和城市
//@property(strong,nonatomic)MY_LLPersonInfoModel * locationModel;

@property(strong,nonatomic)NSTimer * locationTimer;

@property (nonatomic, strong) UIView        * backImageView;

@end

@implementation MY_LYHomePageViewController


#pragma mark - -  显示世界频道 在登录的前提下

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    if (USERID) {
        
        [self addSuspensionView];
        [self setupUnreadMessageCount];
        if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
            [self addrenwuButton];
#warning 新手指导
            if (!nation) {
                [self addNewPwopleComeView];
            }
        } else {
            self.statusBtn.hidden = YES;
            self.bugleBtn.hidden = YES;
            self.inviteBtn.hidden = YES;
        }
    if(hongbnum)
    {
        HongBNum = [hongbnum integerValue];
        [self.suspensionView.CRUnReadCount setHidden:NO];
        self.suspensionView.CRUnReadCount.text = [NSString stringWithFormat:@"%ld",HongBNum];
    }else
    {
        HongBNum = 0;
    }
    }
    [TLHTTPRequest MY_getWithBaseUrl:AddWorldChannel parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        //                 NSLog(@"加入世界频道成功");
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //忽略世界频道推送
            [[EMClient sharedClient].groupManager ignoreGroupPush:WorldChannelID ignore:YES];
        });
        NSLog(@"%@",data[@"msg"]);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 修改tabBra的frame
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = SCREEN_HEIGHT - TabbarHeight;
    frame.size.height = TabbarHeight;
    self.tabBarController.tabBar.frame = frame;
}

//改变任务按钮位置
//挂状态：女性用户 一直显示挂状态。。。男性用户不显示
//发布任务：男性，女性都可以看到
- (void)addrenwuButton{
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    _personalModel = arry.firstObject;
//    _personalModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    if (_personalModel.sex == 0) {
        self.statusBtn.hidden = NO;
        self.bugleBtn.hidden = NO;
        CGRect bugframe  = self.bugleBtn.frame;
        if (bugframe.origin.y != bugHight) {
            bugframe.origin.y = bugHight;
            self.bugleBtn.frame = bugframe;
            CGRect inviRect = self.inviteBtn.frame;
            inviRect.origin.y = self.bugleBtn.frame.origin.y - 61;
            self.inviteBtn.frame = inviRect;
        }
    }else{
        self.statusBtn.hidden = YES;
        self.bugleBtn.hidden = NO;
        CGRect bugframe  = self.bugleBtn.frame;
        if (bugframe.origin.y != staHight) {
            bugframe = self.statusBtn.frame;
            self.bugleBtn.frame = bugframe;
            CGRect inviRect = self.inviteBtn.frame;
            inviRect.origin.y = self.bugleBtn.frame.origin.y - 61;
            self.inviteBtn.frame = inviRect;
        }
    }
}
//添加新手引导
- (void)addNewPwopleComeView{
//    NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:NewPeople];
    //在这里解档;
    nation = NO;
    _peopleModel = [NSKeyedUnarchiver unarchiveObjectWithData:NewPeopleFirstCome];
    if (!_peopleModel) {
        _peopleModel = [[MY_TTLNewPwopleGuideModel alloc] init];
    }
    if (!_peopleModel.firstHomeWorld) {
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[self.suspensionView convertRect: self.suspensionView.bounds toView:window];
        rect.origin.y = self.suspensionView.frame.origin.y + StatusHeight +44;
        CGRect imgRect = CGRectMake(rect.origin.x + rect.size.width/2 +10, rect.origin.y-ScaleWidth(60) - 10, ScaleWidth(40), ScaleWidth(60));
        NSString *promptStr ;
        if (_personalModel.sex == 0) {
            promptStr = @"欢迎来到MOYO\n让我们先看看世界频道吧\n会有土豪哥哥发红包哦";
        }else{
            promptStr = @"欢迎来到MOYO\n让我们先看看世界频道吧";
        }
        MY_TTLNewPeopleGuideView *guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rect buttonImgName:nil imgFrame:imgRect guideImgName:@"世界频道指示" promptString:promptStr corneRadius:rect.size.height/2 Alpha:0.8];
        //跳转世界频道
        __weak typeof(self) weakSelf = self;
        guideView.actionBlock = ^{
            [weakSelf gotoWorldClub];
        };
        [guideView show];
        _peopleModel.firstHomeWorld = YES;
        NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:_peopleModel];
        ADDNewPeopleFirstCome(peopleData);
    }else if (!_peopleModel.firstHomeRenwu) {
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[self.bugleBtn convertRect: self.bugleBtn.bounds toView:window];
        CGRect imgRect = CGRectMake(rect.origin.x - ScaleWidth(47)+10, rect.origin.y-ScaleWidth(58), ScaleWidth(47), ScaleWidth(58));
        NSString *promptStr ;
        if (_personalModel.sex == 0) {
            promptStr = @"这里会有土豪哥哥发布任务哦";
        }else{
            promptStr = @"赶快发布个任务约个美女一起玩";
        }
        MY_TTLNewPeopleGuideView *guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rect buttonImgName:@"icon_didReadtask" imgFrame:imgRect guideImgName:@"首页任务指示" promptString:promptStr corneRadius:rect.size.height/2 Alpha:0.8];
        //跳转任务
        __weak typeof(self) weakSelf = self;
        guideView.actionBlock = ^{
            [weakSelf addBugleButtonClick:weakSelf.bugleBtn];
        };
        [guideView show];
        
        _peopleModel.firstHomeRenwu = YES;
        NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:_peopleModel];
        ADDNewPeopleFirstCome(peopleData);
    }

}

//世界频道
- (void)addSuspensionView {
    
    if (![self.suspensionView superview]) {
        
        self.suspensionView = [[CRSuspensionView alloc] initWithFrame:CGRectMake(7, SCREEN_HEIGHT - 49 - 31 - 14 - 64, ( SCREEN_WIDTH * 0.6 ) - (52 + 14 + 7), 31)];
        
        if (SCREEN_HEIGHT > 800) {
            CGRect rectV = self.suspensionView.frame;
            rectV.origin.y = rectV.origin.y - 58;
            self.suspensionView.frame = rectV;
        }
        __weak typeof(self) weakSelf = self;
        self.suspensionView.GotoWordChannelBlock = ^{
            [weakSelf gotoWorldClub];
        };
        MY_GLClubModel * clubModel = [[MY_GLClubModel alloc]init];
        clubModel.textMss = @"点击进入世界频道~";
        CGSize size = [Utility stringSizeWithString:clubModel.textMss textSize:12 width:0 height:16];
        clubModel.textWidth = @(size.width + 3);
        self.suspensionView.model = clubModel;
        
        //  设置frame 愚蠢的人类 约束不用 用这个
        CGRect rect = self.suspensionView.frame;
        rect.size.width = [clubModel.textWidth integerValue] + 2 + 46;
        self.suspensionView.frame = rect;
        [self.view addSubview:self.suspensionView];
        
    }
}
//跳转世界频道
- (void)gotoWorldClub{
    MY_GLClubModel * model = [[MY_GLClubModel alloc] init];
    model.roomId =  @(0);
    model.roomName = @"世界频道";
    //    model.roomHeadIcon = conversation.ext[@"groupAvaterURLPath"];
    model.roomGroupId = WorldChannelID;
    model.location = @"全国";
    MY_TTLClubChatViewController *clubChatVC = [[MY_TTLClubChatViewController alloc]initWithConversationChatter:WorldChannelID conversationType:EMConversationTypeGroupChat];
    clubChatVC.groupModel = model;
//    clubChatVC.hidesBottomBarWhenPushed = YES;

    MY_TTLNewActiveViewController * activeVC = (MY_TTLNewActiveViewController*) self.viewControllers[0];
    [activeVC.controllerView.navigationController pushViewController:clubChatVC animated:YES];
}

// 读消息 展示到 suspensionView
-(void)setupUnreadMessageCount
{
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    for (EMConversation *conversation in conversations) {
         if (conversation.type == EMConversationTypeGroupChat){
             
            // 世界频道的消息
            if ([conversation.conversationId isEqualToString: WorldChannelID]) {
                
                if (USERID) {
                    
                    [self addSuspensionView];
                    
                    EMMessage * mess = conversation.latestMessage;
                    
                    MY_GLClubModel * clubModel = [[MY_GLClubModel alloc]init];
                    clubModel.roomHeadIcon = mess.ext[@"avatarURLPath"];
                    
                    clubModel.textMss = [self showWithMessage:mess];
                    if (![clubModel.textMss length]) {
                        clubModel.textMss = @"点击进入世界频道~";
                    }
                    
                    CGFloat maxWidth = ( SCREEN_WIDTH * 0.6 ) - (52 + 14 + 7 + 50);

                    CGSize size = [Utility stringSizeWithString:clubModel.textMss textSize:12 width:0 height:16];
                
                    //  如果size>maxWidth
                    if (size.width >= maxWidth) {
                        size.width = maxWidth;
                    }
                    clubModel.textWidth = @(size.width + 3);
                    self.suspensionView.model = clubModel;
                    CGRect rect = self.suspensionView.frame;

                    if (conversation.unreadMessagesCount > 0) {
//                        //  设置frame 愚蠢的人类 约束不用 用这个
//                        [self.suspensionView.CRUnReadCount setHidden:NO];
                        
                        if([conversation.latestMessage.ext[@"type"] isEqualToString:@"sendMultipleHongbao"])
                        {
                            rect.size.width = [clubModel.textWidth integerValue] + 48 + 32;
                            
                        }
                        else
                        {
                            if(hongbnum)
                            {
                                rect.size.width = [clubModel.textWidth integerValue] + 48 + 32;
                            }
                            else{
                                rect.size.width = [clubModel.textWidth integerValue] + 48;
                            }
                            
                        }
                        
                    }
                    else{
//                        //  设置frame 愚蠢的人类 约束不用 用这个
////                        CGRect rect = self.suspensionView.frame;
                    
                        rect.size.width = [clubModel.textWidth integerValue] + 48;
                    }
                
//                    if (conversation.unreadMessagesCount > 99) {
//                        self.badgeView.text = @"99";
//                        self.suspensionView.CRUnReadCount.text = @"99";
//                    }
//                    else{
//                        self.badgeView.text = [NSString stringWithFormat:@"%ld", (long)_badge];
//                        self.suspensionView.CRUnReadCount.text = [NSString stringWithFormat:@"%ld", (long)conversation.unreadMessagesCount];
//                    }
  
                    self.suspensionView.frame = rect;
                }
            }
        }
    }
}

// 显示消息类型
-(NSString*)showWithMessage:(EMMessage*)message{
    
//    EMPushOptions *options = [[EMClient sharedClient] pushOptions];
//    NSString *alertBody = nil;
    //    if (options.displayStyle == EMPushDisplayStyleMessageSummary) {
    EMMessageBody *messageBody = message.body;
    NSString *messageStr = nil;
    switch (messageBody.type) {
        case EMMessageBodyTypeText:
        {
            messageStr = ((EMTextMessageBody *)messageBody).text;
        }
            break;
        case EMMessageBodyTypeImage:
        {
            messageStr = NSLocalizedString(@"[图片]", @"Image");
        }
            break;
        case EMMessageBodyTypeLocation:
        {
            messageStr = NSLocalizedString(@"[定位]", @"Location");
        }
            break;
        case EMMessageBodyTypeVoice:
        {
            messageStr = NSLocalizedString(@"[语音]", @"Voice");
        }
            break;
        case EMMessageBodyTypeVideo:{
            messageStr = NSLocalizedString(@"[视频]", @"Video");
        }
            break;
        default:
            break;
    }
    return messageStr;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [Utility colorWithHexString:@"262626" alpha:1];
    
    [[EaseEmotionEscape sharedInstance]setEaseEmotionEscapePattern:@"\\[.+?\\]"];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"emjList.plist" ofType:nil];
    NSDictionary *emjDict = [NSDictionary dictionaryWithContentsOfFile:path];
    [[EaseEmotionEscape sharedInstance]setEaseEmotionEscapeDictionary:emjDict];
    // Do any additional setup after loading the view.
//    _personalModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    _personalModel = arry.firstObject;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUnreadMessageCount) name:@"setupUnreadMessageCount" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeUnread) name:@"REMOVEUNREAD" object:nil];
    nation = NO;
    if (USERID) {
        nation = YES;
        if ([Utility isAuditEnvironment] == NO) {   //非审核
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNewPwopleComeView) name:@"KNoticaationFirstComeHome" object:nil];
        }
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    
    if(hongbnum)
    {
        HongBNum = [hongbnum integerValue];
//        [self.suspensionView.CRUnReadCount setHidden:NO];
//        self.suspensionView.CRUnReadCount.text = [NSString stringWithFormat:@"%ld",HongBNum];
    }else
    {
        HongBNum = 0;
    }
    [self createHeaderLeftItem];
    [self createHeaderRightItem];
    [self uiConfig];
    
    [self setupMapLocation];
    

    self.locationTimer = [NSTimer scheduledTimerWithTimeInterval:30 * 60  target:self selector:@selector(requestLocation) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.locationTimer forMode:NSRunLoopCommonModes];
   
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(requestLocation) name:@"KNoticaationRequestLocation" object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showDaiyanView) name:KNoticationDaiyan object:nil];
//    [self requestLocation];

    
    
    
}

- (void)setupMapLocation{
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    //设置期望定位精度
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    //设置定位超时时间
    [self.locationManager setLocationTimeout:DefaultLocationTimeout];
    
    //设置逆地理超时时间
    [self.locationManager setReGeocodeTimeout:DefaultReGeocodeTimeout];
}
-(void)createHeaderRightItem
{
    [self addNavBtn:nil isLeft:NO target:self action:@selector(rightChooseClick) bgImageName:@"homeChoose"];
}

-(void)hideHeaderRightItem
{
//    [self addNavBtn:nil isLeft:NO target:self action:nil bgImageName:nil];
    [self addNavBtn:nil isLeft:NO target:self action:@selector(rightJuLeBuClick) bgImageName:@"homePage_addClub"];

}

-(void)rightChooseClick
{
    //修改资料
//    MY_GLEditMyInfoViewController * vc = [MY_GLEditMyInfoViewController new];
//    
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    FiltratePersonNearByView * filtrateView = [[FiltratePersonNearByView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    //      筛选
    filtrateView.blockFiltrate=^(NSDictionary * selectParmeter){
        
        // 找到当前在显示的页面索引
        NSInteger index = [_guideTitleView getCurrentSelectedIndex] - defaultSelectInteger;
        
        // 根据索引找到 viewConreoller
        
        UIViewController * VC = [self.viewControllers objectAtIndex:index];
        
        if (0 == index) {
            
            MY_TTLNewActiveViewController * newVC = (MY_TTLNewActiveViewController *)VC;
            //  把筛选的值传到 vc
            [newVC.selecteDictionary setDictionary:selectParmeter];
            
            // 刷新vc
            [newVC.tableView.mj_header beginRefreshing];
            
        }else if (1 == index){
            
            MY_GLAlivingViewController * joinVC = (MY_GLAlivingViewController*)VC;

            //  把筛选的值传到 vc
            [joinVC.selecteDictionary setDictionary:selectParmeter];
            
            // 刷新vc
            [joinVC.tableView.mj_header beginRefreshing];
        }else if (2 == index){
            
            MY_TTLNewJoinViewController * joinVC = (MY_TTLNewJoinViewController*)VC;
            
            //  把筛选的值传到 vc
            [joinVC.selecteDictionary setDictionary:selectParmeter];
            
            // 刷新vc
            [joinVC.tableView.mj_header beginRefreshing];
        }
    };
    [filtrateView addWindowForView];
}

#pragma mark - - 点击俱乐部标签  右边显示加号按钮（点击创建俱乐部查看我的俱乐部）
-(void)rightJuLeBuClick{
    
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
    
    if([[NSString stringWithFormat:@"%@",uModel.iscreateClub] integerValue] == 1)
    {
        MY_GLClubListViewController * clubListVC = [[MY_GLClubListViewController alloc]init];
        [self.navigationController pushViewController:clubListVC animated:YES];
    }
    else
    {
        MY_LLCreateClubsViewController* inviVc = [[MY_LLCreateClubsViewController alloc]init];
//        inviVc.hidesBottomBarWhenPushed = YES;
        //            inviVc.model = self.model;
        [self.navigationController pushViewController:inviVc animated:YES];
    }
}



-(void)createHeaderLeftItem
{
     self.navLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //设置图片
//    UIImage *imageForButton = [UIImage imageNamed:@"locationHome"];
//    [ self.navLeftBtn setImage:imageForButton forState:UIControlStateNormal];
    [ self.navLeftBtn addTarget:self action:@selector(leftMapClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置文字
//    NSString *buttonTitleStr = @"上海";
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    if(uModel.selectRegion.length <1 ){//是否有地理位置信息
        uModel.selectRegion = @"上海";
    }
    [self.navLeftBtn setTitle:uModel.selectRegion forState:UIControlStateNormal];
    self.navLeftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.navLeftBtn setTitleColor:[Utility colorWithHexString:@"8c8d88" alpha:1] forState:UIControlStateNormal];
    
//    CGSize buttonTitleLabelSize = [buttonTitleStr sizeWithAttributes:@{NSFontAttributeName: self.navLeftBtn.titleLabel.font}]; //文本尺寸
//    if (buttonTitleLabelSize.width > 60) {
//        buttonTitleLabelSize = CGSizeMake(60, buttonTitleLabelSize.height);
//    }
//    CGSize buttonImageSize = [UIImage imageNamed:@"locationHome"].size;   //图片尺寸
//     self.navLeftBtn.frame = CGRectMake(0,0,buttonImageSize.width + buttonTitleLabelSize.width,buttonImageSize.height);
    
    self.navLeftBtn.frame = CGRectMake(0,0,40,16);
    [self.navLeftBtn sizeToFit];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView: self.navLeftBtn];
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
}

#pragma amrk - - 点击地址（选择地区）
-(void)leftMapClick
{
    //  如果您不是贵族 不能改变城市
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
    if (uModel.isNoble > 0) {
        MY_LYLocationViewController * locationVC = [[MY_LYLocationViewController alloc] init];
        locationVC.vcTitle = @"城市";
        locationVC.isHomePage = YES;
        
        __weak typeof(self) wSelf = self;
        
        locationVC.changeLocationBlock = ^(NSString * cityName){
            
            [wSelf.navLeftBtn setTitle:cityName forState:UIControlStateNormal];
            
#warning 刷新列表
            
            [self refreshActiceViewController:cityName];
            [self refresJhoinViewController:cityName];
            [self refresALivingViewController:cityName];
            
        };
        
        [self.navigationController pushViewController:locationVC animated:YES];
      
    }else{
          ALERT_SHOW(nil, @"很抱歉！因为您不是贵族所以无法选择其他城市", self, @"取消", @"成为贵族");
    }
    
    
}

#pragma mnark - - 跳转成为贵族
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([alertView.message isEqualToString:@"很抱歉！因为您不是贵族所以无法选择其他城市"]) {
        if (1 == buttonIndex) {
            //  成为贵族
            MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];

//            noVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:noVc animated:YES];
        }
    }
}


#pragma mark - UI相关
- (void)uiConfig{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
        
    //    CGFloat origin_x = SCREEN_WIDTH/2 - (SCREEN_WIDTH/2)/2;
    CGFloat origin_y = 20;
    
    //    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(origin_x, origin_y, SCREEN_WIDTH/2, origin_y*2)];
    
    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(0, origin_y, SCREEN_WIDTH * 0.67, origin_y*2)];
    
    [_guideTitleView setGuideWithTitle:@[@"附近",@"活跃", @"最新",@"  俱乐部"]];
    _guideTitleView.guideDelegate = self;
    self.navigationItem.titleView = _guideTitleView;
    
    if (self.pageViewController) {
        [self.view addSubview:self.pageViewController.view];
    }
    
    self.statusBtn.frame = CGRectMake(SCREEN_WIDTH - 12 - 51, SCREEN_HEIGHT - 49 - 20 - 51 - 49 , 51, 51);
    
    self.bugleBtn.frame = CGRectMake(SCREEN_WIDTH - 12 - 51, SCREEN_HEIGHT - 49 - 20 - 51 - 49- 51- 10 , 51, 51);
    if (SCREEN_HEIGHT > 800) {
        CGRect rectS = self.statusBtn.frame;
        rectS.origin.y = rectS.origin.y - 58;
        self.statusBtn.frame = rectS;
        CGRect rectB = self.bugleBtn.frame;
        rectB.origin.y = rectB.origin.y - 58;
        self.bugleBtn.frame = rectB;
    }
    bugHight = self.bugleBtn.frame.origin.y;
    staHight = self.statusBtn.frame.origin.y;
    [self.view addSubview:self.statusBtn];
    [self.view addSubview:self.bugleBtn];
    [self.view addSubview:self.inviteBtn];
    
    self.inviteBtn.frame = CGRectMake(self.bugleBtn.frame.origin.x, self.bugleBtn.frame.origin.y - 61, 51, 51);
    
}

//- (void)addBuglebutton{
//    if (![self.bugleBtn superview]) {
//        self.bugleBtn.frame = CGRectMake(SCREEN_WIDTH - 12 - 51, SCREEN_HEIGHT - 49 - 20 - 51 - 49- 51- 10 , 51, 51);
//    }
//}

#pragma mark ## 挂状态按钮加载
//挂状态：女性用户 一直显示挂状态。。。男性用户不显示-----
- (UIButton *)statusBtn{
    if (!_statusBtn) {
        _statusBtn.hidden = YES;
        _statusBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [_statusBtn setImage:[UIImage imageNamed:@"home_addStatus"] forState:UIControlStateNormal];

        [_statusBtn addTarget:self action:@selector(addStatusBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _statusBtn;
}
    
#pragma mark ## 喇叭
//#warning  发布任务 男性，女性都可以看到
- (UIButton *)bugleBtn {
    if (!_bugleBtn) {
        _bugleBtn.hidden = YES;
        _bugleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [_bugleBtn setImage:[UIImage imageNamed:@"icon_didReadtask"] forState:UIControlStateNormal];
        
        [_bugleBtn addTarget:self action:@selector(addBugleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _bugleBtn;
}
//#warning  邀请好友
- (UIButton *)inviteBtn {
    if (!_inviteBtn) {
        _inviteBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        [_inviteBtn setImage:[UIImage imageNamed:@"icon_inviteFriend"] forState:UIControlStateNormal];
        
        [_inviteBtn addTarget:self action:@selector(addInviteButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _inviteBtn;
}

- (void)addInviteButtonClick{
    CRWebViewController * inviVc = [[CRWebViewController alloc]init];
//    inviVc.hidesBottomBarWhenPushed = YES;
    inviVc.webURL = [Utility getH5Url:HomeInvilFriendURL];
    inviVc.strTitle = @"邀请好友";
    inviVc.stringfrom = @"邀请好友";
    [self.navigationController pushViewController:inviVc animated:YES];
}

- (void)addBugleButtonClick:(UIButton*)sender{
    
//    跳转任务界面
    [sender setImage:[UIImage imageNamed:@"icon_didReadtask"] forState:UIControlStateNormal];
    MY_GLTaskPageViewController * taskVC = [[MY_GLTaskPageViewController alloc]init];
//    taskVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:taskVC animated:YES];
    
    
//    MY_TTLSendMessageRedEnvelopView * redEnvelopView = [[MY_TTLSendMessageRedEnvelopView alloc] init];
//
//    redEnvelopView.affirmBtnblock = ^(NSInteger price) {
    
//        MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
//        payVC.userId = [NSString stringWithFormat:@"%td", [mod.userId integerValue]];
//        payVC.price = [NSString stringWithFormat:@"%td", price];
//        payVC.payType = 1;
//        payVC.headIconStr = mod.headIcon;
//        payVC.nickName = mod.nickName;
//        payVC.redType = RedPacket_sayHolle;
//        [weakSelf.controllerView.navigationController pushViewController:payVC animated:YES];
//    };
  
//    [redEnvelopView show];
}
-(UIPageViewController*)pageViewController{
    if (!_pageViewController) {
        //  附近 活跃 最新 俱乐部
        MY_TTLNewActiveViewController * actVc       = [[MY_TTLNewActiveViewController alloc]init];
        MY_GLAlivingViewController * huoyue       = [[MY_GLAlivingViewController alloc]init];
        MY_TTLNewJoinViewController   * joinVC      = [[MY_TTLNewJoinViewController alloc]init];
        MY_TTLClubHomeViewController  * clubVc      = [[MY_TTLClubHomeViewController alloc]init];
        actVc.userModel = self.personalModel;
        huoyue.userModel = self.personalModel;
        joinVC.userModel = self.personalModel;

        actVc.controllerView = self;
        huoyue.controllerView = self;
        joinVC.controllerView = self;
        clubVc.controllerView = self;
        _viewControllers = @[actVc,huoyue, joinVC,clubVc];
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.dataSource  = self;
        _pageViewController.delegate    = self;
        [_pageViewController setViewControllers:@[_viewControllers[0]] direction:0 animated:NO completion:nil];
        _pageViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _pageViewController;
}

#pragma mark - 世界频道
//- (void)addSuspensionView {
////    UIWindow * window = [UIApplication sharedApplication].keyWindow;
////    CRSuspensionView *suspensionView = [[CRSuspensionView alloc] initWithFrame:CGRectMake(5, SCREEN_HEIGHT - 60, 190, 60)];
//    suspensionView.model = self.ownerModel;
//    [window addSubview:suspensionView];
//}

#pragma mark - 代理相关
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index = [_viewControllers indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return _viewControllers[index - 1];
    
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [_viewControllers indexOfObject:viewController];
    if (index == _viewControllers.count - 1) {
        return nil;
    }
    return _viewControllers[index + 1];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    
    UIViewController *vc = pageViewController.viewControllers[0];
    NSInteger index = [_viewControllers indexOfObject:vc];
    [_guideTitleView changeSelectedIndex:index + defaultSelectInteger];
    if(index == 3)
    {
//        [self.statusBtn setHidden:YES];
        [self hideHeaderRightItem];
    }
    else
    {
//        [self.statusBtn setHidden:NO];
        [self createHeaderRightItem];
    }
}

#pragma mark ++ 点击导航标题delegate
-(void)guideTitleView:(GuideTitleView *)guideView SelectedIndex:(NSInteger)currentIndex{
    
    if (currentIndex < guideView.currentSelectedIndex - defaultSelectInteger) {
        [_pageViewController setViewControllers:@[_viewControllers[currentIndex]]
                                      direction:1 animated:YES completion:nil];
        
        if(currentIndex == 3)
        {
//            [self.statusBtn setHidden:YES];
            [self hideHeaderRightItem];
        }
        else
        {
//            [self.statusBtn setHidden:NO];
            [self createHeaderRightItem];
        }
    }
    else if (currentIndex > guideView.currentSelectedIndex - defaultSelectInteger){
        [_pageViewController setViewControllers:@[_viewControllers[currentIndex]]
                                      direction:0 animated:YES completion:nil];
        
        if(currentIndex == 3)
        {
//            [self.statusBtn setHidden:YES];
            [self hideHeaderRightItem];
        }
        else
        {
//            [self.statusBtn setHidden:NO];
            [self createHeaderRightItem];
        }
        
    }
    else return;
}

// 显示介绍
-(void)addStatusBtnButtonClick:(UIButton*)sender{
    
    // GetFirstStatement 挂状态请求  canStatement 是否可以挂
    
    [TLHTTPRequest MY_postWithBaseUrl:GetFirstStatement parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            if ([data[@"info"][@"canStatement"] integerValue]) { // 1 可以挂状态
                BOOL isfirst = [data objectForKey:@"firstStatement"];//[1]    (null)    @"canStatement" : (long)1
                // YES 是第一次 显示介绍 否则不显示
                
                MY_GLHomeAddStatusView * addStatusView = [[MY_GLHomeAddStatusView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withInstroduce:isfirst];
                
                [[UIApplication sharedApplication].keyWindow addSubview:addStatusView];
            }else{
                
                // 不能挂状态
                [LQProgressHud showMessage:@"请先到我的-上首页哦！"];
            }
           
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
}

#pragma mark - - 定位
- (void)requestLocation {
    //进行单次带逆地理定位请求
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error) {
            [self.navLeftBtn setTitle:@"上海" forState:UIControlStateNormal];
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied && [self.personalModel.inIndex integerValue] == 1){ //没有开启定位
                UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                     [self changeLocationWithCity:@"角落里" address:nil longitude:@"90.0" latitude:@"90.0"];
                }];
                UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //跳转到定位权限页面
                    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    if( [[UIApplication sharedApplication] canOpenURL:url] ) {
                        [[UIApplication sharedApplication] openURL:url];
                    }
                }];
                UIAlertController * alertCrtl = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"未开启定位，请立即设置"] preferredStyle:UIAlertControllerStyleAlert];
                
                [alertCrtl addAction:cancelAction];
                [alertCrtl addAction:confirmAction];
                
                [self presentViewController:alertCrtl animated:YES completion:nil];
            }else{
                [self changeLocationWithCity:@"角落里" address:nil longitude:@"90.0" latitude:@"90.0"];
            }
        } else {
            NSMutableString * address = [NSMutableString stringWithFormat:@"%@%@%@%@", regeocode.city, regeocode.district, regeocode.street, regeocode.number];
            NSString * longitude = [NSString stringWithFormat:@"%f", location.coordinate.longitude];
            NSString * latitude = [NSString stringWithFormat:@"%f", location.coordinate.latitude];
            NSString * city = [NSString stringWithFormat:@"%@", regeocode.city];
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *model = arry.firstObject;
//            MY_LLPersonInfoModel * model = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
            NSMutableString * cityName = [NSMutableString stringWithFormat:@"%@", regeocode.city];
            if ([Utility isBlankString:cityName]) {
                cityName = [NSMutableString stringWithFormat:@"角落里"];
            }else{
                [cityName deleteCharactersInRange:NSMakeRange(cityName.length - 1, 1)];
            }
            //角落里说明定位失败或没有城市，重新定位不用提示
            if (![model.region isEqualToString:cityName] && model.region.length >0 && ![model.region isEqualToString:@"角落里"]) {

                UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

                }];
                UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                    [self changeLocationWithCity:cityName address:address longitude:longitude latitude:latitude];
                }];
                
                UIAlertController * alertCrtl = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"定位您在%@，是否切换？", city] preferredStyle:UIAlertControllerStyleAlert];
                [alertCrtl addAction:cancelAction];
                [alertCrtl addAction:confirmAction];

                [self presentViewController:alertCrtl animated:YES completion:nil];
            }
            else{
                [self changeLocationWithCity:cityName address:address longitude:longitude latitude:latitude];
            }
            
        }
    }];
}

- (void)changeLocationWithCity:(NSString *)city address:(NSString *)address longitude:(NSString *)longitude latitude:(NSString *)latitude {
//    NSMutableString * cityName = [NSMutableString stringWithFormat:@"%@", city];
//    [cityName deleteCharactersInRange:NSMakeRange(cityName.length - 1, 1)];
//    dispatch_async(dispatch_get_main_queue(), ^{
    
//        CGSize navBtnSize = [Utility stringSizeWithString:cityName textSize:14 width:0 height:18];
//        
//        CGFloat width = navBtnSize.width;
//        
//        if (width > 75) {
//            
//            width = 75;
//        }
//        CGRect rect = self.navLeftBtn.frame;
//        
//        rect.size.width = width + 18;
//        
//        self.navLeftBtn.frame = rect;
//    });
//    储存数据库
//    NSLog(@"HomePage:longitude-- %@  latitude-- %@",longitude,latitude);
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *uModel = arry.firstObject;
    
//    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    if(uModel.selectRegion.length <1 ){//是否有地理位置信息
        uModel.selectRegion = @"上海";
    }

    [self.navLeftBtn setTitle: uModel.selectRegion forState:UIControlStateNormal];
    uModel.region = city;
    uModel.longitude = longitude;
    uModel.latitude = latitude;
    [[MY_LLDBManager sharedManager] updateModel:uModel withWhere:where];
    
//    储存此此数据为了请求首页信息
    // 找到当前在显示的页面索引
    // 根据索引找到 viewConreoller

//    [self refreshActiceViewController:nil];
//    [self refresJhoinViewController:nil];
//    [self refresALivingViewController:nil];

    [TLHTTPRequest MY_postWithBaseUrl:EditInfoUrl parameters: @{@"region":city,@"longitude":longitude,@"latitude":latitude} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {

        if ([[data objectForKey:@"ret"] integerValue] == 0) {
//            self.changeLocationBlock(region);
//            [self updateUserInfoMethod:region];
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"定位失败"];
    }];

}

//刷新home附近页面

- (void)refreshActiceViewController:(NSString*)city{
    if (city == nil) {
        return;
    }
    UIViewController * VC = [self.viewControllers objectAtIndex:0];
    
    MY_TTLNewActiveViewController * newVC = (MY_TTLNewActiveViewController *)VC;
    
    //    [newVC.selecteDictionary setObject:longitude forKey:@"longitude"];
    //    [newVC.selecteDictionary setObject:latitude forKey:@"latitude"];
    newVC.userModel.selectRegion = city;
    [newVC.selecteDictionary setObject:city forKey:@"region"];
    
    if(USERID){
        [newVC headerRefreshing];
    }
}

//刷新home最新页面
- (void)refresALivingViewController:(NSString*)city{
    if (city == nil) {
        return;
    }
    //  根据
    UIViewController * vc1 = [self.viewControllers objectAtIndex:2];
    
    MY_TTLNewJoinViewController * joinVC = (MY_TTLNewJoinViewController*)vc1;
    joinVC.userModel.selectRegion = city;
    //    [joinVC.selecteDictionary setObject:longitude forKey:@"longitude"];
    //    [joinVC.selecteDictionary setObject:latitude forKey:@"latitude"];
    [joinVC.selecteDictionary setObject:city forKey:@"region"];
    
    if(USERID){
        [joinVC headerRefreshing];
    }
}



//刷新home活跃页面
- (void)refresJhoinViewController:(NSString*)city{
    if (city == nil) {
        return;
    }
    //  根据
    UIViewController * vc1 = [self.viewControllers objectAtIndex:1];

    MY_GLAlivingViewController * joinVC = (MY_GLAlivingViewController*)vc1;
    joinVC.userModel.selectRegion = city;
    //    [joinVC.selecteDictionary setObject:longitude forKey:@"longitude"];
    //    [joinVC.selecteDictionary setObject:latitude forKey:@"latitude"];
    [joinVC.selecteDictionary setObject:city forKey:@"region"];

    if(USERID){
        [joinVC headerRefreshing];
    }
}
#pragma mark - 极光推送动态消息
- (void)networkDidReceiveMessage:(NSNotification *)not{
    
    NSDictionary * userInfo = not.userInfo;
    if ([userInfo[@"title"] isEqualToString:INVITE]) {
        
        //  邀请好友弹框
        
        LoginTipView * tipView = [[[NSBundle mainBundle] loadNibNamed:@"LoginTipView" owner:self options:nil] lastObject];
        tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:tipView];
        
    }
    else if([userInfo[@"title"] isEqualToString:@"世界红包"])
    {
        HongBNum ++ ;
        self.suspensionView.CRUnReadCount.hidden = NO;
        NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
        for (EMConversation *conversation in conversations) {
            EMMessage * mess = conversation.latestMessage;
            MY_GLClubModel * clubModel = [[MY_GLClubModel alloc]init];
            clubModel.roomHeadIcon = mess.ext[@"avatarURLPath"];
            clubModel.textMss = [self showWithMessage:mess];
            CGFloat maxWidth = ( SCREEN_WIDTH * 0.6 ) - (52 + 14 + 7 + 50);
            CGSize size = [Utility stringSizeWithString:clubModel.textMss textSize:12 width:0 height:16];
            //  如果size>maxWidth
            if (size.width >= maxWidth) {
                size.width = maxWidth;
            }
            clubModel.textWidth = @(size.width + 3);
            self.suspensionView.model = clubModel;
            CGRect rect = self.suspensionView.frame;
            rect.size.width = [clubModel.textWidth integerValue] + 48 + 32;
            self.suspensionView.frame = rect;
            self.suspensionView.CRUnReadCount.text = [NSString stringWithFormat:@"%ld",HongBNum];
            
        }
        
        NSString *hbn = [NSString stringWithFormat:@"%ld",HongBNum];
        ADDHBnoti(hbn);
        
    }  else if([userInfo[@"title"] isEqualToString:@"代言"]){ //我为V时代代言
        
        if (![Utility isAuditEnvironment]) {//  正式环境
            NSString *urlStr =  [NSString stringWithFormat:@"%@?userId=%@",userInfo[@"content"],USERID];
            ADDDaiYanURL(urlStr);
//            UIViewController *vc = [Utility currentViewController];
//            if (vc == self) {
            
//            }else{
//                NSString *urlStr =  [NSString stringWithFormat:@"%@?userId=%@",userInfo[@"content"],USERID];
//                ADDDaiYanURL(urlStr);
//            }
            
        }
    }else if([userInfo[@"title"] isEqualToString:@"有人发布了一个新任务"]){ //新任务
//        NSLog(@"nontion - %@",userInfo);
//        if (![Utility isAuditEnvironment]) {//  正式环境
            [_bugleBtn setImage:[UIImage imageNamed:@"icon_unReadtask"] forState:UIControlStateNormal];
//        }
    }
}
- (void)showDaiyanView{
    if (DaiYanURL) {
        EndorsementWebViewController * addStatusView = [[EndorsementWebViewController alloc]init];
        addStatusView.webURL = DaiYanURL;
        [[UIApplication sharedApplication].keyWindow addSubview:addStatusView.view];
        REMDaiYanURL;
    }
    
}
//-  (UIViewController*)currentViewController{
//    UIViewController *vc = [UIApplication rootViewController];
//
//    while (1) {
//        if ([vc isKindOfClass:[UITabBarController class]]) {
//            vc = ((UITabBarController*)vc).selectedViewController;
//        }
//
//        if ([vc isKindOfClass:[UINavigationController class]]) {
//            vc = ((UINavigationController*)vc).visibleViewController;
//        }
//
//        if (vc.presentedViewController) {
//            vc = vc.presentedViewController;
//        }else{
//            break;
//        }
//    }
//
//    return vc;
//}

-(void)removeUnread
{
    HongBNum = 0;
    REMHB;
    [self.suspensionView.CRUnReadCount setHidden:YES];
}
- (void)dealloc{
    [self.locationTimer invalidate];
    self.locationTimer =nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
