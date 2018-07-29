//
//  ChatViewController.m
//  TogetherLu
//
//  Created by Louie on 17/3/22.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageSystemCell.h"               //  灰色系统消息
#import "RealTimeCallCell.h"                //  实时通话
#import "DemoCallManager.h"
#import "MY_LLPayViewController.h"             //  支付
#import "MY_LLBlackPaceter.h"
#import "MY_LLRedPacketCell.h"                 //  红包消息
#import "MY_LLSystemMessageCell.h"             //  系统消息
#import "MY_LYMessageInfoModel.h"
#import "MY_LLSingleChatRedPacketView.h"
#import "MY_LLchatViewHoneBaoCell.h"
#import "MY_LLChatRedPacketView.h"
#import "MY_TTLHongBaoClickPopView.h"
#import "CRWebViewController.h"
#define ChatViewNativationHeight 44
@interface ChatViewController ()<EaseMessageViewControllerDelegate, EaseMessageViewControllerDataSource, EMCallEndDelegate,MY_LLPayViewControllerDelegate,MY_LLchatViewHoneBaoCellDelegate,MY_LLChatRedPacketSayHWViewDelegate>
{
    NSInteger _hid;
    BOOL _isCanChatBoo; //是否可以聊天
    BOOL _isFirstChat;//初次聊天
    NSInteger _taskStatue;
    
}
@property (nonatomic, strong) UIView * redPacketView;
@property (nonatomic, strong) UIView * affirmView;
@property (nonatomic, copy) NSString * userId;
//@property (nonatomic, assign, readonly) float tbheight;
@property (nonatomic, strong)UIButton * HongBaoBtn;
@property (nonatomic, strong)UIView *taskView;
@property (nonatomic, strong) MY_LYPersonInfoModel * personInfoModel; //自己信息

@property (nonatomic, strong)MY_TTLNewPwopleGuideModel *peopleModel;
@property (nonatomic, strong)UIView *WaiteInvateView;
@end


@implementation ChatViewController
- (UIView *)WaiteInvateView{
    if (_WaiteInvateView == nil) {
        _WaiteInvateView = [[UIView alloc] init];
        _WaiteInvateView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_WaiteInvateView];
        [_WaiteInvateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).mas_offset(0.5);
            make.left.equalTo(self.view.mas_left);
            make.width.equalTo(self.view.mas_width);
            make.height.mas_equalTo(54);
        }];

        UILabel * labeltitle = [[UILabel alloc]init];
        labeltitle.backgroundColor = [UIColor whiteColor];
        [_WaiteInvateView addSubview:labeltitle];
        labeltitle.text = @"等待对方同意您的邀请红包";
        labeltitle.font = [UIFont systemFontOfSize:14];
        labeltitle.textColor = [UIColor colorWithRed:66/255 green:66/255 blue:66/255 alpha:1];
        labeltitle.textAlignment = NSTextAlignmentLeft;

        
        UIColor * titleColor = [Utility colorWithHexString:@"42380e" alpha:1.0];
        UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:THREEC forState:UIControlStateNormal];
        cancelBtn.backgroundColor = [Utility colorWithHexString:@"ffffff" alpha:1.0];
        cancelBtn.layer.masksToBounds = YES;
        cancelBtn.layer.cornerRadius = 3.0;
        cancelBtn.layer.borderColor= [Utility colorWithHexString:@"dddddd" alpha:1.0].CGColor;
        cancelBtn.layer.borderWidth = 0.5;
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [cancelBtn addTarget:self action:@selector(cancelbtnClcik) forControlEvents:UIControlEventTouchUpInside];
        [_WaiteInvateView addSubview:cancelBtn];
        
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(labeltitle.mas_top).mas_offset(0);
            make.right.equalTo(_WaiteInvateView.mas_right).mas_offset(-10);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(30);
        }];
        [labeltitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_WaiteInvateView.mas_centerY);
            make.left.equalTo(_WaiteInvateView.mas_left).mas_offset(10);
            make.right.equalTo(cancelBtn.mas_left).mas_offset(-10);
            make.height.mas_equalTo(30);
        }];

    }
    return _WaiteInvateView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    //  隐藏TabBar
//    self.tabBarController.tabBar.hidden = YES;
//    self.navigationController.navigationBar.translucent = YES;
//    if (!_HongBaoBtn) {
//
//    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SenderSingleRedPacket:) name:KNoticationSenderSingleRedPacket object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SenderSayHellowRedPacket:) name:KNoticationSenderdSayHellowRedPacket object:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self  name:KNoticationSenderSingleRedPacket object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KNoticationSenderdSayHellowRedPacket object:nil];
    //  显示TabBar
//    self.tabBarController.tabBar.hidden = NO;
//    self.navigationController.navigationBar.translucent = NO;

    [self.chatToolbar endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isCanChatBoo = YES;
    // Do any additional setup after loading the view.
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    _personInfoModel = arry.firstObject;
//    _personInfoModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    self.navigationItem.title = self.model.nickName;
    _taskStatue = 0;
    NSString * colorStr = @"#000000";
    //  是贵族 颜色是黄色
    if (self.model.isNoble) {
        colorStr = @"#E2C04E";
    }
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],
                                                                      NSForegroundColorAttributeName:[Utility colorWithHexString:colorStr alpha:1.0]}];
    self.userId = [NSString stringWithFormat:@"%td", self.model.userId];
  
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [DemoCallManager sharedManager].delegate = self;
    CGRect rect = self.tableView.frame;

    CGFloat Fy = 55;
    self.changeTableViewY = Fy;
    rect.origin.y = Fy;
    rect.size.height = SCREEN_HEIGHT  - ChatViewNativationHeight - 55 - BottomHeight;// - BottomHeight
    self.tableView.frame = rect;
//    self.view.backgroundColor = BGCOLOR;
    self.view.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];

    self.delegate = self;
    self.dataSource = self;
    self.showRefreshHeader = YES;
    
    //      右滑返回
    [self addHeaderAffirmView];
    
    //  如果两个人都是上了首页 就把发红包屏蔽
    if ([_personInfoModel.inIndex integerValue] && [self.model.inIndex integerValue]) {
    }else{
        [self addHeaderRedPacketView];
        [self addHonbaoView];
    }
    
    [self setNavBarButton];
    //  两者之间的红包
    [self getOrderRedPaceketStatus];
    
    [self update];
    
    [self isCanChat];
    
    [self.chatToolbar addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld |NSKeyValueObservingOptionNew context:nil];

    [self addObserver:self forKeyPath:@"changeTableViewY" options:NSKeyValueObservingOptionOld |NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"frame"]) {
        CGRect frame = self.HongBaoBtn.frame;
        frame.origin.y =  self.chatToolbar.frame.origin.y - 35-47-47;
        self.HongBaoBtn.frame = frame;
        if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
#warning 新手指导
            [self addNewPwopleComeView];
        }
    }else if ([keyPath isEqualToString:@"changeTableViewY"]){
        NSNumber *newValue = [change objectForKey:NSKeyValueChangeNewKey];
        CGRect rect = self.view.bounds;
        rect.origin.y = newValue.floatValue;
//        rect.size.height = self.view.frame.size.height - newValue.floatValue - BottomHeight;
        rect.size.height = self.view.frame.size.height - newValue.floatValue  - self.chatToolbar.frame.size.height- BottomHeight;
//        rect.size.height = SCREEN_HEIGHT  - newValue.floatValue - ChatViewNativationHeight

        self.tableView.frame = rect;
        
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
            [self addNewPwopleComeView];
        }
    }
}

//添加新手引导
- (void)addNewPwopleComeView{
    //    NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:NewPeople];
    //在这里解档;
    _peopleModel = [NSKeyedUnarchiver unarchiveObjectWithData:NewPeopleFirstCome];
    if (!_peopleModel) {
        _peopleModel = [[MY_TTLNewPwopleGuideModel alloc] init];
    }
    if (!_peopleModel.firstCallRed && _personInfoModel.sex == 0) {
        [self addNewPwopleComeTwoView];
    }else if (!_peopleModel.firstCallRed) {
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[self.HongBaoBtn convertRect: self.HongBaoBtn.bounds toView:window];
        CGRect imgRect = CGRectMake(rect.origin.x - ScaleWidth(50) + 10, rect.origin.y - ScaleWidth(55) + 5, ScaleWidth(50), ScaleWidth(55));
        MY_TTLNewPeopleGuideView *guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rect buttonImgName:@"hongbaoS" imgFrame:imgRect guideImgName:@"私聊红包指示箭头" promptString:@"聊得开心发个小红包给美女吧" corneRadius:rect.size.height/2 Alpha:0.8];
        __weak typeof(self) weakSelf = self;
        guideView.actionBlock = ^{
            [weakSelf addNewPwopleComeTwoView];
        };
        [guideView show];
    }
}
- (void)addNewPwopleComeTwoView{
    //    NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:NewPeople];
    //在这里解档;
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[self.redPacketView convertRect: self.redPacketView.bounds toView:window];
    CGRect imgRect = CGRectMake((SCREEN_WIDTH - ScaleWidth(10))/2, rect.origin.y + 64, ScaleWidth(10), ScaleWidth(72));
    NSString *promptStr ;
    if (_personInfoModel.sex == 0) {
        promptStr = @"在愉快的聊天过程中，土豪哥哥\n会给你发红包邀请你吃美食、品酒\n但是这个红包是需要土豪哥哥再次确\n认同意你才能获得，所以千万不\n能放土豪哥哥鸽子哦！";
    }else{
        promptStr = @"吃美食、品酒，尝试给美女发个\n邀请红包。请放心，该红包发起后\n需要您再次确认开启，美女才能拿到\n红包，不必担心美女会放您鸽子";
    }
    MY_TTLNewPeopleGuideView *guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rect buttonImgName:nil imgFrame:imgRect guideImgName:@"私聊邀请红包指示" promptString:promptStr corneRadius:0 Alpha:0.8];
    [guideView show];
    _peopleModel.firstCallRed = YES;
    NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:_peopleModel];
    ADDNewPeopleFirstCome(peopleData);
}

#pragma mark --是否可以聊天
- (void)isCanChat{
    [LQProgressHud showLoading:@""];
//    __weak typeof(self)weakSelf = self;
    NSDictionary * chatDic = @{@"userId":@(self.model.userId)};
    [TLHTTPRequest MY_postWithBaseUrl:ChatStatusUrl parameters:chatDic success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        [LQProgressHud hide];
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            if ([[data[@"info"] objectForKey:@"status"] integerValue]) {
                // 1 可以聊天
//                NSLog(@"可以聊天");
                _isCanChatBoo = YES;
            }else{
                //0 不可以
                _isCanChatBoo = NO;
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

- (void)addHonbaoView{
    _HongBaoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //        _HongBaoBtn.backgroundColor = [UIColor redColor];
    [_HongBaoBtn setImage:[UIImage imageNamed:@"hongbaoS"] forState:UIControlStateNormal];
    //        [_HongBaoBtn addTarget:self action:@selector(addHongbaoBtnButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_HongBaoBtn addTarget:self action:@selector(goToRechargeButtonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    self.HongBaoBtn.frame = CGRectMake(SCREEN_WIDTH - 12 - 42, SCREEN_HEIGHT - 49 - 35 - 47 -55 -55, 47, 47);
    
    [self.view addSubview:self.HongBaoBtn];
}
#pragma mark - - 发红包页面
-(void)goToRechargeButtonClickMethod:(UIButton*)sender{
    [self.view endEditing:YES];
    MY_LLSingleChatRedPacketView * chatRedPacketView = [[MY_LLSingleChatRedPacketView alloc] init];
    chatRedPacketView.userId =  [NSString stringWithFormat:@"%td", self.model.userId];
    chatRedPacketView.payType = 4;
    chatRedPacketView.delegate = self;
    chatRedPacketView.redPacketType = RedPacketVChat;
    __weak typeof(self)weakSelf = self;
    chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
        MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
        payVC.userId = [NSString stringWithFormat:@"%td", self.model.userId];
        payVC.price = [NSString stringWithFormat:@"%td", price];
        payVC.payType = 4;
        payVC.redSingleType = RedPacketSM;
        payVC.headIconStr = self.model.headIcon;
        payVC.nickName = self.model.nickName;
        payVC.redType = RedPacket_sayHolle;
        payVC.delegate = self;
        [weakSelf.navigationController pushViewController:payVC animated:YES];
    };
    [chatRedPacketView show];
}
#pragma mark - 更新数据库
- (void)update {
    /*
    MY_LLPersonInfoModel *personModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:self.model.userId];
    if (!personModel) {
         [[MessageInfoModel sharedManager] insertModelWith:self.model];
    }else{
        personModel.nickName = self.model.nickName;
        personModel.headIcon = self.model.headIcon;
        [[MessageInfoModel sharedManager] insertModelWith:personModel];
    }
*/
    NSString * where = [NSString stringWithFormat:@"userId = %td", self.model.userId];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *personModel = arry.firstObject;
    if (!personModel) {
       [[MY_LLDBManager sharedManager] insertWithModel: self.model];
    }else{
        personModel.nickName = self.model.nickName;
        personModel.headIcon = self.model.headIcon;
        [[MY_LLDBManager sharedManager] updateModel:personModel withWhere:where];
    }
    
    /*
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    //创建一个信号量（值为0）
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
     NSLog(@"startdispatch");
    dispatch_async(queue, ^{
         NSLog(@"asydispatch");
        NSString * where = [NSString stringWithFormat:@"userId = %td", self.model.userId];
        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
            if (dataArray.count >0) {
                MY_LLPersonInfoModel *personModel = dataArray[0];
                if (!personModel) {
                    personModel = [[MY_LLPersonInfoModel alloc] init];
                }
                personModel.nickName = self.model.nickName;
                personModel.headIcon = self.model.headIcon;
                [[MY_LLDBManager sharedManager] updateModel:personModel withWhere:where];
            }else{
                if (self.model) {
                    [[MY_LLDBManager sharedManager] insertWithModel:self.model];
                }
                
            }
             NSLog(@"blockdispatch");
            //信号量加1
            dispatch_semaphore_signal(semaphore);
        }];
        //信号量减1，如果>0，则向下执行，否则等待
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    });
    NSLog(@"enddispatch");
     */
}

//  导航栏
- (void)setNavBarButton{
    UIBarButtonItem * ringhtBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"EaseUIResource.bundle/figure"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(ringhtBatBtnClick)];
    self.navigationItem.rightBarButtonItem = ringhtBarBtn;
    UIBarButtonItem * leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"backButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}

//  头部红包相关
- (void)addHeaderRedPacketView {
//  红包
    self.redPacketView = [[UIView alloc] init];
    self.redPacketView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.redPacketView];
    [self.redPacketView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(self.view.mas_width);
        make.height.mas_equalTo(54);
    }];
    
    NSArray * redPacketArr = @[@"黄金包", @"白金包", @"黑金包"];
    
    CGFloat space = (SCREEN_WIDTH - 33 * 2 - 75 * 3) / 2;
    
    for (NSInteger i = 0; i < redPacketArr.count; ++i) {
        
        NSString * title = redPacketArr[i];
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setBackgroundImage:[UIImage imageNamed:@"InfoRedPacket"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:title] forState:0];
//        [btn setTitle:title forState:UIControlStateNormal];
//        [btn setTitleColor:[Utility colorWithHexString:@"feff00" alpha:1.0] forState:UIControlStateNormal];
//        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn addTarget:self action:@selector(redPacketBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.redPacketView addSubview:btn];
        btn.titleEdgeInsets = UIEdgeInsetsMake(12, 0, 0, 0);
        btn.tag = 1000 + i;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.redPacketView.mas_centerY);
            make.left.equalTo(self.redPacketView.mas_left).mas_offset(33 + (space + 75) * i);
            make.width.mas_equalTo(75);
            make.height.mas_equalTo(37);
        }];
    }
}

// 添加任务相关
- (void)addTaskHeadViewWithMessage:(NSString *)message refuseBtnTitle:(NSString*)refuseT agreeBtn:(NSString*)agreeT {
    self.taskView = [[UIView alloc] init];
    self.taskView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.taskView];
    [self.taskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(0.5);
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(self.view.mas_width);
        make.height.mas_equalTo(54);
    }];
    
    UILabel * labeltitle = [[UILabel alloc]init];
    labeltitle.backgroundColor = [UIColor whiteColor];
    [self.taskView addSubview:labeltitle];
    labeltitle.text = message;
    labeltitle.font = [UIFont systemFontOfSize:14];
    labeltitle.textColor = [UIColor colorWithRed:66/255 green:66/255 blue:66/255 alpha:1];
    labeltitle.textAlignment = NSTextAlignmentLeft;

    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:refuseT forState:UIControlStateNormal];
    [cancelBtn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [Utility colorWithHexString:@"#5D5D5D" alpha:1.0];
    cancelBtn.layer.masksToBounds = YES;
    cancelBtn.layer.cornerRadius = 3.0;
//    cancelBtn.layer.borderColor= [Utility colorWithHexString:@"dddddd" alpha:1.0].CGColor;
//    cancelBtn.layer.borderWidth = 0.5;
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [cancelBtn addTarget:self action:@selector(taskCancelbtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [self.taskView addSubview:cancelBtn];
    
   
    
    UIButton * affirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [affirmBtn setTitle:agreeT forState:UIControlStateNormal];
    [affirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    affirmBtn.backgroundColor = [Utility colorWithHexString:@"#D5BC54" alpha:1.0];
    affirmBtn.layer.masksToBounds = YES;
    affirmBtn.layer.cornerRadius = 3.0;
    [affirmBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    affirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [affirmBtn addTarget:self action:@selector(taskAffirmBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [self.taskView addSubview:affirmBtn];
    
    [affirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.taskView.mas_centerY);
        make.right.equalTo(self.taskView.mas_right).mas_offset(-10);
        make.width.mas_equalTo(57);
        make.height.mas_equalTo(28);
    }];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.taskView.mas_centerY);
        make.right.equalTo(affirmBtn.mas_left).mas_offset(-10);
        make.width.mas_equalTo(57);
        make.height.mas_equalTo(28);
    }];
    [labeltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.taskView.mas_centerY);
        make.left.equalTo(self.taskView.mas_left).mas_offset(10);
        make.right.equalTo(cancelBtn.mas_left).mas_offset(-10);
        make.height.mas_equalTo(30);
    }];
}

- (void)taskCancelbtnClcik:(UIButton*)sender{
     [LQProgressHud showLoading:nil];
    if (_taskStatue == 1) {
        [TLHTTPRequest MY_postWithBaseUrl:TaskOverURL parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                [LQProgressHud showMessage:@"已中止"];
                
                [self.taskView removeFromSuperview];
                [self getOrderRedPaceketStatus];
                _taskStatue =3;
            }else{
                [LQProgressHud showMessage:data[@"msg"]];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showFailure:@"请求失败，请检查网络"];
        }];
    }else if(_taskStatue ==2){
       
        [TLHTTPRequest MY_postWithBaseUrl:TaskAgreeURL parameters:@{@"userId":@(self.model.userId),@"type":@(2)} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                [LQProgressHud showMessage:@"已拒绝"];
                [self.taskView removeFromSuperview];
                [self getOrderRedPaceketStatus];
                _taskStatue =3;
            }else{
                [LQProgressHud showMessage:data[@"msg"]];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showFailure:@"请求失败，请检查网络"];
        }];
    }

}
- (void)taskAffirmBtnClcik:(UIButton*)sender{
     [LQProgressHud showLoading:nil];
    if (_taskStatue == 1) {
        [TLHTTPRequest MY_postWithBaseUrl:TaskFinishURL parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                [LQProgressHud showMessage:@"已完成"];
                [self.taskView removeFromSuperview];
                [self getOrderRedPaceketStatus];
                _taskStatue =3;
            }else{
                [LQProgressHud showMessage:data[@"msg"]];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showFailure:@"请求失败，请检查网络"];
        }];
        
    }else if(_taskStatue ==2){
        [TLHTTPRequest MY_postWithBaseUrl:TaskAgreeURL parameters:@{@"userId":@(self.model.userId),@"type":@(1)} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
            if ([[data objectForKey:@"ret"] integerValue] == 0) {
                [LQProgressHud showMessage:@"已同意"];
                [self.taskView removeFromSuperview];
                [self addTaskHeadViewWithMessage:@"任务进行中，是否" refuseBtnTitle:@"中止" agreeBtn:@"完成"];
                _taskStatue =1;
            }else{
                [LQProgressHud showMessage:data[@"msg"]];
            }
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            [LQProgressHud showFailure:@"请求失败，请检查网络"];
        }];
    }
    
}//  头部红标相关
- (void)addHeaderAffirmView {
//  确认
    self.affirmView = [[UIView alloc] init];
    self.affirmView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.affirmView];
    
    [self.affirmView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).mas_offset(0.5);
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(self.view.mas_width);
        make.height.mas_equalTo(54);
    }];
    
    UILabel * labeltitle = [[UILabel alloc]init];
    labeltitle.backgroundColor = [UIColor whiteColor];
    [self.affirmView addSubview:labeltitle];
    labeltitle.text = @"是否开启你发送的邀请红包";
    labeltitle.font = [UIFont systemFontOfSize:14];
    labeltitle.textColor = THREEC;
    labeltitle.textAlignment = NSTextAlignmentCenter;
    
    
    UIColor * titleColor = [Utility colorWithHexString:@"42380e" alpha:1.0];
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:THREEC forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [Utility colorWithHexString:@"ffffff" alpha:1.0];
    cancelBtn.layer.masksToBounds = YES;
    cancelBtn.layer.cornerRadius = 3.0;
    cancelBtn.layer.borderColor= [Utility colorWithHexString:@"dddddd" alpha:1.0].CGColor;
    cancelBtn.layer.borderWidth = 0.5;
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [cancelBtn addTarget:self action:@selector(cancelbtnClcik) forControlEvents:UIControlEventTouchUpInside];
    [self.affirmView addSubview:cancelBtn];
    
    UIButton * affirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [affirmBtn setTitle:@"开启" forState:UIControlStateNormal];
    [affirmBtn setTitleColor:titleColor forState:UIControlStateNormal];
    affirmBtn.backgroundColor = ERDCOLOR;
    affirmBtn.layer.masksToBounds = YES;
    affirmBtn.layer.cornerRadius = 3.0;
    [affirmBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    affirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [affirmBtn addTarget:self action:@selector(affirmBtnClcik) forControlEvents:UIControlEventTouchUpInside];
    [self.affirmView addSubview:affirmBtn];

    [affirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.affirmView.mas_top).mas_offset(7);
        make.right.equalTo(self.affirmView.mas_right).mas_offset(-10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.affirmView.mas_top).mas_offset(7);
        make.right.equalTo(affirmBtn.mas_left).mas_offset(-10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    [labeltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.affirmView.mas_top).mas_offset(7);
        make.left.equalTo(self.affirmView.mas_left).mas_offset(10);
        make.right.equalTo(cancelBtn.mas_left).mas_offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    self.affirmView.hidden = YES;
}


- (void)getOrderRedPaceketStatus {
    [LQProgressHud showLoading:nil];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:self.userId forKey:@"userId"];
    
    [TLHTTPRequest MY_getWithBaseUrl:OrderRedPaceketURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        [LQProgressHud hide];
        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            
            if ([data objectForKey:@"info"] && ![[data objectForKey:@"info"] isEqual:[NSNull null]]) {
                NSDictionary * infoDic = [data objectForKey:@"info"];
                _hid = [infoDic[@"hid"] integerValue];
                
                NSInteger status = [infoDic[@"status"] integerValue];
                NSInteger taskStatus = [infoDic[@"taskStatus"] integerValue];
                _taskStatue = taskStatus;
                if (taskStatus == 1) { //1 已同意  2已报名 未同意
                    [self addTaskHeadViewWithMessage:@"任务进行中，是否" refuseBtnTitle:@"中止" agreeBtn:@"完成"];
                }else if (taskStatus ==2){
                    [self addTaskHeadViewWithMessage:@"对方已领取您发布的任务，您是否" refuseBtnTitle:@"拒绝" agreeBtn:@"同意"];
                }
            
                if ((status == 0 || status == 101 ) && (taskStatus != 1 && taskStatus != 2) ) {
                    
                    self.redPacketView.hidden = YES;
                    self.affirmView.hidden = NO;
                    self.WaiteInvateView.hidden = YES;
                    self.changeTableViewY = 55 ;

                }else if (status == 102 && (taskStatus != 1 && taskStatus != 2)){
                    self.redPacketView.hidden = YES;
                    self.affirmView.hidden = YES;
                    self.WaiteInvateView.hidden = NO;
                    self.changeTableViewY = 55 ;
                
                }
                else if(status == 103 && (taskStatus != 1 && taskStatus != 2)){
                    self.redPacketView.hidden = NO;
                    self.affirmView.hidden = YES;
                    self.WaiteInvateView.hidden = YES;
                    self.changeTableViewY = 90 ;
                }
            }

        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showFailure:@"请求失败，请检查网络！"];
    }];
}
#pragma mark - delegate
- (id<IMessageModel>)messageViewController:(EaseMessageViewController *)viewController
                           modelForMessage:(EMMessage *)message{
    id<IMessageModel> model = nil;
    model = [[EaseMessageModel alloc] initWithMessage:message];
    NSString * typeStr = [NSString stringWithFormat:@"%@", message.ext[@"type"]];
    if (model.isSender) { //    自己头像  和自己发的红包
        model.avatarURLPath = self.personalModel.headIcon;
        model.nickname = self.personalModel.nickName;
    } else {    //  别人头像
        
        NSString * where = [NSString stringWithFormat:@"userId = %td",[message.from integerValue]];
        NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
        MY_LYPersonInfoModel *userModel = arry.firstObject;
        
//        MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[message.from integerValue]];
        model.avatarURLPath = userModel.headIcon;
        model.nickname = userModel.nickName;
    }
    model.failImageName = @"EaseUIResource.bundle/imageDownloadFail";
    return model;
}

#pragma mark - 右边按钮点击
- (void)ringhtBatBtnClick {
    
    MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
    
    selfVc.userID = [NSString stringWithFormat:@"%td", self.model.userId];
    
    [self.navigationController pushViewController:selfVc animated:YES];
}

#pragma mark - 左边按钮点击
- (void)backClick{
    
    if (self.isPayPush) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else {
        if(self.pushfrom.length == 0)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            NSInteger index = [[self.navigationController viewControllers] indexOfObject:self];
            [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:index-2]animated:YES];
        }
    }
}

#pragma mark - - 收到消息
- (BOOL)messageViewController:(EaseMessageViewController *)viewController
            didReceiveMessage:(EMMessage *)message{
    
    
    id<IMessageModel> model = nil;
    model = [[EaseMessageModel alloc] initWithMessage:message];
    NSDictionary *ext = model.message.ext;
    
    NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
    
    if (message.direction == EMMessageDirectionReceive && ![typeStr isEqualToString:@"sendHongbao"]) {
        _isCanChatBoo = YES;
    }
    
    if (ext[@"type"]) {
    
        if ( [typeStr isEqualToString:@"askInviteHongbaoSuccess"]) {
            NSString *typeStr = ext[@"typeMsg"];
            
            NSData *jsonData = [typeStr dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *typeMsg = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
            _hid = [typeMsg[@"hid"] integerValue];
            self.redPacketView.hidden = YES;
            self.affirmView.hidden = YES;
            self.WaiteInvateView.hidden = NO;
            self.changeTableViewY = 55 ;
            
        }
        //  已经发送了邀请红包 别人已经接受了邀请红包  显示开启和取消
        else if ( [typeStr isEqualToString:@"acceptAskHongbao"]) {
            self.redPacketView.hidden = YES;
            self.affirmView.hidden = NO;
            self.WaiteInvateView.hidden = YES;
            self.changeTableViewY = 55 ;
        }// 别人拒绝了红包 显示发包View
//        NSString * typeStr = [NSString stringWithFormat:@"%@", message.ext[@"type"]];
        else if([typeStr isEqualToString:@"refuseAskHongbao"]){
            self.redPacketView.hidden = NO;
            self.WaiteInvateView.hidden = YES;
            self.affirmView.hidden = YES;
            self.changeTableViewY = 55 ;
            

        }
//        else if([typeStr isEqualToString:@"sendHongbao"]){
//            MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:message.from.integerValue];
//            userModel.isCanChat = 1;
//            [[MessageInfoModel sharedManager] insertModelWith:userModel];
//        }else if ([typeStr isEqualToString:@"outTimeAskHongbao"]){
//            MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:message.from.integerValue];
//            userModel.isCanChat = 2;
//            [[MessageInfoModel sharedManager] insertModelWith:userModel];
//        }
    }
    EMMessageBody *firstMessageBod = message.body;
    if(firstMessageBod.type == EMMessageBodyTypeText) {
        EMTextMessageBody *textBody = (EMTextMessageBody *)firstMessageBod;
        if (textBody.text) {
            BOOL nic = [textBody.text rangeOfString:@"饭"].location == NSNotFound ? NO : YES;
            BOOL jf = [textBody.text rangeOfString:@"日料"].location == NSNotFound ? NO : YES;
            BOOL wine = [textBody.text rangeOfString:@"酒"].location == NSNotFound ? NO : YES;
//            BOOL p = [textBody.text rangeOfString:@"玩"].location == NSNotFound ? NO : YES;
            BOOL cg = [textBody.text rangeOfString:@"唱歌"].location == NSNotFound ? NO : YES;
            BOOL foodBool = nic || jf || wine || cg;
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            MY_LYPersonInfoModel *pM = arry.firstObject;
            //                    MY_LLPersonInfoModel *pM = [[MessageInfoModel sharedManager]loadPersonModelWithID:[USERID integerValue]];
            if (pM.sex == 0 && foodBool) {
                EMMessage * messageNew = nil;
                EMTextMessageBody * body = [[EMTextMessageBody alloc] initWithText:@"土豪哥哥想约你共进晚餐？快让他发个黄金包/白金包/黑金包吧"];
                //                        NSString * from = message.from;
                //                        NSString * to = message.to;
                NSMutableDictionary * ext = [NSMutableDictionary dictionary];//
                [ext setObject:@"9" forKey:@"type"];
                messageNew = [[EMMessage alloc] initWithConversationID:message.conversationId from:nil to:nil body:body ext:ext];
                messageNew.direction =EMMessageDirectionReceive;
                messageNew.chatType = EMChatTypeChat;
                messageNew.status = EMMessageStatusSucceed;//
                
                EMError * error = [[EMError alloc] init];//
                [self.conversation insertMessage:messageNew error:&error];
              
                if (error) {
                    NSLog(@"error:-- %@",error);
                }
                [self insertMessageRefreshWithMessage:messageNew];
                
            }
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
    
    if (ext[@"realTimeCall"]) {
        static NSString * cId;
        if (messageModel.isSender) {
            cId = @"RealTimeSenderCallCell";
        }else{
            cId =  @"RealTimeReceiveCallCell";
        }
//        static NSString * cId = @"RealTimeCallCell";
        
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
    
        NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
        
        if ([typeStr isEqualToString:@"askHongbao"]) {
            
            static NSString * cId = @"MY_LLRedPacketCell";
            
            MY_LLRedPacketCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
            if (cell == nil) {
                cell = [[MY_LLRedPacketCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            [cell setMessageData:messageModel withUserId:self.userId];
            
            cell.headIcon.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickheadIocn)];
            [cell.headIcon addGestureRecognizer:labelTapGestureRecognizer];
            
            cell.btnClickBlock = ^(BOOL isCancel) {
              
                NSString *typeStr = ext[@"typeMsg"];
                
                NSData *jsonData = [typeStr dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *typeMsg = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
                
                [self grepRedPacketWith:!isCancel withHid:[typeMsg[@"hid"] integerValue]];
            };
            return cell;
        }else if ( [typeStr isEqualToString:@"send_little_hongbao"] || [typeStr isEqualToString:@"sendHongbao"]){  //send_little_hongbao 小红包     sendHongbao招呼红包
//            NSLog(@"%@", ext[@"typeMsg"]);
            MY_LLchatViewHoneBaoCell *cell = [MY_LLchatViewHoneBaoCell cellForTableView:tableView withModel:messageModel];
            cell.delegate = self;
            
            cell.model = messageModel;
            //  隐藏招呼红包
//            self.redPacketView.hidden = YES;
//            self.affirmView.hidden = NO;
//            CGRect rect = self.tableView.frame;
//            rect.origin.y = 90;
//            rect.size.height = _tbheight - 90;
//            self.tableView.frame = rect;
            
            return cell;
        }
        else {
            static NSString * cId = @"MY_LLSystemMessageCell";
            
//            if ([typeStr isEqualToString:@"askHongbaoSuccess"]) {
            
//                self.redPacketView.hidden = YES;

//                self.affirmView.hidden = NO;

//                CGRect rect = self.tableView.frame;
//                rect.origin.y = 90;
//                rect.size.height = SCREEN_HEIGHT - 90;
//                self.tableView.frame = rect;
//            }
//            else {
//                self.redPacketView.hidden = NO;
                
//                self.affirmView.hidden = YES;
//
//                CGRect rect = self.tableView.frame;
//                rect.origin.y = 55;
//                rect.size.height = SCREEN_HEIGHT - 55;
//                self.tableView.frame = rect;
//            }
            
            MY_LLSystemMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cId];
            if (cell == nil) {
                cell = [[MY_LLSystemMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cId];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
           
            cell.messageLabel.text = messageModel.text;
            return cell;
        }
    }
    return nil;
}


//  返回cell高度
- (CGFloat)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth
{
    
    if ([messageModel isKindOfClass:[NSString class]]) {
        return 45;
    }
    
    NSDictionary *ext = messageModel.message.ext;
    
    if (ext[@"type"]) {
        
        NSString * typeStr = [NSString stringWithFormat:@"%@", ext[@"type"]];
        
        if ([typeStr isEqualToString:@"askHongbao"]) {
            //  5 + 4 + 13 + 文字高度 + 13 + 29
            return 212 / 2 + 5 + 15;
        }else if ([typeStr isEqualToString:@"send_little_hongbao_success"] || [typeStr isEqualToString:@"send_little_hongbao"]|| [typeStr isEqualToString:@"sendHongbaoSuccess"] ||[typeStr isEqualToString:@"sendHongbao"]){ //
//            NSNumber *typNub = ext[@"lqType"];
//            if (typNub.intValue == 1) {
//                return 95;
//            }
            return 100;
        }else {
            CGFloat height = [Utility stringSizeWithString:messageModel.text textSize:12 width:SCREEN_WIDTH - 80 height:0].height;
            return height + 10 + 15 + 2;
        }
    }
    else if (ext[@"realTimeCall"]) {
        return 53;
    }
    //    NSDictionary *ext = messageModel.message.ext;
    //    if ([RedpacketMessageModel isRedpacket:ext] || [RedpacketMessageModel isRedpacketTransferMessage:ext])    {
    //    }else if ([RedpacketMessageModel isRedpacketTakenMessage:ext]) {
    //        return [RedpacketTakenMessageTipCell heightForRedpacketMessageTipCell];
    //    }
    return 0;
}

- (void)messageViewController:(EaseMessageViewController *)viewController
  didSelectAvatarMessageModel:(id<IMessageModel>)messageModel
{
    
    if([messageModel.message.from isEqualToString:USERID])
    {
        MY_TTLSelfCenterViewController* infoVc = [[MY_TTLSelfCenterViewController alloc]init];
        infoVc.userID = USERID;
        [self.navigationController pushViewController:infoVc animated:YES];
    }
    else
    {
        MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
        
        selfVc.userID = [NSString stringWithFormat:@"%td", self.model.userId];
        
        [self.navigationController pushViewController:selfVc animated:YES];
    }
    
    //UserProfileViewController用户自定义的个人信息视图
    //样例的逻辑是选中消息头像后，进入该消息发送者的个人信息
    //    UserProfileViewController *userprofile = [[UserProfileViewController alloc] initWithUsername:messageModel.message.from];
    //    [self.navigationController pushViewController:userprofile animated:YES];
}
- (BOOL)messageViewControllerSendMessages:(EaseMessageViewController *)viewController ForMessage:(EMMessage *)message{ //返回yes 不可以聊天，返回NO 可以聊天
    if (self.isTaskPagePush) {
        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:message.ext];
        mDict[@"taskerOwn"] = @(1);   // 1 就是从任务跳过去     0不是
        message.ext = mDict;
        self.isTaskPagePush = NO;
    }
//    NSString * where = [NSString stringWithFormat:@"userId = %td",self.model.userId];
//    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where];
//    MY_LLPersonInfoModel *userModel = arry.firstObject;
    
//    MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:self.model.userId];
//    if (userModel.isCanChat == 1) {
//        [TLHTTPRequest MY_postWithBaseUrl:GrepRedPacketURL parameters:@{@"type":@(1),@"userId":@(userModel.userId)} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//            if ([data[@"ret"] integerValue] == 0) {
//                userModel.isCanChat = 0;
////                [[MessageInfoModel sharedManager] insertModelWith:userModel];
//                [[MY_LLDBManager sharedManager] updateModel:userModel withWhere:where];
//            }else {
//                [LQProgressHud showMessage:data[@"msg"]];
//            }
//        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//            [LQProgressHud showMessage:@"领取失败"];
//        }];
//        return NO;
//    }
//
//    if (self.personalModel.isNoble < 1 && userModel.isCanChat == 2) {
//        [self.view endEditing:YES];
//        [LQProgressHud showMessage:@"招呼红包已到期，如果想继续聊天请发红包或者成为贵族"];
//        return YES;
//    }
    if (!_isCanChatBoo) {
        __weak typeof(self)weakSelf = self;
        [self.view endEditing:YES];
//         [LQProgressHud showMessage:@"您不可以聊天，请先发个招呼红包"];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        MY_LLChatRedPacketView * chatRedPacketView = [[MY_LLChatRedPacketView alloc] init];
        chatRedPacketView.delegate = self;
        chatRedPacketView.model = self.model;
        chatRedPacketView.userId = [NSString stringWithFormat:@"%td",self.model.userId];
    
        chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
            MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
            payVC.userId = [NSString stringWithFormat:@"%td",self.model.userId];
            payVC.price = [NSString stringWithFormat:@"%td", price];
            payVC.payType = 1;
            payVC.headIconStr = self.model.headIcon;
            payVC.nickName = self.model.nickName;
            payVC.redType = RedPacket_sayHolle;
            payVC.redSingleType = RedPacketSayHolle;
            [weakSelf.navigationController pushViewController:payVC animated:YES];
        };
        chatRedPacketView.GetNobilityBlock = ^(NSInteger index) {
            if (index == 1) {
                MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
                noVc.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:noVc animated:YES];
            }
        };
        [chatRedPacketView show];
            
//        });
        return YES;
    }
    return NO;
}

-(void)clickheadIocn
{
    MY_TTLSelfCenterViewController* selfVc = [[MY_TTLSelfCenterViewController alloc]init];
    
    selfVc.userID = [NSString stringWithFormat:@"%td", self.model.userId];
    
    [self.navigationController pushViewController:selfVc animated:YES];
}


- (void)callDidEndSenderMessageWithDictionary:(NSDictionary *)dict{
    
    //  生成message
    EMMessage * message = nil;
    if ([dict[@"isCaller"] boolValue]) { //  主叫
        
//        NSString * to = self.conversation.conversationId;
//
//        message = [EaseSDKHelper sendTextMessage:dict[@"message"]
//                                              to:to
//                                     messageType:EMChatTypeChat
//                                      messageExt:dict];
//
//        message.status = EMMessageStatusSucceed;
//        [[EMClient sharedClient].chatManager importMessages:@[message] completion:^(EMError *aError) {
//
//        }];

        [self sendTextMessage:dict[@"message"] withExt:dict];
    }
}


#pragma mark - 发红包
- (void)redPacketBtnClick:(UIButton *)btn {
    [self.view endEditing:YES];
    NSInteger index = btn.tag - 1000;
    
    switch (index) {
        case 0:
        {
            MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
            payVC.userId = [NSString stringWithFormat:@"%@", self.userId];
            payVC.price = @"1300";
            payVC.payType = 2;
            payVC.headIconStr = self.model.headIcon;
            payVC.nickName = self.model.nickName;
            payVC.redType = RedPacket_gold;
//            [payVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:payVC animated:YES];
        }
            break;
        case 1:
        {
            MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
            payVC.userId = [NSString stringWithFormat:@"%@", self.userId];
            payVC.price = @"2500";
            payVC.payType = 2;
            payVC.headIconStr = self.model.headIcon;
            payVC.nickName = self.model.nickName;
            payVC.redType = RedPacket_platina;
//            [payVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:payVC animated:YES];
        }
            break;
        default:
        {
            __weak typeof(self) wSelf = self;
            MY_LLBlackPaceter * chatRedPacketView = [[MY_LLBlackPaceter alloc] init];
            chatRedPacketView.affirmBtnblock = ^(NSInteger price) {
                
                MY_LLPayViewController * payVC = [[MY_LLPayViewController alloc] init];
                payVC.userId = [NSString stringWithFormat:@"%@", self.userId];
                payVC.price = [NSString stringWithFormat:@"%td", price];
                payVC.payType = 2;
                payVC.headIconStr = self.model.headIcon;
                payVC.nickName = self.model.nickName;
                payVC.redType = RedPacket_blackGold;
//                [payVC setHidesBottomBarWhenPushed:YES];
                [wSelf.navigationController pushViewController:payVC animated:YES];
            };
            [chatRedPacketView show];
        }
            break;
    }
}


- (void)cancelbtnClcik {
    
    [self affirmOrcancelRedPacket:2];
}

- (void)affirmBtnClcik {
    
    [self affirmOrcancelRedPacket:1];
}

//  1 取消 2 开启
- (void)affirmOrcancelRedPacket:(NSInteger)type {
    
    NSMutableDictionary * parameters = [NSMutableDictionary dictionaryWithObject:self.userId forKey:@"userId"];
    
    [parameters setValue:@(type) forKey:@"type"];
    
    if (_hid) {
        [parameters setValue:@(_hid) forKey:@"hid"];
    }
    
    //  /dataapi/cg/user/giveHongbao
    [TLHTTPRequest MY_postWithBaseUrl:GiveRedPacketURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] integerValue] == 0) {
            
            if ([parameters[@"type"] integerValue] == 1) {
                
                [LQProgressHud showMessage:@"开启成功"];
            }
            else {
                [LQProgressHud showMessage:@"取消成功"];
            }
            self.redPacketView.hidden = NO;
            self.WaiteInvateView.hidden = YES;
            self.affirmView.hidden = YES;
            self.changeTableViewY = 55 ;

            
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
            if ([data[@"msg"] isEqualToString:@"红包已经领取"]) {
                self.redPacketView.hidden = NO;
                self.affirmView.hidden = YES;
                self.WaiteInvateView.hidden = YES;
                self.changeTableViewY = 55;
            }
            
//            self.redPacketView.hidden = YES;
//            self.affirmView.hidden = YES;
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showFailure:@"网络异常！"];
    }];
}


#pragma mark - 收取Or接收红包
//  /dataapi/cg/user/grepHongbao
- (void)grepRedPacketWith:(BOOL)isCancel withHid:(NSInteger)hid {
    
    NSMutableDictionary * parameters = [NSMutableDictionary dictionaryWithObject:self.userId forKey:@"userId"];
    
    [parameters setValue:@1 forKey:@"type"];
    if (isCancel) {
        [parameters setValue:@2 forKey:@"type"];
    }
    
    [parameters setValue:@(hid) forKey:@"hid"];

    [TLHTTPRequest MY_postWithBaseUrl:GrepRedPacketURL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([data[@"ret"] integerValue] == 0) {
            
            if ([parameters[@"type"] integerValue] == 1) {
                
                [LQProgressHud showMessage:@"您接受了红包"];
                
            }
            else {
                [LQProgressHud showMessage:@"您拒绝了红包"];
            }
        }
        else {
            [LQProgressHud showMessage:data[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
}

#pragma mark MY_LLPayViewControllerDelegate
- (void)paySucessForViewController:(MY_LLPayViewController *)vc withHid:(NSString*)hid{
//    NSDictionary *dict =@{@"type":@"singleHongbao",@"lqType":@"0",@"hid":hid};
//    [self sendTextMessage:@"" withExt:dict];
}
- (void)paySucessForSayHellowRedPacketView:(MY_LLChatRedPacketView *)view withPrice:(NSString *)price{
    _isCanChatBoo = YES;
}
#pragma mark MY_LLchatViewHoneBaoCellDelegate
- (void)hongBaoButtonSelected:(id<IMessageModel>)model{
    
//@{@"type":@(1),@"userId":@(userModel.userId)}
    [LQProgressHud showLoading:nil];
    NSDictionary *dic = model.message.ext;
    NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
     NSString * typeStr = [NSString stringWithFormat:@"%@", dic[@"type"]];
    if ([typeStr isEqualToString:@"send_little_hongbao"]) {
        paramDict[@"hid"] = dic[@"hid"];
        
    }else{
         paramDict[@"userId"] = @(self.model.userId);
    }
    paramDict[@"type"] = @(1);
    [TLHTTPRequest MY_getWithBaseUrl:GrepRedPacketURL parameters:paramDict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            [LQProgressHud hide];
                NSMutableDictionary *extDict = [NSMutableDictionary dictionaryWithDictionary:dic];
                extDict[@"lqType"] = @(1);
                model.message.ext = extDict;
                [[EMClient sharedClient].chatManager updateMessage:model.message];
                [self.tableView reloadData];
             [self getHongbaoPopView];
            
        }
        else if([[data objectForKey:@"ret"] integerValue] == 10000){
//            NSMutableDictionary *extDict = [NSMutableDictionary dictionaryWithDictionary:dic];
//            extDict[@"lqType"] = @(2);
//            model.message.ext = extDict;
//            [[EMClient sharedClient].chatManager updateMessage:model.message];
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
//发送小红包消息
- (void)SenderSingleRedPacket:(NSNotification*)not{
//[0]    (null)    @"date" : 2018-01-26 11:42:06 UTC    [0]    (null)    @"date" : 2018-01-26 11:45:51 UTC    [0]    (null)    @"date" : 2018-01-26 11:45:51 UTC
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    mDict[@"hid"] = not.userInfo[@"hid"];
    mDict[@"totalMoney"] = not.userInfo[@"totalMoney"];
    mDict[@"type"] = @"send_little_hongbao";
    [self sendTextMessage:@"给你发了一个愉快的红包" withExt:mDict];
//    [self sendMessageWith:mDict withMessag:@"给你发了一个愉快的红包"];
    
}
- (void)SenderSayHellowRedPacket:(NSNotification*)not{
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    mDict[@"totalMoney"] = not.userInfo[@"totalMoney"];
    mDict[@"type"] = @"sendHongbao";
     NSString *messageStr = [NSString stringWithFormat:@"被你的美貌和气质所吸引，和您打了一个招呼，\n并给您发了一个%@元的红包",not.userInfo[@"totalMoney"]];
    [self sendTextMessage:messageStr withExt:mDict];
//    [self sendMessageWith:mDict withMessag:messageStr];
    
}
- (void)dealloc {
    [self.chatToolbar removeObserver:self forKeyPath:@"frame"];
    [self removeObserver:self forKeyPath:@"changeTableViewY"];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:KNoticationSenderSingleRedPacket object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:KNoticationSenderdynamicRedPacket object:nil];
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
