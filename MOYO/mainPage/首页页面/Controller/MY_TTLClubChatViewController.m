//
//  MY_TTLClubChatViewController.m
//  VTIME
//
//  Created by 听听 on 2017/10/17.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubChatViewController.h"
#import "MessageSystemCell.h"               //  灰色系统消息
#import "RealTimeCallCell.h"                //  实时通话
#import "DemoCallManager.h"
#import "MY_LLPayViewController.h"             //  支付
#import "MY_LLBlackPaceter.h"
#import "MY_LLRedPacketCell.h"                 //  红包消息
#import "MY_LLSystemMessageCell.h"
#import "MY_TTLClubInputChatView.h"
#import "MY_TTLClubChatCell.h"
#import "MY_GLRedPacketView.h"
#import "MY_TTLClubHongBaoCell.h"
#import "MY_GLBaPingView.h"
#import "MY_GLBaPingExampleView.h"

#import "MY_XTUserBPView.h"

#import "MY_GLOpenRedPackertView.h"// 抢红包页
#import "MY_TTLClubRedPackListViewController.h"// 红包详情页
#import "MY_TTLClubDetailViewController.h"
#import "MY_TTLFullScreenPhotoCell.h"
#import "MY_LYMessageInfoModel.h"
#import "MY_LYRedPackertViewController.h"//  发红包
#import "HomeBlackView.h"
#import "MY_GLTaskPageViewController.h"
#import "CRWebViewController.h"
#import "MY_TTLHongBaoClickPopView.h"

typedef enum : NSUInteger {
    HongBaoNoSnatch =0,      //红包未抢
    HongBaoHasSnatch,          //红包已抢
    HongBaoSnatchComplete,       // 红包已抢完
} HongBaoState;
@interface MY_TTLClubChatViewController ()<EaseMessageViewControllerDelegate,EaseMessageViewControllerDataSource,
EMCallEndDelegate,ClubHongBaoCellDelegate,ClubFullScreenCellDelegate,myBtnDelegate,MY_LLPayViewControllerDelegate,MY_LLChatRedPacketSayHWViewDelegate>
{
    NSInteger _hid;
    NSString *_localAddress;
    MY_GLBaPingView *_PopView;
    MY_GLBaPingExampleView *_PopView2;
//    MY_XTUserBPView *pView;
    BOOL _isShowBroadCastView;
}
//@property (nonatomic, strong) UIView * redPacketView;
@property (nonatomic, strong) UIView * affirmView;
//@property (nonatomic, copy) NSString * userId;
@property (nonatomic, strong)UIButton * BaPingBtn;
@property (nonatomic, strong)UIButton * HongBaoBtn;
@property (nonatomic, strong)UIButton * inviteBtn;
@property (strong, nonatomic) SXPickPhoto* pickPhoto;//相册类
@property (strong, nonatomic) NSMutableArray* arrayPage;//图片数组
@property (strong, nonatomic) NSMutableDictionary* DicPage;//霸屏元素
@property (nonatomic,strong) UIImage *BPimg;
//@property (nonatomic, strong)MY_LLPersonInfoModel * infoModel;
@property (nonatomic,strong) UIView  *hbBpView;
@property (nonatomic,strong) UIView  *broadCastView;
@property (nonatomic,strong) NSMutableArray  *broadCastArray;
@property (strong,nonatomic) MY_TTLNewPwopleGuideModel *peopleModel;
@property (strong,nonatomic) MY_TTLNewPeopleGuideView *guideView;


@end

@implementation MY_TTLClubChatViewController
//- (instancetype)initWithConversationChatter:(NSString *)conversationChatter conversationType:(EMConversationType)conversationType{
//    self =  [super initWithConversationChatter:conversationChatter conversationType:conversationType];
//    if (self) {
//
//    }
//    return self;
//}
- (NSMutableArray *)broadCastArray{
    if (!_broadCastArray) {
        _broadCastArray = [NSMutableArray array];
    }
    return _broadCastArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _isShowBroadCastView = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateClubModel:) name:@"KNoticationUpdateClubModel" object:nil];  //俱乐部资料修改通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PAYSuccess:) name:@"PAYSUC" object:nil];
    if (!self.groupModel.roomId.intValue) { //世界频道添加广播通知；
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiceBroadCastNotication:) name:@"KNoticationBroadCast" object:nil];
    }
    self.title = self.groupModel.roomName;
    [self setchatTooBarSubView];
    [self.DicPage setObject:self.groupModel.roomId forKey:@"clubId"];
    [self.DicPage setObject:@(1) forKey:@"num"];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [DemoCallManager sharedManager].delegate = self;
    self.pickPhoto = [[SXPickPhoto alloc]init];
    self.view.backgroundColor = RGBCOLOR(16, 16, 16, 1.0);
    self.delegate = self;
    self.dataSource = self;
    self.showRefreshHeader = YES;
    self.tableView.backgroundColor = RGBCOLOR(16, 16, 16, 1.0);
//    [self selPersonalDB];
//    [self addbroadcastView];
    [self addHonbaoView];
    [self setNavBarButton];
    [self GetBP];

    [self.chatToolbar addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld |NSKeyValueObservingOptionNew context:nil];
    
}

//添加新手引导
- (void)addNewPwopleComeView{
    
    //    NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:NewPeople];
    //在这里解档;
    _peopleModel = [NSKeyedUnarchiver unarchiveObjectWithData:NewPeopleFirstCome];
    if (!_peopleModel) {
        _peopleModel = [[MY_TTLNewPwopleGuideModel alloc] init];
    }
    if (!_peopleModel.firstWorldRed && self.personalModel.sex == 1) {
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[_HongBaoBtn convertRect: _HongBaoBtn.bounds toView:window];
        CGRect imgRect = CGRectMake(rect.origin.x - ScaleWidth(41) + 10, rect.origin.y-ScaleWidth(62)+5, ScaleWidth(41), ScaleWidth(62));
        _guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rect buttonImgName:@"clubSendMoney" imgFrame:imgRect guideImgName:@"世界频道内指示红包" promptString:@"发个红包获得MOYO美女青睐" corneRadius:rect.size.height/2 Alpha:0.9];
        //跳转红包
        __weak typeof(self) weakSelf = self;
        _guideView.actionBlock = ^{
            [weakSelf goToRechargeButtonClickMethod:weakSelf.HongBaoBtn];
        };
        [_guideView show];
        _peopleModel.firstWorldRed = YES;
        NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:_peopleModel];
        ADDNewPeopleFirstCome(peopleData);
    }else if (!_peopleModel.firstWorldRed){
        _peopleModel.firstWorldRed = YES;
        NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:_peopleModel];
        ADDNewPeopleFirstCome(peopleData);
    }
}
- (void)receiceBroadCastNotication:(NSNotification*)notic{
    [self.broadCastArray addObject:notic.userInfo[@"message"]];
    [self addbroadcastView];
}
- (void)addbroadcastView{

    if (!self.groupModel.roomId.intValue && self.broadCastArray.count > 0) {
        if (!_isShowBroadCastView) {
            _isShowBroadCastView = YES;
            __weak typeof(self)weakSelf = self;
            self.broadCastView.hidden = NO;
            UILabel *lab = (UILabel *)[self.broadCastView viewWithTag:55];
            lab.text = self.broadCastArray[0];
            
            [UIView animateWithDuration:0.5 animations:^{
                CGRect afterFrame = CGRectMake(0, 0, SCREEN_WIDTH, 60);
                weakSelf.broadCastView.frame = afterFrame;
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                    [weakSelf.broadCastView removeFromSuperview];
//                    weakSelf.broadCastView = nil;
                    weakSelf.broadCastView.hidden = YES;
                    weakSelf.broadCastView.frame = CGRectMake(0, -60, SCREEN_WIDTH, 60);
                    [weakSelf.broadCastArray removeObjectAtIndex:0];
                    _isShowBroadCastView = NO;
                    if (weakSelf.broadCastArray.count>0) {
                        [weakSelf addbroadcastView];
                    }
                });
            }];
        }
    }
}
- (UIView *)broadCastView{
    if (!_broadCastView) {
        CGFloat Y = -60;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, Y, SCREEN_WIDTH, 60)];
        view.backgroundColor = [Utility colorWithHexString:@"#272729" alpha:1.0];
        UIImageView *imageV = [[UIImageView alloc]init];
        imageV.image = [UIImage imageNamed:@"labaW"];
        imageV.frame = CGRectMake(10, 12, 45, 36);
        [view addSubview:imageV];
        UILabel *lab = [[UILabel alloc]init];
        lab.numberOfLines = 0;
        lab.textColor = [UIColor whiteColor];
        lab.frame = CGRectMake(CGRectGetMaxX(imageV.frame)+10, 0, view.frame.size.width, 60);
        lab.tag = 55;
        [view addSubview:lab];
        [self.view addSubview:view];
        _broadCastView = view;
    }
    return _broadCastView;
}
- (void)updateClubModel:(NSNotification*)uinf{
//    {@"clubup":dict}
    NSDictionary *dict = [uinf object];
    self.groupModel.roomName = dict[@"clubName"];
    self.groupModel.roomHeadIcon = dict[@"furl"];
//    EMConversation *conv =  [[EMClient sharedClient].chatManager getConversation:self.conversation.conversationId type:EMConversationTypeChat createIfNotExist:YES];
//    [conv load]
//    extDict[@"lqType"] = @(2);
//    model.message.ext = extDict;
//    [[EMClient sharedClient].chatManager updateMessage:model.message];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"frame"]) {
        CGRect frame = self.hbBpView.frame;
        frame.origin.y =  self.chatToolbar.frame.origin.y - 35-59 - 35 - 59;
        self.hbBpView.frame = frame;

    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];

    }
}
//
//- (void)selPersonalDB{
//    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
//    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where];
//    _infoModel = arry.firstObject;
//    _infoModel =  [[MessageInfoModel sharedManager]loadPersonModelWithID:[USERID integerValue]];
//}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadMessage];
 
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
        [self addNewPwopleComeView];
    }
}

- (void)loadMessage{

    if ([self.conversation.conversationId isEqualToString:WorldChannelID] && [self.dataArray count] < 1) {
        NSString *endDate = [Utility stringFromDate:[NSDate date] formatter: @"yyyy-MM-dd"];
        NSString *startDate = [Utility stringFromDate:[NSDate dateWithDaysBeforeNow:3] formatter: @"yyyy-MM-dd"];
        //http://api.sviptime.com/ChattingRecord/cg/record/getRecord?startTime=2017-12-27&endTime=2018-1-09&page=2&size=90&keyWord=
        [TLHTTPRequest MY_getWithBaseUrl:@"/ChattingRecord/cg/record/getRecord" parameters:@{@"startTime":@"2017-12-27",@"endTime":endDate,@"page":@"2",@"size":@"10",@"keyWord":@""} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if (data[@"info"]) {
                NSArray *arry = data[@"info"][@"chatMessages"];
                __block NSMutableArray *marry = [NSMutableArray arrayWithCapacity:arry.count];
                [arry enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    
                    EMMessage *message;
                    NSArray *bodiesArry = obj[@"payload"][@"bodies"];
                    NSDictionary *extDict = obj[@"payload"][@"ext"];
                    NSString *from = obj[@"from"];
                    NSString * to = self.conversation.conversationId;
                    NSString *typeStr = bodiesArry.firstObject[@"type"];
                    if ([typeStr isEqualToString:@"txt"]) {
                        NSString *msgStr = bodiesArry.firstObject[@"msg"];
                        
                        NSString *willSendText = [EaseConvertToCommonEmoticonsHelper convertToCommonEmoticons:msgStr];
                        EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:willSendText];
                        
                        message = [[EMMessage alloc] initWithConversationID:message.conversationId from:from to:to body:body ext:extDict];
                        message.direction =EMMessageDirectionReceive;
                        message.chatType = EMConversationTypeGroupChat;
                        message.status = EMMessageStatusSucceed;
                        
                    }else if([typeStr isEqualToString:@"img"]){
                        NSString *urlStr = bodiesArry.firstObject[@"url"];
                        //                                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
                        NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"erweima.png"]);
                        EMImageMessageBody *body = [[EMImageMessageBody alloc] initWithData:nil displayName:@"image.png"];
                        //                               http://res.sviptime.com/upload/images/101301969421055091831204231508422520646.jpg
                        body.remotePath = urlStr;
                        message = [[EMMessage alloc] initWithConversationID:to from:from to:to body:body ext:extDict];
                        message.direction = EMMessageDirectionReceive;
                        message.chatType = EMConversationTypeGroupChat;
                    }else if ([typeStr isEqualToString:@"video"]){
                        
                        NSString *urlStr = bodiesArry.firstObject[@"url"];
                        //                                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
                        NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"erweima.png"]);
                        EMVideoMessageBody *body = [[EMVideoMessageBody alloc] initWithData:data displayName:@"video.mp4"];
                        message = [[EMMessage alloc] initWithConversationID:to from:from to:to body:body ext:extDict];
                        message.chatType = EMConversationTypeGroupChat;
                    }else {
                        NSString *msgStr = bodiesArry.firstObject[@"msg"];
                        NSString *willSendText = [EaseConvertToCommonEmoticonsHelper convertToCommonEmoticons:msgStr];
                        EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:willSendText];
                        
                        message = [[EMMessage alloc] initWithConversationID:message.conversationId from:from to:to body:body ext:extDict];
                        message.direction =EMMessageDirectionReceive;
                        message.chatType = EMConversationTypeGroupChat;
                        message.status = EMMessageStatusSucceed;
                    }
                    
                    [marry addObject:message];
                    //                            [self.conversation insertMessage:message error:&error];
                    
                }];
                [[EMClient sharedClient].chatManager importMessages:marry completion:^(EMError *aError) {
                    if (aError) {
                        NSLog(@"%@",aError);
                    }else{
//                        refresh(marry);
                        [self tableViewDidTriggerHeaderRefresh];
                    }
                    
                }];
            }
            
            
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if([self.conversation.conversationId isEqualToString: WorldChannelID])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"REMOVEUNREAD" object:nil];
    }
    
    //  显示TabBar
//    self.tabBarController.tabBar.hidden = NO;
    [self.chatToolbar endEditing:YES];
    
}
//- (void)logSUbView:(UIView*)views{
//    for (UIView *view in views.subviews) {
//        if (view.subviews.count>0) {
//            [self logSUbView:view];
//        }else{
//            NSLog(@"%@",view);
//        }
//    }
//}
//  导航栏
- (void)setNavBarButton{
    if (self.groupModel.roomId.intValue) {
        UIBarButtonItem * ringhtBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"PointMore"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(ringhtBatBtnClick)];
        self.navigationItem.rightBarButtonItem = ringhtBarBtn;
    }else{
//        UIBarButtonItem * ringhtBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"榜单" style:UIBarButtonItemStyleBordered target:self action:@selector(BangDanBtnBtnClick)];
//        self.navigationItem.rightBarButtonItem = ringhtBarBtn;
    }
    UIBarButtonItem * leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"backButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}
- (void)ringhtBatBtnClick{
    MY_TTLClubDetailViewController *detailVc = [[MY_TTLClubDetailViewController alloc]init];
    detailVc.ClubID = self.groupModel.roomId.intValue;
    [self.navigationController pushViewController:detailVc animated:YES];
}
- (void)BangDanBtnBtnClick{
    
}

- (void)backClick{
    
    [self.navigationController popViewControllerAnimated:YES];
       
}
- (void)addHonbaoView{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 12 - 47, SCREEN_HEIGHT - 49 - 35 - 47 - 59 -55 - 59, 47, (47+47+12+47+12))];
    [self.view addSubview: bottomView];
    self.hbBpView = bottomView;
    _HongBaoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //        _HongBaoBtn.backgroundColor = [UIColor redColor];
    [_HongBaoBtn setImage:[UIImage imageNamed:@"clubSendMoney"] forState:UIControlStateNormal];
    //        [_HongBaoBtn addTarget:self action:@selector(addHongbaoBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_HongBaoBtn addTarget:self action:@selector(goToRechargeButtonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    
    _BaPingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_BaPingBtn setImage:[UIImage imageNamed:@"bigbottom1"] forState:UIControlStateNormal];
    [_BaPingBtn addTarget:self action:@selector(BPBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _inviteBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_inviteBtn setImage:[UIImage imageNamed:@"世界频道钱袋"] forState:UIControlStateNormal];
    [_inviteBtn addTarget:self action:@selector(inviteButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [bottomView addSubview:self.HongBaoBtn];
    [bottomView addSubview:_inviteBtn];
    self.HongBaoBtn.frame = CGRectMake(0, 47+12+47+12, 47, 47);
    
    if (![Utility isAuditEnvironment]) {// NO 正式环境
        [bottomView addSubview:self.BaPingBtn];
        _inviteBtn.frame = CGRectMake(0, 0, 47, 47);
    }else{
        _inviteBtn.frame = CGRectMake(0, 47+12, 47, 47);
    }
    self.BaPingBtn.frame = CGRectMake(0, 47+12, 47, 47);
    
}

//#pragma mark ## 红包按钮加载
//- (UIButton *)HongBaoBtn {
//    if (!_HongBaoBtn) {
//        _HongBaoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
////        _HongBaoBtn.backgroundColor = [UIColor redColor];
//        [_HongBaoBtn setImage:[UIImage imageNamed:@"clubSendMoney"] forState:UIControlStateNormal];
////        [_HongBaoBtn addTarget:self action:@selector(addHongbaoBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_HongBaoBtn addTarget:self action:@selector(goToRechargeButtonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _HongBaoBtn;
//}
//#pragma mark ## 霸屏按钮加载
//- (UIButton *)BaPingBtn {
//    if (!_BaPingBtn) {
//        _BaPingBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        [_BaPingBtn setImage:[UIImage imageNamed:@"bigbottom1"] forState:UIControlStateNormal];
//        [_BaPingBtn addTarget:self action:@selector(BPBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//
//    }
//    return _BaPingBtn;
//}

#pragma mark - - 发红包页面
-(void)goToRechargeButtonClickMethod:(UIButton*)sender{
    NSDictionary *parit = @{@"clubId":self.groupModel.roomId};
    if (!self.groupModel.roomId.intValue) {
        parit = nil;
    }
    __weak typeof(self) weakSelf = self;
    [TLHTTPRequest MY_postWithBaseUrl:SendMHongBaoLimit parameters:parit success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
       
        if ([data[@"ret"] integerValue] == 0) {
            
            MY_LYRedPackertViewController * redVC = [[MY_LYRedPackertViewController alloc]init];

            NSDictionary *dict = data[@"info"];
            redVC.clubId =  weakSelf.groupModel.roomId;
    
            redVC.clubPersonalNum = dict[@"hongbaoLimitNum"];
            // @(group.occupantsCount);
            redVC.backClickMethod = ^(MY_LYRedPackertViewController *redPacketVC, BOOL isGoToCharge) {
                [redPacketVC.navigationController popViewControllerAnimated:YES];
            };
            [weakSelf.navigationController pushViewController:redVC animated:YES];
        }
//        MY_GLRedPacketView * redView = [[MY_GLRedPacketView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        //注册群组回调
//        if ([data[@"ret"] integerValue] == 0) {
//            NSDictionary *dict = data[@"info"];
//            redView.clubId =  self.groupModel.roomId;
//            redView.clubPersonalNum = dict[@"hongbaoLimitNum"] ;// @(group.occupantsCount);
//            redView.backClickMethod = ^(MY_GLRedPacketView *redPacketView, BOOL isGoToCharge) {
//
//                [UIView animateWithDuration:0.2 animations:^{
//
//                    CGRect rect = redPacketView.frame;
//                    rect.origin.y = SCREEN_HEIGHT;
//                    redPacketView.frame = rect;
//
//                } completion:^(BOOL finished) {
//
//                    [redPacketView removeFromSuperview];
//                }];
//
//            };
//            UIWindow *window = [UIApplication sharedApplication].keyWindow;
//            [window addSubview:redView];
//        }
       
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    }];
}


- (void)BPBtnButtonClick1:(NSString *)furl Withid:(NSString *)uid{
    
    
    
    if([self.view viewWithTag:10000001])
    {
        [LQProgressHud showMessage:@"霸屏先机已被抢，请稍等"];
    }
    else
    {
        _PopView = [[MY_GLBaPingView alloc]init];
        [_PopView showInView:self.view];
        
        NSArray *moneyArr;
        if([self.groupModel.roomName isEqualToString:@"世界频道"])
        {
            moneyArr = [NSArray arrayWithObjects:@"￥400",@"￥700",@"￥1040",@"￥1800",@"￥7000", nil];
        }
        else{
            moneyArr = [NSArray arrayWithObjects:@"￥200",@"￥350",@"￥520",@"￥900",@"￥3500", nil];
        }
        
        [_PopView loadMoneyWith:moneyArr];
        
        __weak typeof(self) weakSelf = self;
        __weak typeof(_PopView) __PopView = _PopView;
        
        if (_arrayPage.count != 0) {
            [_arrayPage removeAllObjects];
        }
        
        [self.DicPage setObject:furl forKey:@"img"];
        
        [_PopView.UploadButton sd_setImageWithURL:[NSURL URLWithString:furl] forState:UIControlStateNormal];
        
        [_PopView addButtonAction1:^(id sender) {
            
            //        [__PopView disMissView];
            
//            NSLog(@"%@",__PopView.bpdic);
            
            
            if(![__PopView.bpdic objectForKey:@"itemId"])
            {
                [LQProgressHud showMessage:@"请选择霸屏时间"];
                return;
            }
            else if(![__PopView.bpdic objectForKey:@"type"])
            {
                [LQProgressHud showMessage:@"请选择霸屏类型"];
                return;
            }
            else if([NSString stringWithFormat:@"%@",[__PopView.bpdic objectForKey:@"msg"]].length == 0)
            {
                [LQProgressHud showMessage:@"请输入霸屏内容"];
                return;
            }
            else
            {
                
                [__PopView disMissView];
                [weakSelf.DicPage setObject:[__PopView.bpdic objectForKey:@"itemId"] forKey:@"itemId"];
                [weakSelf.DicPage setObject:[__PopView.bpdic objectForKey:@"msg"] forKey:@"msg"];
                [weakSelf.DicPage setObject:[__PopView.bpdic objectForKey:@"type"] forKey:@"type"];
//                NSLog(@"%@",weakSelf.DicPage);
                
//                NSArray *timeArr =  [NSArray arrayWithObjects:@"20",@"30",@"60",@"100",@"520", nil];
                NSArray *TagArr =  [NSArray arrayWithObjects:@"生日霸屏",@"示爱霸屏",@"求约霸屏",@"求婚霸屏",@"女神霸屏", nil];
                
                MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
                payVC.userId = uid;
                payVC.price = [moneyArr objectAtIndex:[[weakSelf.DicPage objectForKey:@"itemId"] integerValue] - 20001];
                //        payVC.payType = 1;
                //        payVC.headIconStr = mod.headIcon;
                payVC.nickName = [TagArr objectAtIndex:[[weakSelf.DicPage objectForKey:@"type"] integerValue] - 1];
                [weakSelf.DicPage setObject:uid forKey:@"userId"];
                //        payVC.redType = [NSString stringWithFormat:@"%ld秒",[timeArr objectAtIndex:[[weakSelf.DicPage objectForKey:@"itemId"] integerValue] - 20001]];
                payVC.dic = weakSelf.DicPage;
                
                [weakSelf.navigationController pushViewController:payVC animated:YES];
            }
            
        }];
    }
    
}

- (void)BPBtnButtonClick:(UIButton*)sender{
    
    [self.view endEditing:YES];
    if([self.view viewWithTag:10000001])
    {
        [LQProgressHud showMessage:@"霸屏先机已被抢，请稍等"];
    }
    else
    {
        _PopView = [[MY_GLBaPingView alloc]init];
        [_PopView showInView:self.view];
        NSArray *moneyArr;
      
        if([self.groupModel.roomName isEqualToString:@"世界频道"])
        {
            moneyArr = [NSArray arrayWithObjects:@"￥400",@"￥700",@"￥1040",@"￥1800",@"￥7000", nil];
        }
        else{
            moneyArr = [NSArray arrayWithObjects:@"￥200",@"￥350",@"￥520",@"￥900",@"￥3500", nil];
        }
        
        [_PopView loadMoneyWith:moneyArr];

        __weak typeof(self) weakSelf = self;
        __weak typeof(_PopView) __PopView = _PopView;

        [_PopView addButtonAction:^(id sender) {
            [weakSelf usePhonePhotoAndCamera];
        }];
        [_PopView addButtonAction1:^(id sender) {

            //        [__PopView disMissView];


            if(![__PopView.bpdic objectForKey:@"itemId"])
            {
                [LQProgressHud showMessage:@"请选择霸屏时间"];
                return;
            }
            else if(![__PopView.bpdic objectForKey:@"type"])
            {
                [LQProgressHud showMessage:@"请选择霸屏类型"];
                return;
            }
            else if([NSString stringWithFormat:@"%@",[__PopView.bpdic objectForKey:@"msg"]].length == 0)
            {
                [LQProgressHud showMessage:@"请输入霸屏内容"];
                return;
            }
            else if(![weakSelf.DicPage objectForKey:@"fid"])
            {
                [LQProgressHud showMessage:@"请选择霸屏图片"];
                return;
            }
            else
            {
                
                [__PopView disMissView];

                [weakSelf.DicPage setObject:[__PopView.bpdic objectForKey:@"itemId"] forKey:@"itemId"];
                [weakSelf.DicPage setObject:[__PopView.bpdic objectForKey:@"msg"] forKey:@"msg"];
                [weakSelf.DicPage setObject:[__PopView.bpdic objectForKey:@"type"] forKey:@"type"];

                NSArray *timeArr =  [NSArray arrayWithObjects:@"20",@"30",@"60",@"100",@"520", nil];
                NSArray *TagArr =  [NSArray arrayWithObjects:@"生日霸屏",@"示爱霸屏",@"求约霸屏",@"求婚霸屏",@"女神霸屏", nil];
 
                MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
                payVC.userId = @"0";
                [self.DicPage setObject:@"0" forKey:@"userId"];
                payVC.price = [moneyArr objectAtIndex:[[weakSelf.DicPage objectForKey:@"itemId"] integerValue] - 20001];
                //        payVC.payType = 1;
                //        payVC.headIconStr = mod.headIcon;
                payVC.nickName = [TagArr objectAtIndex:[[weakSelf.DicPage objectForKey:@"type"] integerValue] - 1];

                //        payVC.redType = [NSString stringWithFormat:@"%ld秒",[timeArr objectAtIndex:[[weakSelf.DicPage objectForKey:@"itemId"] integerValue] - 20001]];
                
                if([weakSelf.DicPage objectForKey:@"img"])
                {
                    [weakSelf.DicPage removeObjectForKey:@"img"];
                }
                
                payVC.dic = weakSelf.DicPage;
                [weakSelf.navigationController pushViewController:payVC animated:YES];
            }
        }];
    }

}
#pragma mark ----- 邀请好友 -----
- (void)inviteButtonClick{
    CRWebViewController * inviVc = [[CRWebViewController alloc]init];
//    inviVc.hidesBottomBarWhenPushed = YES;
    inviVc.webURL = [Utility getH5Url:HomeInvilFriendURL];
    inviVc.strTitle = @"邀请好友";
    inviVc.stringfrom = @"邀请好友";
    [self.navigationController pushViewController:inviVc animated:YES];
}
#pragma mark -myBtnDelegate 点击头像弹出视图代理
- (void)BtnClick:(UIButton *)btn withBPView:(MY_XTUserBPView *)pView
{
    if(btn.tag == 1000)
    {
        NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
        
        [dict setObject:[NSString stringWithFormat:@"%ld",pView.userid] forKey:@"onkey"];
        
        [dict setObject:@"0" forKey:@"type"];
        
        [TLHTTPRequest MY_postWithBaseUrl:AttentionURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] boolValue] == 0) {
                
                btn.hidden = YES;
                
                [[ChatDemoHelper shareHelper] addAttentionWithUserId:[dict[@"onkey"] integerValue] nickName:pView.model.nickName headIcon:pView.model.headIcon];
                
            }
            else {
                if (dict[@"msg"]) {
                    [LQProgressHud showMessage:dict[@"msg"]];
                }
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
    }
    else if(btn.tag == 1001)
    {
        [pView animateOut];
        MY_TTLSelfCenterViewController* infoVc = [[MY_TTLSelfCenterViewController alloc]init];
        infoVc.userID = [NSString stringWithFormat:@"%ld",pView.userid];
        [self.navigationController pushViewController:infoVc animated:YES];
    }
    else if(btn.tag == 1002 || btn.tag == 2000)
    {
        [pView animateOut];
        //ChatStatusUrl 判断是否可以聊天
        NSDictionary * chatDic = @{@"userId":@(pView.userid)};
        [LQProgressHud showLoading:nil];
        [TLHTTPRequest MY_postWithBaseUrl:ChatStatusUrl parameters:chatDic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                [LQProgressHud hide];
                if ([[data[@"info"] objectForKey:@"status"] integerValue]) {
                    // 1 可以聊天
//                    MY_LLPersonInfoModel * model = [[MY_LLPersonInfoModel alloc] init];
////                    model.userId = pView.model.id;
//                    model.userId =  pView.model.userId;
//                    model.nickName = pView.model.nickName;
//                    model.headIcon = pView.model.headIcon;
//                    model.isNoble  = pView.model.isNoble;

                    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:[NSString stringWithFormat:@"%ld",(long)pView.model.userId] conversationType:EMConversationTypeChat];
                    chatController.model = pView.model;
                    chatController.isPayPush = NO;
//                    [chatController setHidesBottomBarWhenPushed:YES];
                    [self.navigationController pushViewController:chatController animated:YES];
                }else{
                    // 0 不能聊天
                    
                    MY_LLChatRedPacketView * chatRedPacketView = [[MY_LLChatRedPacketView alloc] init];
                    chatRedPacketView.userId = [NSString stringWithFormat:@"%td", pView.model.userId];
                    chatRedPacketView.delegate =self;
                    chatRedPacketView.model = pView.model;
                    chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
                        
                        MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
                        payVC.userId = [NSString stringWithFormat:@"%td", pView.model.userId];
                        payVC.price = [NSString stringWithFormat:@"%td", price];
                        payVC.redSingleType = RedPacketSayHolle;
                        payVC.payType = 1;
                        payVC.delegate =self;
                        payVC.headIconStr = pView.model.headIcon;
                        payVC.nickName = pView.model.nickName;
                        payVC.redType = RedPacket_sayHolle;
                        payVC.pushfrom = @"push";
                        [self.navigationController pushViewController:payVC animated:YES];
                    };
                    chatRedPacketView.GetNobilityBlock = ^(NSInteger index) {
                        
                        if (index == 1) {
                            
                            MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//                            noVc.hidesBottomBarWhenPushed = YES;
                            [self.navigationController pushViewController:noVc animated:YES];
                        }
                    };
                    [chatRedPacketView show];
                    
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
    else if(btn.tag == 2001)
    {
        [pView animateOut];
        [self BPBtnButtonClick1:pView.model.headIcon Withid:[NSString stringWithFormat:@"%ld",pView.userid]];
        
    }
   
}
#pragma mark --MY_LLPayViewControllerDelegate
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withPrice:(NSString *)price{
  
    MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
    model.userId = [vc.userId integerValue];
    model.nickName = vc.nickName;
    model.headIcon = vc.headIconStr;
    //    model.isNoble  = [vc.nobleLevel integerValue];
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:vc.userId conversationType:EMConversationTypeChat];
    chatController.model = model;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:chatController animated:YES];
    
}
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price{
//    MY_LLPersonInfoModel * model = [[MY_LLPersonInfoModel alloc] init];
//    model.userId = [vc.userId integerValue];
//    model.nickName = vc.nickName;
//    model.headIcon = vc.headIconStr;
    //    model.isNoble  = [vc.nobleLevel integerValue];
    ChatViewController * chatController = [[ChatViewController alloc] initWithConversationChatter:view.userId conversationType:EMConversationTypeChat];
    chatController.model = view.model;
//    [chatController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:chatController animated:YES];
}
- (void)PAYSuccess:(NSNotification *)notification{
    NSDictionary * infoDic = [notification object];
    
    _PopView2 = [[MY_GLBaPingExampleView alloc]init];
    
    _PopView2.tag = 10000001;
    
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *model = arry.firstObject;
    
//    MY_LLPersonInfoModel * model = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    _PopView2.UserNameLabel.text = model.nickName;
    [_PopView2.UserHeadImage sd_setImageWithURL:[NSURL URLWithString:model.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
//    NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//
//    [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//        if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//
//            MY_LLPersonInfoModel * model = dataArray.firstObject;
//
//            dispatch_async(dispatch_get_main_queue(), ^{
//                _PopView2.UserNameLabel.text = model.nickName;
//                [_PopView2.UserHeadImage sd_setImageWithURL:[NSURL URLWithString:model.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"]];
//            });
//

//        }
//    }];
    
//    _PopView2.BapingImage
    
    [_PopView2.BapingImage sd_setImageWithURL:[NSURL URLWithString:infoDic[@"img"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
    _PopView2.BPTextLabel.text = infoDic[@"msg"];
    
    NSArray *TagArr =  [NSArray arrayWithObjects:@"baping1",@"示爱1",@"求约1",@"求婚1",@"女神1", nil];
    NSArray *timeArr =  [NSArray arrayWithObjects:@"20",@"30",@"60",@"100",@"520", nil];
    
    NSArray *TagArr1 =  [NSArray arrayWithObjects:@"生活霸屏",@"示爱",@"求约",@"求婚",@"女神", nil];
    
    _PopView2.Tag1Image.image = [UIImage imageNamed:[TagArr objectAtIndex:[infoDic[@"type"] intValue] - 1]];
    _PopView2.Tag2Image.image = [UIImage imageNamed:[TagArr1 objectAtIndex:[infoDic[@"type"] intValue] - 1]];
    
    _PopView2.secondsCountDown = [[timeArr objectAtIndex:[infoDic[@"itemId"] intValue] - 20001] intValue];
    
    [_PopView2 showInView:self.view];
    
}

-(void)GetBP
{
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [dict setObject:self.groupModel.roomId forKey:@"clubId"];
    
    [TLHTTPRequest MY_getWithBaseUrl:CurrentBpingUrl parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull dict) {
        
        if ([[dict objectForKey:@"ret"] integerValue] == 0) {
            if (![[dict objectForKey:@"info"] isEqual:[NSNull null]]) {
                if ([[dict objectForKey:@"info"] count] ) {
                    NSDictionary * dic = [dict objectForKey:@"info"];
                    [self addBaP:dic];
                    
                }else{
                    
                    //                [LQProgressHud showMessage:@"没有符合条件的!"];
                }
            }
            
            
            
        }else{
            if ([dict objectForKey:@"msg"]) {
//                [LQProgressHud showMessage:[dict objectForKey:@"msg"]];
            }
        }
        
       
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
}

-(void)addBaP:(NSDictionary *)dic
{
    _PopView2 = [[MY_GLBaPingExampleView alloc]init];
    _PopView2.tag = 10000001;
    _PopView2.UserNameLabel.text = dic[@"nickName"];
    [_PopView2.UserHeadImage sd_setImageWithURL:[NSURL URLWithString:dic[@"headIcon"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
    //    _PopView2.BapingImage
    [_PopView2.BapingImage sd_setImageWithURL:[NSURL URLWithString:dic[@"img"]] placeholderImage:[UIImage imageNamed:@"占位图"]];
    _PopView2.BPTextLabel.text = dic[@"msg"];
    
    NSArray *TagArr =  [NSArray arrayWithObjects:@"baping1",@"baping2",@"baping3",@"baping4",@"baping5", nil];
//    NSArray *timeArr =  [NSArray arrayWithObjects:@"20",@"30",@"60",@"100",@"520", nil];
    
    NSArray *TagArr1 =  [NSArray arrayWithObjects:@"生活霸屏",@"示爱",@"求约",@"求婚",@"女神", nil];
    _PopView2.Tag1Image.image = [UIImage imageNamed:[TagArr objectAtIndex:[dic[@"type"] intValue]-1]];
    _PopView2.Tag2Image.image = [UIImage imageNamed:[TagArr1 objectAtIndex:[dic[@"type"] intValue]-1]];
    _PopView2.secondsCountDown = [dic[@"time"] intValue];
    [_PopView2 showInView:self.view];
}

#pragma mark - 调用手机相机和相册
- (void)usePhonePhotoAndCamera {
    //    _photos = 10;
    UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //        _photos = 1;
    }];
    
    //拍照：
    UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相机
        _pickPhoto.picker.allowsEditing = YES;
        [_pickPhoto ShowTakePhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
                        if (_arrayPage.count != 0) {
                            [_arrayPage removeAllObjects];
                        }
                        _arrayPage = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
            //            [_btnImage setBackgroundImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
            //            [self imageArray:_arrayPage withIsViedo:0];
            //            [self imageArray:_arrayPage];
            //            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
            //            [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
            [_PopView.UploadButton setImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
            
            [self.DicPage setObject:_arrayPage forKey:@"fid"];
            
        }];
    }];
    //相册
    UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        _pickPhoto.picker.allowsEditing = YES;
        [_pickPhoto SHowLocalPhotoWithController:self withIsEdit:1 andWithBlock:^(NSObject *Data) {
                        if (_arrayPage.count != 0) {
                            [_arrayPage removeAllObjects];
                        }
                        _arrayPage = [NSMutableArray arrayWithObject:UIImageJPEGRepresentation((UIImage *)Data, 0.7)];
                        [_PopView.UploadButton setImage:[UIImage imageWithData:_arrayPage[0]] forState:UIControlStateNormal];
//                        [self imageArray:_arrayPage withIsViedo:0];
//                        [self imageArray:_arrayPage];
            //            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
            //            [self.myTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
             [self.DicPage setObject:_arrayPage forKey:@"fid"];
        }];
        
    }];
    UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
    [aleVC addAction:act1];
    [aleVC addAction:act2];
    [aleVC addAction:act3];
    [self presentViewController:aleVC animated:YES completion:nil];
}

- (void)setchatTooBarSubView{
    CGFloat chatbarHeight = [EaseChatToolbar defaultHeight];
//    CGRect tableFrame = self.tableView.frame;
//    tableFrame.size.height = [[UIScreen mainScreen] bounds].size.height + chatbarHeight ;
//    self.tableView.frame = tableFrame;
   
    EMChatToolbarType barType = self.conversation.type == EMConversationTypeChat ? EMChatToolbarTypeChat : EMChatToolbarTypeGroup;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.chatToolbar = [[MY_TTLClubInputChatView alloc] initWithFrame:CGRectMake(0,screenHeight - chatbarHeight - BottomHeight, self.view.frame.size.width, chatbarHeight + BottomHeight) type:barType];
    self.chatToolbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    MY_TTLClubInputChatView *toolbar =  (MY_TTLClubInputChatView *)self.chatToolbar;
    [toolbar setTakePhoto:^(EaseChatBarMoreView* moreView){
        UIAlertAction * act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //        _photos = 1;
        }];
        //拍照：
        UIAlertAction * act2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ( [moreView.delegate respondsToSelector:@selector(moreViewTakePicAction:)]) {
                [moreView.delegate moreViewTakePicAction:moreView];
            }
        }];
        //相册
        UIAlertAction * act3 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ( [moreView.delegate respondsToSelector:@selector(moreViewPhotoAction:)]) {
                [moreView.delegate moreViewPhotoAction:moreView];
            }
        }];
        UIAlertController * aleVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"选择图片" preferredStyle:UIAlertControllerStyleActionSheet];
        [aleVC addAction:act1];
        [aleVC addAction:act2];
        [aleVC addAction:act3];
        [self presentViewController:aleVC animated:YES completion:nil];
    }];
}

#pragma mark - delegate
- (id<IMessageModel>)messageViewController:(EaseMessageViewController *)viewController
                           modelForMessage:(EMMessage *)message{
    
    id<IMessageModel> model = nil;
    model = [[EaseMessageModel alloc] initWithMessage:message];
    
//    NSString * typeStr = [NSString stringWithFormat:@"%@", message.ext[@"type"]];
//    if ([typeStr isEqualToString:@"sendMultipleHongbao"]) {
//    }
    NSString *addressStr;
    if (model.isSender) { //    自己头像
        
        model.avatarURLPath = self.personalModel.headIcon;
        if (self.personalModel.secretStatus.integerValue == 1) {
            model.avatarURLPath = self.personalModel.secretIcon;
        }
        model.nickname = self.personalModel.nickName;
        
        addressStr = @"";
    } else {    //  别人头像
        NSString *lati;
        NSString *longt;
        NSString * where = [NSString stringWithFormat:@"userId = %td",[message.from integerValue]];
        NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
        MY_LYPersonInfoModel *userModel = arry.firstObject;
//        MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[message.from integerValue]];
        if (userModel) {
    
            model.avatarURLPath = userModel.headIcon;
            if ([Utility isBlankString:userModel.headIcon]) {
                 model.avatarURLPath = message.ext[@"avatarURLPath"];
            }
            model.nickname = userModel.nickName;
            if ([Utility isBlankString:userModel.nickName]) {
                model.nickname = message.ext[@"nickname"];
            }
            
            longt = userModel.longitude;
            lati = userModel.latitude;
            
            if ([Utility isBlankString:longt] || !longt.intValue || [Utility isBlankString:lati] || !lati.intValue) {
                longt = message.ext[@"userLongitude"];
                lati = message.ext[@"userLatitude"];
            }
            addressStr = userModel.region;
            if ([Utility isBlankString:addressStr]) {
               addressStr = message.ext[@"userLocation"];
            }
        }else{
            model.avatarURLPath = message.ext[@"avatarURLPath"];
            model.nickname = message.ext[@"nickname"];
            longt = message.ext[@"userLongitude"];
            lati = message.ext[@"userLatitude"];
            addressStr = message.ext[@"userLocation"];
        }
//        NSLog(@" message.ext--:%@", message.ext);
//        NSLog(@"userName:%@ addressStr--:%@ lati--:%@  longt--:%@",model.nickname,addressStr,lati,longt);
//        BOOL otherReg = longt.intValue == 90 && lati.intValue == 90;
        if ([addressStr isEqualToString:@"角落里"]) {
            addressStr = @"角落里";
        }else if ([self.personalModel.region isEqualToString:addressStr]) {
//            NSLog(@"mylongitude--:%@ mylatitude--:%@",self.personalModel.longitude,self.personalModel.latitude);
                CLLocation *curLocation = [[CLLocation alloc] initWithLatitude:self.personalModel.latitude.doubleValue longitude:self.personalModel.longitude.doubleValue];
                CLLocation *otherLocation = [[CLLocation alloc] initWithLatitude:lati.doubleValue longitude:longt.doubleValue];
                double  distance  = [curLocation distanceFromLocation:otherLocation];
                if (distance>=1000) {
                    float dis = distance/1000;
                    addressStr = [NSString stringWithFormat:@"%.1fkm",dis];
                }else{
                    addressStr = [NSString stringWithFormat:@"0.1km"];
                }
        }

    }
    model.address = addressStr;
    
    model.failImageName = @"EaseUIResource.bundle/imageDownloadFail";
    
    return model;
}
- (UITableViewCell *)messageViewController:(UITableView *)tableView cellForTimeString:(NSString *)timeString{
    NSString *TimeCellIdentifier = [EaseMessageTimeCell cellIdentifier];
    EaseMessageTimeCell *timeCell = (EaseMessageTimeCell *)[tableView dequeueReusableCellWithIdentifier:TimeCellIdentifier];
    if (timeCell == nil) {
        timeCell = [[EaseMessageTimeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TimeCellIdentifier];
        timeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        timeCell.titleLabelColor = [Utility colorWithHexString:@"4c4c4c" alpha:1.0];
        timeCell.titleLabelBackgroundColor = [UIColor clearColor];
    }
    timeCell.title = timeString;
    return timeCell;
}
- (BOOL)messageViewController:(EaseMessageViewController *)viewController didReceiveMessage:(EMMessage *)message{
    id<IMessageModel> model = nil;
    
    model = [[EaseMessageModel alloc] initWithMessage:message];
    NSDictionary *ext = model.message.ext;
    if (ext[@"type"]) {
        NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
        if ([typeStr isEqualToString:@"baping"]) {
            NSString *dataStr = ext[@"typeMsg" ];
            if (![Utility isBlankString:dataStr]) {
                NSData * data = [dataStr dataUsingEncoding:(NSUTF8StringEncoding)];
                NSDictionary * diction = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
                if([self.view viewWithTag:10000001])
                {
//                    [LQProgressHud showMessage:@"霸屏先机已被抢，请稍等"];
                }
                else
                {
                     [self addBaP:diction];
                }
                
            }
            
        }else if([typeStr isEqualToString:@"1"]){
            self.title = [NSString stringWithFormat:@"%@",ext[@"groupNickName"]];
        }
        
        
    }
    return YES;
}

#pragma mrak - 自定义实时通话的Cell
- (UITableViewCell *)messageViewController:(UITableView *)tableView
                       cellForMessageModel:(id<IMessageModel>)messageModel
{
    if ([messageModel isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSDictionary *ext = messageModel.message.ext;
    NSString *messageType = messageModel.message.from;
    if ([messageType isEqualToString:VTaskM]) {
//        HongBaoMoney
//        msg
        
        NSRange honbaoMoney = [messageModel.text rangeOfString:ext[@"hongbaoMoney"]];
        NSRange name = [messageModel.text rangeOfString:ext[@"msg"]];
        NSRange str = [messageModel.text rangeOfString:ext[@"linkString"]];

        NSMutableAttributedString *maStr = [[NSMutableAttributedString alloc]initWithString:messageModel.text attributes:@{NSForegroundColorAttributeName:[Utility colorWithHexString:@"D9B878" alpha:1.0]}];
        NSDictionary *colorDict2 = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
        [maStr addAttributes:colorDict2 range:honbaoMoney];
        [maStr addAttributes:colorDict2 range:name];
        [maStr addAttributes:colorDict2 range:str];
        MY_TTLClubChatCell *cell = [MY_TTLClubChatCell cellForTableView:tableView withModel:messageModel];
        cell.textAttribute = maStr;
        cell.model = messageModel;
        cell.delegate = self;
        
        return cell;
    }else if (ext[@"realTimeCall"]) {
        static NSString * cId = @"RealTimeCallCell";
        RealTimeCallCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
        if (cell == nil) {
            cell = [[RealTimeCallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        messageModel.avatarURLPath = ext[@"avatarURLPath"];
        cell.model = messageModel;
        return cell;
    }
    else if (ext[@"type"]) {
        //sendMultipleHongbao  红包
        NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
        if ([typeStr isEqualToString:@"sendMultipleHongbao"]) {
            
//            static NSString * cId = @"MY_LLRedPacketCell";
            MY_TTLClubHongBaoCell *cell = [MY_TTLClubHongBaoCell cellForTableView:tableView withModel:messageModel];
            cell.delegate = self;
            cell.model = messageModel;
            return cell;
        }
        else if ([typeStr isEqualToString:@"baping"]) {
            
            MY_TTLFullScreenPhotoCell *cell = [MY_TTLFullScreenPhotoCell cellForTableView:tableView withModel:messageModel];
            cell.model = messageModel;
            cell.delegate = self;
            return cell;
        }else if ([typeStr isEqualToString:@"worldChannelClubHongbao"]){
            NSDictionary *extd =  messageModel.message.ext;
            
            NSRange rangNickname = [messageModel.text rangeOfString:extd[@"nickname"]];
            NSRange rangGroupName = [messageModel.text rangeOfString:extd[@"groupNickName"]];
            NSRange rangHongBao = [messageModel.text rangeOfString:extd[@"hongbaoMoney"]];
            NSMutableAttributedString *maStr;
            if (messageModel.isSender) {
                maStr = [[NSMutableAttributedString alloc]initWithString:messageModel.text attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
                NSDictionary *colorDict1 = @{NSForegroundColorAttributeName:[UIColor blackColor]};
                [maStr addAttributes:colorDict1 range:rangNickname];
                [maStr addAttributes:colorDict1 range:rangGroupName];
                [maStr addAttributes:colorDict1 range:rangHongBao];
            }else{
                maStr = [[NSMutableAttributedString alloc]initWithString:messageModel.text attributes:@{NSForegroundColorAttributeName:[Utility colorWithHexString:@"D9B878" alpha:1.0]}];
                NSDictionary *colorDict2 = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
                [maStr addAttributes:colorDict2 range:rangNickname];
                [maStr addAttributes:colorDict2 range:rangGroupName];
                [maStr addAttributes:colorDict2 range:rangHongBao];
            }
            MY_TTLClubChatCell *cell = [MY_TTLClubChatCell cellForTableView:tableView withModel:messageModel];
            cell.textAttribute = maStr;
            cell.model = messageModel;
            cell.delegate = self;
            
            return cell;
        
        }else{
            static NSString * cId = @"MY_LLSystemMessageCell";
            MY_LLSystemMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
            if (cell == nil) {
                cell = [[MY_LLSystemMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            cell.messageLabel.text = messageModel.text;
            return cell;
        }
    }else{
        MY_TTLClubChatCell *cell = [MY_TTLClubChatCell cellForTableView:tableView withModel:messageModel];
        cell.textAttribute = nil;
        [cell setBordViewClickBlock:^(NSString *imgURl,NSString *uid) {
            [self BPBtnButtonClick1:imgURl Withid:uid];
        }];
        cell.model = messageModel;
        cell.delegate = self;

        return cell;
    }
    return nil;
}

//-(BOOL)hidesBottomBarWhenPushed
//{
//    return YES;
//}

//  返回cell高度
- (CGFloat)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth{
    if ([messageModel isKindOfClass:[NSString class]]) {
        return 30;
    }
    
    NSDictionary *ext = messageModel.message.ext;
    if (ext[@"realTimeCall"]) {
//        return 53;
        CGFloat height = [Utility stringSizeWithString:messageModel.text textSize:12 width:SCREEN_WIDTH - 80 height:0].height;
        return height + 10 + 15 + 2;
    }else if(ext[@"type"]) {
        NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
        if ([typeStr isEqualToString:@"sendMultipleHongbao"]) {
            NSDictionary * dict = messageModel.message.ext;
            NSNumber *typNub = dict[@"lqType"];
            if (typNub.intValue == 2) {
                return  [MY_TTLClubHongBaoCell cellHeightWithModel:messageModel]+40;
            }else{
                return [MY_TTLClubHongBaoCell cellHeightWithModel:messageModel];
            }
                
        }else if ([typeStr isEqualToString:@"baping"]) {
//            CGFloat height = [Utility stringSizeWithString:messageModel.text textSize:12 width:SCREEN_WIDTH - 80 height:0].height;
//            return height + 10 + 15 + 2;
            return [MY_TTLFullScreenPhotoCell cellHeightWithModel:messageModel];
        }else if ([typeStr isEqualToString:@"worldChannelClubHongbao"]){
             return [MY_TTLClubChatCell cellHeightWithModel:messageModel];
        }else{
            CGFloat height = [Utility stringSizeWithString:messageModel.text textSize:12 width:SCREEN_WIDTH - 80 height:0].height;
            return height + 10 + 15 + 2;
        }
    }else{
        return [MY_TTLClubChatCell cellHeightWithModel:messageModel];
    }
    return 0;
}

#pragma mark - - 点击红包
/*
 *  红包点击回调 抢
 *
 *  @param  消息model
 */
- (void)hongBaoButtonSelected:(id<IMessageModel>)model{
    [self.view endEditing:YES];
    if (![self.personalModel.inIndex integerValue] && !self.groupModel.roomId.intValue) {
        [LQProgressHud showMessage:@"您没有上首页,不能抢红包"];
        return;
    }
    [self grabRedPacket:model];
   
    
}
- (void)getHongbaoPopView{
    MY_TTLHongBaoClickPopView *popv = [[MY_TTLHongBaoClickPopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [popv setBlockFiltrate:^(void){
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        [manager downloadImageWithURL:[NSURL URLWithString:self.personalModel.headIcon] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            NSString *titleStr = @"闲趣：“闲暇之余，有趣约会”";//[NSString stringWithFormat:@"%@邀请你入驻V时代", self.model.nickName];
            NSString *detailsStr = [NSString stringWithFormat:@"网红模特们的新宠儿和有趣的灵魂\n分享你成功的人生这里只有卓越，拒绝平庸"];
            NSString *urlStr = ShareInviteFriendUrl(USERID,1);
            NSArray* array = @[titleStr, detailsStr, urlStr];
            MY_TTLShareOnlyView* alert = [[MY_TTLShareOnlyView alloc]initWithFrame:ShareFrame withArray:array image:image type:1 typeId:nil];
            [UIView animateWithDuration:0.2 animations:^{
                [alert show];
            }];
        }];
    }];
    [popv setBlockDeatailFiltrate:^(void){
        CRWebViewController* inviVc = [[CRWebViewController alloc]init];
        //        inviVc.hidesBottomBarWhenPushed = YES;
        inviVc.webURL = [NSString stringWithFormat:@"%@?userId=%@",[Utility getH5Url:@"/VEra/friend_share.html"],USERID];
        
        inviVc.strTitle = @"邀请好友";
        inviVc.stringfrom = @"邀请好友";
        [self.navigationController pushViewController:inviVc animated:YES];
    }];
    [popv addWindowForView];
}
/*
 *  红包详情点击回调
 *
 *  @param  消息model
 */
- (void)hongBaoDetailSelected:(NSDictionary*)dic
{
    
    NSData * data = [dic[@"typeMsg"] dataUsingEncoding:(NSUTF8StringEncoding)];
    NSDictionary * diction = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
    NSString * hidStr = diction[@"hid"];
    
    MY_TTLClubRedPackListViewController * redinfoVC = [[MY_TTLClubRedPackListViewController alloc]init];
    redinfoVC.hid = hidStr;
    [self.navigationController pushViewController:redinfoVC animated:YES];
    
    
}

#pragma mark - -  抢红包 请求
-(void)grabRedPacket:(id<IMessageModel>)model{
    
    NSDictionary *dic = model.message.ext;
//    NSNumber *typNub = dic[@"lqType"];
//    if (typNub.intValue != HongBaoNoSnatch) {
//        return;
//    }
    //    把josn转成data
    NSData * data = [dic[@"typeMsg"] dataUsingEncoding:(NSUTF8StringEncoding)];
    
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
    //    [9]    (null)    @"typeMsg" : @"{\"msg\":\"嗯休息\",\"hid\":211,\"roomId\":2120549}"
    NSString * hidStr = dict[@"hid"];
    //    __weak
    
    [TLHTTPRequest MY_getWithBaseUrl:GrabRedPacketUrl parameters:@{@"hid":hidStr} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
             [self getHongbaoPopView];
            if([[data objectForKey:@"info"] objectForKey:@"money"]){
                
                //                self.moneyLabel.text = [NSString stringWithFormat:@"%@元",data[@"info"][@"money"]];
                NSMutableDictionary *extDict = [NSMutableDictionary dictionaryWithDictionary:dic];
                extDict[@"lqType"] = @(1);
                model.message.ext = extDict;
               [[EMClient sharedClient].chatManager updateMessage:model.message];
                [self.tableView reloadData];
                MY_GLOpenRedPackertView * grabPac = [[MY_GLOpenRedPackertView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
                //注册群组回调
                //    EMGroup *group = [[EMClient sharedClient].groupManager getGroupSpecificationFromServerWithId:self.model.roomGroupId error:nil];
                
                //                grabPac.clubId =  @(self.model.roomId.intValue);
                //                grabPac.clubPersonalNum = self.model.userNum ;// @(group.occupantsCount);
                
                // 去红包详情页
                NSString * moneyStr = [data[@"info"][@"money"] stringValue];
                [grabPac setRedViewMoney:moneyStr withModel:dic];
                
                grabPac.GoToRedPacketInfoBlock = ^(MY_GLOpenRedPackertView * pckertView){
                    
                    [UIView animateWithDuration:0.2 animations:^{
                        
                        pckertView.alpha = 0.0;
                        
                    } completion:^(BOOL finished) {
                        
                        [pckertView removeFromSuperview];
                        
                        MY_TTLClubRedPackListViewController * redinfoVC = [[MY_TTLClubRedPackListViewController alloc]init];
                        redinfoVC.hid = hidStr;
                        [self.navigationController pushViewController:redinfoVC animated:YES];
                        
                    }];
                    
                };
                
                UIWindow *window = [UIApplication sharedApplication].keyWindow;
                [window addSubview:grabPac];
                
            }
            
        }
        else if([[data objectForKey:@"ret"] integerValue] == 10000){
            NSMutableDictionary *extDict = [NSMutableDictionary dictionaryWithDictionary:dic];
            extDict[@"lqType"] = @(2);
            model.message.ext = extDict;
            [[EMClient sharedClient].chatManager updateMessage:model.message];
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
            [self.tableView reloadData];
        }else{
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
           
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        [LQProgressHud showMessage:@"没网怎能忍？"];
    }];
    
}
/*!
 @method
 @brief 选中消息的回调
 @discussion 用户根据messageModel判断，是否自定义处理消息选中时间。返回YES为自定义处理，返回NO为默认处理
 @param viewController 当前消息视图
 @param messageModel 消息模型
 @result 是否采用自定义处理
 */
- (BOOL)messageViewController:(EaseMessageViewController *)viewController
        didSelectMessageModel:(id<IMessageModel>)messageModel{
    if (messageModel.bodyType == EMMessageBodyTypeText) {
        NSDictionary *ext = messageModel.message.ext;
        NSString *linkString = ext[@"linkString"];
        if (![Utility isBlankString:linkString]){
            NSString *messageType = messageModel.message.from;
            if ([messageType isEqualToString:VTaskM]) {
                MY_GLTaskPageViewController * taskVC = [[MY_GLTaskPageViewController alloc]init];
                //    taskVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:taskVC animated:YES];
            }else{
                NSNumber *hid = ext[@"hid"];
                MY_TTLClubRedPackListViewController * redinfoVC = [[MY_TTLClubRedPackListViewController alloc]init];
                redinfoVC.hid = hid.stringValue;
                [self.navigationController pushViewController:redinfoVC animated:YES];
            }
            
        }
    }
    return NO;
}


/*!
 @method
 @brief 点击消息头像
 @discussion 获取用户点击头像回调
 @param viewController 当前消息视图
 @param messageModel 消息模型
 @result
 */
- (void)messageViewController:(EaseMessageViewController *)viewController
  didSelectAvatarMessageModel:(id<IMessageModel>)messageModel
{
    [self.view endEditing:YES];
    NSString *messageType = messageModel.message.from;
    if ([messageType isEqualToString:VTaskM]) {
        return;
    }
    
    if([messageModel.message.from isEqualToString:USERID])
    {
        MY_TTLSelfCenterViewController* infoVc = [[MY_TTLSelfCenterViewController alloc]init];
        infoVc.userID = USERID;
        [self.navigationController pushViewController:infoVc animated:YES];
    }
    else
    {
        NSDictionary * dic;
        if (messageModel.message.from) {
            dic = @{@"page":@(1),@"onUser":messageModel.message.from};
        }
        
        [TLHTTPRequest MY_postWithBaseUrl:PersonalInfoUrl parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                
                NSDictionary * dataDic = [data objectForKey:@"info"];
                
                if ([dataDic count] ) {

//                    if (!self.infoModel) {
//                        self.infoModel = [[MY_LLPersonInfoModel alloc]init];
//                    }
//                    [self.infoModel setValuesForKeysWithDictionary:dataDic];
                    
                    MY_LYPersonInfoModel *infModel  = [[MY_LYPersonInfoModel alloc]init];
                    [infModel setValuesForKeysWithDictionary:dataDic];
                    MY_XTUserBPView *pView = [[MY_XTUserBPView alloc]init];
                    pView.mymodel = self.personalModel;
                    [pView creatBackgroundView:self.view];
                    [pView loadUserModel:infModel];
                    pView.delegate = self;

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
    
    //UserProfileViewController用户自定义的个人信息视图
    //样例的逻辑是选中消息头像后，进入该消息发送者的个人信息
//    UserProfileViewController *userprofile = [[UserProfileViewController alloc] initWithUsername:messageModel.message.from];
//    [self.navigationController pushViewController:userprofile animated:YES];
}

-(void)messageViewController:(EaseMessageViewController *)viewController didLongPassSelectAvatarMessageModel:(id<IMessageModel>)messageModel
{
    [self.chatToolbar.inputTextView becomeFirstResponder];
    self.chatToolbar.inputTextView.text = [NSString stringWithFormat:@"@%@ ",messageModel.nickname];
}

//- (void)callDidEndSenderMessageWithDictionary:(NSDictionary *)dict{

    //  生成message
//    EMMessage * message = nil;
//    if ([dict[@"isCaller"] boolValue]) { //  主叫
//        NSString * to = self.conversation.conversationId;
//        message = [EaseSDKHelper sendTextMessage:dict[@"message"]
//                                              to:to
//                                     messageType:EMChatTypeChat
//                                      messageExt:dict];
//
//        message.status = EMMessageStatusSucceed;
        //        [[EMClient sharedClient].chatManager importMessages:@[message] completion:^(EMError *aError) {
        //
        //        }];
        
//        [self sendTextMessage:dict[@"message"] withExt:dict];
//    }
//}

-(void)LongPoint:(UILongPressGestureRecognizer *)lgz
{
    
}

-(NSMutableArray* )arrayPage
{
    if (!_arrayPage) {
        _arrayPage = [[NSMutableArray alloc]init];
        
    }
    return _arrayPage;
}

-(NSMutableDictionary *)DicPage
{
    if(!_DicPage)
    {
        _DicPage = [[NSMutableDictionary alloc]init];
    }
    return _DicPage;
}

-(void)dealloc{
    [self.chatToolbar removeObserver:self forKeyPath:@"frame"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
