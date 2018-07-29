//
//  MY_GLBeGZViewController.m
//  VTIME
//
//  Created by gll on 2017/11/1.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLBeGZViewController.h"

//  成为贵族
#import "MY_TTLToBeNobilityViewController.h"

//  邀请好友
#import "MY_TTLInviteFriendViewController.h"

#import "MY_LLCustomerServiceViewController.h"

#import "CRWebViewController.h"

//  MY_TTLMeModel
#import "MY_TTLMeModel.h"
#import "MY_LYMessageInfoModel.h"
@interface MY_GLBeGZViewController (){
    
    BOOL _isPresent;
    
}
@property (weak, nonatomic) IBOutlet UILabel *inviteLabel;


@end

@implementation MY_GLBeGZViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSMutableAttributedString* tncString = [[NSMutableAttributedString alloc] initWithString:@"查看详情"];
    
    //设置下划线...
    /*
     NSUnderlineStyleNone                                    = 0x00, 无下划线
     NSUnderlineStyleSingle                                  = 0x01, 单行下划线
     NSUnderlineStyleThick NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02, 粗的下划线
     NSUnderlineStyleDouble NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09, 双下划线
     */
    [tncString addAttribute:NSUnderlineStyleAttributeName
                      value:@(NSUnderlineStyleSingle)
                      range:(NSRange){0,[tncString length]}];
    
    [tncString addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"#FFCC03" alpha:1.0f]  range:NSMakeRange(0,[tncString length])];
    //设置下划线颜色...
    [tncString addAttribute:NSUnderlineColorAttributeName value:[Utility colorWithHexString:@"#FFCC03" alpha:1.0f] range:(NSRange){0,[tncString length]}];
    [self.Godetailbtn setAttributedTitle:tncString forState:UIControlStateNormal];
    
    
//    若成功邀请三个好友入住V时代，即可/n获得一个月的贵族权限
    self.view.backgroundColor = [UIColor blackColor];
    [self addNavBtn:nil isLeft:YES target:self action:@selector(backBtn:) bgImageName:@"editInfo_backButton"];
    
    if (!self.model) {
        self.model =  [[MY_TTLMeModel alloc]init];
        _isPresent = YES;
    }
    
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *userModel = arry.firstObject;
    
//    MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
    self.model.nickName = userModel.nickName;
    self.model.headIcon = userModel.headIcon;

    
    self.inviteFrendlabel.text = [NSString stringWithFormat:@"成功邀请%@个好友入驻MOYO，我们\n将赠送您一个月贵族特权，同时\n你还会获得他们的收益和消费的分成",self.pullNum];
    
    self.inviteDetailLabel.text = [NSString stringWithFormat:@"您已成功邀请%@个好友",self.inviteNum];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //    self.tabBarController.tabBar.hidden = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.translucent = YES;
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.translucent = NO;
}


//  成为贵族
- (IBAction)gotoguizuClick:(UIButton *)sender {
    
    MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//    noVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:noVc animated:YES];
    
}



- (IBAction)connectKeFu:(id)sender {
    MY_LLCustomerServiceViewController* cusVc = [[MY_LLCustomerServiceViewController alloc]initWithConversationChatter:@"kefu1" conversationType:EMConversationTypeChat];
    cusVc.title = @"客服";
//    cusVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cusVc animated:YES];
}

//  邀请好友
- (IBAction)gotoinviteFriendClick:(UIButton *)sender {
    
//    if (self.model.nickName) {
    
        CRWebViewController* inviVc = [[CRWebViewController alloc]init];
//        inviVc.hidesBottomBarWhenPushed = YES;
        inviVc.webURL = [NSString stringWithFormat:@"%@?userId=%@",[Utility getH5Url:@"/VEra/friend_share.html"],USERID];
    
        inviVc.strTitle = @"邀请好友";
        inviVc.stringfrom = @"邀请好友";
        [self.navigationController pushViewController:inviVc animated:YES];
        
//    }else{
//
//        MY_LLPersonInfoModel *userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID:[USERID integerValue]];
//        self.model.nickName = userModel.nickName;
//        self.model.headIcon = userModel.headIcon;
//        MY_TTLInviteFriendViewController* inviVc = [[MY_TTLInviteFriendViewController alloc]init];
//        inviVc.model =  self.model;
//        [self.navigationController pushViewController:inviVc animated:YES];
        
//        NSString * where = [NSString stringWithFormat:@"userId = %@", USERID];
//        [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//            if ([dataArray.firstObject isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                MY_LLPersonInfoModel * personalModel = dataArray.firstObject;
//                dispatch_async(dispatch_get_main_queue(), ^{
//
//                    self.model.nickName = personalModel.nickName;
//                    self.model.headIcon = personalModel.headIcon;
//
//                    MY_TTLInviteFriendViewController* inviVc = [[MY_TTLInviteFriendViewController alloc]init];
//                    inviVc.model =  self.model;
//                    [self.navigationController pushViewController:inviVc animated:YES];
//                });
//            }
//        }];
//    }
}

- (IBAction)backBtn:(UIButton *)sender {
    
    if([self.from isEqualToString:@"login"])
    {
        if (!_isPresent) {
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            
            [LQProgressHud showMessage:@"成为贵族或邀请好友才能进首页"];
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    else
    {
         [self.navigationController popViewControllerAnimated:YES];
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
