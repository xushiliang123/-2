 //
//  MY_TTLLoginViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/8.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYLoginViewController.h"
#import "MY_GLEditMyInfoViewController.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "MY_TTLMySetViewController.h"
#import "MY_XTContactViewController.h"
#import "MY_LYMessageInfoModel.h"
//  成为贵族
#import "MY_GLBeGZViewController.h"
//  引导页
#import "MY_XTGuideViewController.h"

//  标签
#import "CounterMarkViewController.h"

@interface MY_LYLoginViewController ()<UITextFieldDelegate>
{
    UITextField* _textFiledPhone;
    UITextField* _textFiledCode;
    UIButton* _getCodeBtn;
    UIButton*    _btnLogin;
    
    UIViewController * _topVC;
    TabBarController * mainVC;
    
    MBProgressHUD *HUD;
}

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnKeyHandler;
@property (nonatomic, assign) int timeNumber;

@end

@implementation MY_LYLoginViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    mainVC = (TabBarController *)self.presentingViewController;
    
//    mainVC = (TabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([mainVC isKindOfClass:[TabBarController class]]) {
        
        BaseNavigationController * curNav = mainVC.selectedViewController;
        _topVC = [curNav topViewController];
    }else if ([mainVC isKindOfClass:[UINavigationController class]]){
        
        BaseNavigationController * vc = (BaseNavigationController*)mainVC;
        _topVC = vc.topViewController;
    }
    
    if ([_topVC isKindOfClass:[MY_TTLMySetViewController class]]) {

        [_topVC.navigationController popToRootViewControllerAnimated:NO];
        mainVC.selectedIndex = 0;
    }

//    if ([_topVC isKindOfClass:[MY_GLEditMyInfoViewController class]]) {
//        [_topVC.navigationController popToRootViewControllerAnimated:NO];
//    }
//
//    if ( [_topVC isKindOfClass:[MY_XTGuideViewController class]]) {
//
//        [_topVC.navigationController popToRootViewControllerAnimated:NO];
//    }
    
    mainVC.selectedIndex = 0;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.tabBarController.tabBar.hidden = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.translucent = YES;
    
    self.navigationController.navigationBarHidden = YES;
    
}


- (void)viewWillDisappear:(BOOL)animated{
        [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBarHidden = NO;
}


//-(void)enterForeground:(NSNotification*)noti{
//
//    NSDictionary * dic = noti.userInfo;
//
//    NSNumber * count = dic[@"time"];
//
//    NSInteger margin = 60 - ([count integerValue] + (60 - _timeNumber));
//
//    if ( 0 < margin && margin < 60) {
//
//        _timeNumber = (int)margin;
//        _getCodeBtn.userInteractionEnabled = NO;
//
//    }else{
//
//        _timeNumber = 60;
//
//        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
//        _getCodeBtn.userInteractionEnabled = YES;
//        [_timer invalidate];
//    }
//}
- (void)showAlertView{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"您的账号在别的设备上登录，请重新登录"
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self addNavBtn:nil isLeft:YES target:self action:@selector(backClick) bgImageName:@"aa"];
//
    if (_isShowAlertView) {
        [self showAlertView];
    }
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterForeground:) name:@"MY_GLApplicationWillEnterForeground" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showAlertView) name:@"userAccountDidLoginFromOtherDeviceAlertView" object:nil];
    // Do any additional setup after loading the view.
    UIImageView* imgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登录-底图"]];
    imgv.frame = self.view.bounds;
    [self.view addSubview:imgv];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.mode = MBProgressHUDModeText;
    
    

    self.timeNumber = 60;
    [self uiConfig];
    
}

-(void)uiConfig
{
    UIImageView* imgvLogo = [[UIImageView alloc]init];
    imgvLogo.image = [UIImage imageNamed:@"vLogo"];
    [self.view addSubview:imgvLogo];
    [imgvLogo mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_right).offset(15);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(133);
        make.height.mas_equalTo(91);
    }];
    
    UILabel* labelTitle = [[UILabel alloc]init];
    labelTitle.text = @"闲趣：“闲暇之余，有趣约会”";
    labelTitle.font = [UIFont systemFontOfSize:18];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.textColor = [Utility colorWithHexString:@"d7d7d7" alpha:1];
    [self.view addSubview:labelTitle];
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.top.equalTo(imgvLogo.mas_bottom).offset(20);
        make.height.mas_equalTo(18);
    }];
    
    _textFiledPhone = [[UITextField alloc]init];
    _textFiledPhone.delegate = self;
    _textFiledPhone.placeholder = @"请输入手机号";
    if (UserObject(@"personMobileNum")) {
        _textFiledPhone.text = UserObject(@"personMobileNum");
    }
    _textFiledPhone.font = [UIFont systemFontOfSize:16];
    _textFiledPhone.textColor = [Utility colorWithHexString:@"d7d7d7" alpha:1];
    [_textFiledPhone setValue:[Utility colorWithHexString:@"706e70" alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:_textFiledPhone];
    [_textFiledPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(self.view.mas_top).offset(568/2);
        make.height.mas_equalTo(16);
    }];
    
    UIView* viewLine = [[UIView alloc]init];
    viewLine.backgroundColor = [Utility colorWithHexString:@"787779" alpha:1];
    [self.view addSubview:viewLine];
    [viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(_textFiledPhone.mas_bottom).offset(15);
        make.height.mas_equalTo(1);
    }];
    
    _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    _getCodeBtn.userInteractionEnabled = YES;
    [_getCodeBtn setTitleColor:[Utility colorWithHexString:@"d7d7d7" alpha:1] forState:UIControlStateNormal];
    [_getCodeBtn addTarget:self action:@selector(getCodeBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_getCodeBtn];
    [_getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(viewLine.mas_bottom).offset(0);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(120);
    }];
    
    _textFiledCode = [[UITextField alloc]init];
    _textFiledCode.delegate = self;
    _textFiledCode.placeholder = @"请输入验证码";
    _textFiledCode.font = [UIFont systemFontOfSize:16];
    _textFiledCode.textColor = [Utility colorWithHexString:@"d7d7d7" alpha:1];
    [_textFiledCode setValue:[Utility colorWithHexString:@"706e70" alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:_textFiledCode];
    [_textFiledCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(_getCodeBtn.mas_left);
        make.top.equalTo(viewLine.mas_bottom).offset(15);
        make.height.mas_equalTo(16);
    }];

    
    _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
//    _btnLogin.layer.masksToBounds = YES;
//    _btnLogin.layer.cornerRadius  = 14;
    [self.view addSubview:_btnLogin];
//    [_btnLogin setBackgroundColor:GOLDCOLOR];
//    [_btnLogin setImage:[UIImage imageNamed:@"loginBtn"] forState:0];
    [_btnLogin setBackgroundImage:[UIImage imageNamed:@"loginBackImage"] forState:UIControlStateNormal];
    [_btnLogin setTitle:@"登陆" forState:UIControlStateNormal];
//    [_btnLogin setBackgroundImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
//    [_btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    [_btnLogin addTarget:self action:@selector(loginBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [_btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.top.equalTo(_textFiledCode.mas_bottom).offset(80);
        make.height.mas_equalTo(48);
    }];

    UILabel* labelDetail = [[UILabel alloc]init];
    labelDetail.text = @"注册账号必须通过MOYO会员邀请";
    labelDetail.font = [UIFont systemFontOfSize:14];
    labelDetail.textAlignment = NSTextAlignmentCenter;
    labelDetail.textColor = [Utility colorWithHexString:@"ffffff" alpha:1];
    [self.view addSubview:labelDetail];
    [labelDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.top.equalTo(_btnLogin.mas_bottom).offset(12);
        make.height.mas_equalTo(14);
    }];
    
    UIButton *contact = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:contact];
    [contact setTitle:@"联系客服" forState:UIControlStateNormal];
    contact.titleLabel.font = [UIFont systemFontOfSize:15];
    [contact setTitleColor:[Utility colorWithHexString:@"#FCFCFC" alpha:1] forState:UIControlStateNormal];
    [contact addTarget:self action:@selector(Gocontact) forControlEvents:(UIControlEventTouchUpInside)];
    [contact mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-32);
        make.left.equalTo(self.view.mas_left).offset(280);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.height.mas_equalTo(15);
    }];

    
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyDone;
    
    _textFiledPhone.delegate = self;
    _textFiledCode.delegate = self;

    _textFiledPhone.returnKeyType = UIReturnKeyNext;
    _textFiledPhone.clearsOnBeginEditing = NO;
    _textFiledPhone.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _textFiledCode.keyboardType = UIKeyboardTypeNumberPad;
    _textFiledCode.clearsOnBeginEditing = NO;
    _textFiledCode.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //  记住账号
//    if (USERID) {
//        NSString *where = [NSString stringWithFormat:@"userId = %td", [USERID integerValue]];
//        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//            for (BaseModel * model in dataArray) {
//                if ([model isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                    MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)model;
//                    if (userModel.userId == [USERID integerValue]) {
//                        _textFiledPhone.text = [NSString stringWithFormat:@"%td", userModel.mobileNum];
//                    }
//                }
//            }
//        }];
//    }
    
}

-(void)backClick{
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationRequestLocation" object:nil];
        [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationDaiyan object:nil];
    }];
}

#pragma mark - 联系客服
-(void)Gocontact
{
    MY_XTContactViewController * vc = [MY_XTContactViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 获取验证码
- (void)getCodeBtnClick {
    
    NSDictionary * dict = [NSMutableDictionary dictionaryWithObject:@102 forKey:@"type"];

//    if([self isEmpty:_textFiledPhone.text])
//    {
//        [LQProgressHud showMessage:@"输入手机号不能存在空格"];
//        return;
//    }
    
    _textFiledPhone.text= [_textFiledPhone.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (_textFiledPhone.text.length == 11) {

        [dict setValue:_textFiledPhone.text forKey:@"mobile"];
        
    }else {

        [LQProgressHud showMessage:@"请输入正确的手机号"];
        return;
    }
    [_textFiledCode becomeFirstResponder];
    [_getCodeBtn setTitle:[NSString stringWithFormat:@"(%ds)可重发",_timeNumber] forState:UIControlStateNormal];
    
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    //  获取版本号
//    [TLHTTPRequest MY_getWithBaseUrl:GetiOSVersion parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
//
//        if (0 == [[data objectForKey:@"ret"] integerValue]) {
//
//            //  存储版本号
//            REMVERSION;
//            ADDVERSION(data[@"info"]);
//            [[NSUserDefaults standardUserDefaults] synchronize];

            //  获取验证码 
            [TLHTTPRequest MY_postWithBaseUrl:GetCodeURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                
                if ([[data objectForKey:@"ret"] integerValue] == 0) {
                    
                }else{
                    if ([data objectForKey:@"msg"]) {
                        HUD.detailsLabelText = [data objectForKey:@"msg"];
                        [HUD showAnimated:YES whileExecutingBlock:^{
                            sleep(2);
                        }
                          completionBlock:^{
                              //                      [HUD removeFromSuperview];
                              //                      HUD = nil;
                          }];
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                [LQProgressHud showMessage:@"请求失败，请检查网络Y"];
            }];
            
            //            info
//        }else{
//
//            if ([data objectForKey:@"msg"]) {
//                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
//            }
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//
//        [LQProgressHud showMessage:@"请求失败，请检查网络V"];
//
//    }];
    
}

#pragma mark --定时器方法
- (void)autoMove {
    
    _timeNumber--;
    _getCodeBtn.userInteractionEnabled = NO;
    [_getCodeBtn setTitle:[NSString stringWithFormat:@"(%ds)可重发",_timeNumber] forState:UIControlStateNormal];
    if (_timeNumber == 0) {
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getCodeBtn.userInteractionEnabled = YES;
        [_timer invalidate];
        _timeNumber = 60;
    }
}

-(void)loginBtnClick {
    [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _getCodeBtn.userInteractionEnabled = YES;
    [_timer invalidate];
    _timeNumber = 60;
    
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    if (![Utility isBlankString:_textFiledPhone.text]) {
        
        [dict setObject:_textFiledPhone.text forKey:@"mobile"];
    }
    else{
        [LQProgressHud showMessage:@"请输入正确的手机号"];
        return;
    }
    
    if (![Utility isBlankString:_textFiledCode.text]) {
        [dict setObject:_textFiledCode.text forKey:@"code"];
    }
    else{
        [LQProgressHud showMessage:@"请输入正确的验证码"];
        return;
    }
    
    [TLHTTPRequest MY_postWithBaseUrl:LoginURL parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            
            NSDictionary *infoDict = data[@"info"];
            NSDictionary * userInfo = infoDict[@"userInfo"];
            

            MY_LYPersonInfoModel * model = [[MY_LYPersonInfoModel alloc] init];
            [model setValuesForKeysWithDictionary:infoDict];
            [model setValuesForKeysWithDictionary:userInfo];
            
//            model.iscreateClub = data[@"info"][@"iscreateClub"];
            model.secretIcon = data[@"info"][@"secretIcon"];
            model.available = [data[@"info"][@"available"] integerValue];
            model.isAuthen = [data[@"info"][@"isAuthen"] integerValue];
            model.isNoble = [data[@"info"][@"isNoble"] integerValue];
            model.inIndex = data[@"info"][@"inIndex"];
            model.pullNum = [data[@"info"][@"pullNum"] integerValue];
//            model.inviteNum = [data[@"info"][@"inviteNum"] integerValue];
            
            [self logPushWithAlias:[NSString stringWithFormat:@"%td", model.userId]];
            
            //  先删后存key
            REMUSERKEY;
            REMUSERID;
            REMVERSION;
        
            NSString * userId = [NSString stringWithFormat:@"%td", model.userId];
            UserSetObject(data[@"info"][@"mobileNum"], @"personMobileNum");
            ADDUSERKEY(data[@"info"][@"key"]);
            ADDUSERID(userId);
            ADDVERSION(data[@"info"][@"iosVersion"]);

         
            [[NSUserDefaults standardUserDefaults] synchronize];

//            [[MY_LLDBManager sharedManager] insertWithModel:model];
            
            NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
            NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
            if (arry.count > 0) {
                [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
            }
            else{
                [[MY_LLDBManager sharedManager] insertWithModel:model];
            }
            
//            [[MessageInfoModel sharedManager]insertModelWith:model];
            
            [self loginHuanXinWithModel:model];
            [[EMClient sharedClient] setApnsNickname:model.nickName];
            //  检查有没有头像 headIcon
            
            NSInteger isGotoVC = 0;
            //  没有编辑过资料
            if (0 == [userInfo[@"isEdit"] integerValue]) {
                isGotoVC = 1;
            }
            //  没有标签
            if (0 == [userInfo[@"isSetTag"] integerValue]) {
                if(1 == isGotoVC){
                    isGotoVC = 3;
                }else{
                    isGotoVC = 2;
                }
            }
            
            // 跳转 标签 和 编辑资料
            if (3 == isGotoVC || 1 == isGotoVC) {
                MY_GLEditMyInfoViewController * vc = [MY_GLEditMyInfoViewController new];
                vc.isEditInfo = isGotoVC;
                [self.navigationController pushViewController:vc animated:YES];
            }else if (2 == isGotoVC){ // 跳转 标签
                CounterMarkViewController * vc = [CounterMarkViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }else{
                if (![Utility isAuditEnvironment]) {//  正式环境
                    if (0 == [data[@"info"][@"available"] integerValue]){
                        //  是否是贵族 如果不是 则跳到 我的
                        mainVC.selectedIndex = 4;
                    }
                }else{
                    //  审核服 不让跳转成为贵族 (强制为贵族 ，只能控制聊天)
//                    MY_LLPersonInfoModel * uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
                    model.available = 1;
//                    [[MessageInfoModel sharedManager] insertModelWith:uModel];
                    model.isNoble = 1;
                    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
               
                    [[MY_LLDBManager sharedManager] updateModel:model withWhere:where];
                }
                [self backClick];
            }

            [JPUSHService setTags:nil alias:[NSString stringWithFormat:@"%@", userId] fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
                
//                NSLog(@"%d", iResCode);
//                NSLog(@"%@", iAlias);
                
            }];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"LoginSuccessHeaderRefreshing" object:nil];
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationFirstComeHome" object:nil];
            
        }
        else{
            
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        [LQProgressHud showMessage:@"登录失败，请检查网络"];
    }];
}


- (void)logPushWithAlias:(NSString *)userId {
    
    [JPUSHService setAlias:userId completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        
    } seq:0];
    
//    [JPUSHService setTags:nil alias:[NSString stringWithFormat:@"%@", userId] fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
//
//        NSLog(@"%d", iResCode);
//
//        NSLog(@"%@", iAlias);
//    }];
}

#pragma mark - 登录环信
- (void)loginHuanXinWithModel:(MY_LYPersonInfoModel *)model {
    
    [[EMClient sharedClient] loginWithUsername:model.hxusername password:model.hxpassword completion:^(NSString *aUsername, EMError *aError) {
        if (!aError) {
            NSLog(@"登陆成功");
             [[EMClient sharedClient].options setIsAutoLogin:YES];
            [TLHTTPRequest MY_getWithBaseUrl:AddWorldChannel parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
                 NSLog(@"加入世界频道成功");
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    //忽略世界频道推送
                    [[EMClient sharedClient].groupManager ignoreGroupPush:WorldChannelID ignore:YES];
                });
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            }];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
            
            [self getPushOptionsWithModel:model];
        } else {
            NSLog(@"登陆环信失败");
            NSLog(@"%@",aError.errorDescription);
        }
    }];
   

}

//  修改推送昵称
- (void)getPushOptionsWithModel:(MY_LYPersonInfoModel *)model {
    BOOL isUpdate = NO;
    
    EMPushOptions *options = [[EMClient sharedClient] pushOptions];
    
    if (EMPushDisplayStyleMessageSummary != options.displayStyle) {
        options.displayStyle = EMPushDisplayStyleMessageSummary;
        isUpdate = YES;
    }
    if (model.nickName)
    {
        options.displayName = model.nickName;
        isUpdate = YES;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = nil;
        if (isUpdate) {
            error = [[EMClient sharedClient] updatePushOptionsToServer];
            
            NSLog(@"%@", error);
        }
    });
}

//  如果3天没成为贵族 不让看App
-(void)gotoBeGuiZuVC{
 
    MY_GLBeGZViewController * gzVC = [[MY_GLBeGZViewController alloc]init];
    [self.navigationController pushViewController:gzVC animated:YES];

}


#pragma mark - 判断字符串中是否含有空格
-(BOOL)isEmpty:(NSString *) str {
    NSRange range = [str rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES; //yes代表包含空格
    }else {
        return NO; //反之
    }
}

#pragma mark - textFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (_textFiledPhone.isFirstResponder) {
        
        [_textFiledPhone resignFirstResponder];
        [_textFiledCode becomeFirstResponder];
    }
    else if (_textFiledCode.isFirstResponder) {
        
        [_textFiledCode resignFirstResponder];
        [_textFiledPhone becomeFirstResponder];
    }
    return YES;
}
- (void)dealloc{
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
