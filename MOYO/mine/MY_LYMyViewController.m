//
//  MyViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_LYMyViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetRepresentation.h>


#import "MyTableViewCell.h"
#import "MY_TTLSkillCenterTableViewCell.h"
#import "MY_TTLMyHeaderTableViewCell.h"
#import "MY_TTLStealthSettingViewController.h"

#import "ZFPlayer.h"

#import "MY_TTLInviteFriendViewController.h"       //邀请好友
#import "MY_TTLChangeMoneyViewController.h"        //我的账户
#import "MY_TTLBodyInformationViewController.h"    //加V认证
#import "MY_TTLToBeNobilityViewController.h"       //成为贵族
#import "MY_TTLUpHomePageViewController.h"         //上首页
#import "MY_TTLVideoIDentViewController.h"         //视频认证
#import "VTimeWKWebViewController.h"            //公用web页面，我的Vip
#import "MY_TTLEditInfoViewController.h"           //编辑资料
#import "MY_TTLMySetViewController.h"              //设置
#import "MY_TTLPacketsRecordViewController.h"      //红包记录
#import "MY_TTLMyDynamicViewController.h"          //我的动态
#import "MY_LLCustomerServiceViewController.h"     //客服
#import "MY_TTLSelfCenterViewController.h"         //个人中心
#import "RechargeViewController.h"              //充值
#import "MY_LLCreateClubsViewController.h"         //创建俱乐部
#import "MY_GLClubListViewController.h"            //跳转俱乐部列表
#import "CRWebViewController.h"                 //邀请好友
#import "MY_TTLPlayViewController.h"               //玩法攻略
#import "MY_GLMainTopicTableViewCell.h"            //主标题Cell

#import "MY_LYMessageInfoModel.h"
#import "MY_TTLMeModel.h"
@interface MY_LYMyViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    
    BOOL _isShowBadgeView;
    NSIndexPath * _playIndexPath;
    NSIndexPath * _friendIndexPath;
    NSIndexPath * _guizuIndexPath;
    NSDate * _lastDate;
    
}
@property (nonatomic, strong) UIImageView * topImageView;
@property (nonatomic, strong) UITableView *myTableView;
@property (strong, nonatomic) NSArray* arrayIcon;
@property (strong, nonatomic) NSArray* arrayTitle;
@property (strong, nonatomic) NSMutableArray* arrayPage;//图片数组
@property (strong, nonatomic)AVCaptureMovieFileOutput * output;//视频

@property (strong, nonatomic) MY_TTLMeModel* model;
@property (strong, nonatomic) MY_TTLNewPwopleGuideModel * peopleModel;
@property (strong, nonatomic) MY_LYPersonInfoModel * uModel;

@end

@implementation MY_LYMyViewController



- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.translucent = NO;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.translucent = YES;
    
    [TLHTTPRequest MY_getWithBaseUrl:UserInfoMineUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] boolValue] == 0) {

            self.model = [[MY_TTLMeModel alloc] init];
            NSDictionary *userDict = [data objectForKey:@"info"];
            [self.model setValuesForKeysWithDictionary:[userDict objectForKey:@"user"]];
            
            if([[NSString stringWithFormat:@"%@",self.model.isCreateClub] integerValue] == 1)
             {
//                 self.arrayTitle = @[@[@"",@"我的账户",@""],@[@"上首页",@"红包记录",@"我的俱乐部",@"邀请好友",@"加V认证",@"成为贵族",@"我的VIP",@"我的动态",@"客服中心",@"设置"]];
                 
                 if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
                     self.arrayIcon = @[@[@"",@"",@"pagemoney",@""],@[@"redRecord",@"creatClub",@"v",@"myvip",@"mydymic",@"kefu",@"myset"]];
                     
                     self.arrayTitle = @[@[@"",@"",@"我的账户",@""],@[@"红包记录",@"我的俱乐部",@"加V认证",@"我的VIP",@"我的动态",@"客服中心",@"设置"]];

                 }else{
                     self.arrayIcon = @[@[@"",@"",@"pagemoney",@""],@[@"redRecord",@"creatClub",@"v",@"myvip",@"mydymic",@"kefu",@"myset"]];
                     
                     self.arrayTitle = @[@[@"",@"",@"我的账户",@""],@[@"红包记录",@"我的俱乐部",@"加V认证",@"我的VIP",@"我的动态",@"客服中心",@"设置"]];
                 }
             }else{
                 
                 if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
                     self.arrayIcon = @[@[@"",@"",@"pagemoney",@""],@[@"redRecord",@"creatClub",@"v",@"myvip",@"mydymic",@"kefu",@"myset"]];
                     
                     self.arrayTitle = @[@[@"",@"",@"我的账户",@""],@[@"红包记录",@"创建俱乐部",@"加V认证",@"我的VIP",@"我的动态",@"客服中心",@"设置"]];
                     //#warning 新手指导
                     //        [self addNewPwopleComeView];
                 }else{
                     self.arrayIcon = @[@[@"",@"",@"pagemoney",@""],@[@"redRecord",@"creatClub",@"v",@"myvip",@"mydymic",@"kefu",@"myset"]];
                     
                     self.arrayTitle = @[@[@"",@"",@"我的账户",@""],@[@"红包记录",@"创建俱乐部",@"加V认证",@"我的VIP",@"我的动态",@"客服中心",@"设置"]];
                 }
                 
             }
            
            [self.myTableView reloadData];
            
//            NSString *where = [NSString stringWithFormat:@"userId = %td", [USERID integerValue]];
//            [[MY_LLDBManager sharedManager] selectClass:[MY_LLPersonInfoModel class] withWhere:where responseBlock:^(NSArray *dataArray) {
//
//                for (BaseModel * model in dataArray) {
//                    if ([model isKindOfClass:[MY_LLPersonInfoModel class]]) {
//                        MY_LLPersonInfoModel * userModel = (MY_LLPersonInfoModel *)model;
//                        if (userModel.userId == [USERID integerValue]) {
//                            userModel.headIcon = self.model.headIcon;
//                            [[MY_LLDBManager sharedManager] updateModel:userModel withWhere:where];
//                        }
//                    }
//                }
//            }];
            
            [_uModel setValuesForKeysWithDictionary:[userDict objectForKey:@"user"]];
            NSDictionary *infoDict = [data objectForKey:@"info"];
            if (_uModel.nobleLevel>0) {
                _uModel.isNoble = 1;
            }
//            NSLog(@"MyViewPage:longitude-- %@  latitude-- %@",[infoDict[@"longitude"] stringValue], [infoDict[@"latitude"] stringValue]);
     
            NSString * where = [NSString stringWithFormat:@"userId = %td",_uModel.userId];
            [[MY_LLDBManager sharedManager] updateModel:_uModel withWhere:where];
//            [[MessageInfoModel sharedManager] insertModelWith:_uModel];
        }else {
            
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"cuowu");
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //让rootView禁止滑动
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
//    }else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    
    _isShowBadgeView = NO;
//    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
//    [self.view addSubview:view];
    _arrayPage = [[NSMutableArray alloc]init];
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    _uModel = arry.firstObject;
    
//    _uModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    //  设置UI
    if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
        self.arrayIcon = @[@[@"",@"",@"pagemoney",@""],@[@"redRecord",@"creatClub",@"v",@"myvip",@"mydymic",@"kefu",@"myset"]];
        
        self.arrayTitle = @[@[@"",@"",@"我的账户",@""],@[@"红包记录",@"创建俱乐部",@"加V认证",@"我的VIP",@"我的动态",@"客服中心",@"设置"]];
        //#warning 新手指导
        //        [self addNewPwopleComeView];
    }else{
        self.arrayIcon = @[@[@"",@"",@"pagemoney",@""],@[@"redRecord",@"creatClub",@"v",@"myvip",@"mydymic",@"kefu",@"myset"]];
        
        self.arrayTitle = @[@[@"",@"",@"我的账户",@""],@[@"红包记录",@"创建俱乐部",@"加V认证",@"我的VIP",@"我的动态",@"客服中心",@"设置"]];
    }
    [self createUI];
}

//添加新手引导
- (void)addNewPwopleComeView{
    //    NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:NewPeople];
    //在这里解档;
    _peopleModel = [NSKeyedUnarchiver unarchiveObjectWithData:NewPeopleFirstCome];

    if (!_peopleModel) {
        _peopleModel = [[MY_TTLNewPwopleGuideModel alloc] init];
    }
    if (!_peopleModel.firstSetPlay) {
        CGRect rect = CGRectMake(0, 347, SCREEN_WIDTH, 50);
        CGRect imgRect = CGRectMake((SCREEN_WIDTH - ScaleWidth(10))/2, 347 - ScaleWidth(72) - 10, ScaleWidth(10), ScaleWidth(72));
        MY_TTLNewPeopleGuideView *guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rect buttonImgName:nil imgFrame:imgRect guideImgName:@"个人主页指示箭头" promptString:@"查看MOYO完整攻略" corneRadius:0 Alpha:0.8];
        __weak typeof(self) weakSelf = self;
        guideView.actionBlock = ^{
            [weakSelf addNewPwopleComeTwoView];
        };
        [guideView show];
    }
}
- (void)addNewPwopleComeTwoView{
    CGRect rectInTableView = [self.myTableView rectForRowAtIndexPath:_friendIndexPath];//获取cell在tableView中的位置
    CGRect imgRect = CGRectMake((SCREEN_WIDTH - ScaleWidth(10))/2, rectInTableView.origin.y - ScaleWidth(72) - 10, ScaleWidth(10), ScaleWidth(72));
    NSString *promptstr;
    if (_uModel.sex == 0) {
        promptstr = @"点击上首页让土豪哥哥关注你哦";
    }else if (_uModel.sex == 1){
        promptstr = @"邀请好友 赚现金";
    }
    MY_TTLNewPeopleGuideView *guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rectInTableView buttonImgName:nil imgFrame:imgRect guideImgName:@"个人主页指示箭头" promptString:promptstr corneRadius:0 Alpha:0.8];
    __weak typeof(self) weakSelf = self;
    guideView.actionBlock = ^{
        if ([Utility isAuditEnvironment] == NO) { //非审核创建按钮
            [weakSelf addNewPwopleComeThreeView];
        }
    };
    [guideView show];
}
- (void)addNewPwopleComeThreeView{
    CGRect rectInTableView = [self.myTableView rectForRowAtIndexPath:_guizuIndexPath];//获取cell在tableView中的位置
    CGRect imgRect = CGRectMake((SCREEN_WIDTH - ScaleWidth(10))/2, rectInTableView.origin.y - ScaleWidth(72) - 10, ScaleWidth(10), ScaleWidth(72));
    NSString *promptstr;
    if (_uModel.sex == 0) {
        promptstr = @"邀请好友 赚现金";
    }else if (_uModel.sex == 1){
        promptstr = @"成为贵族，享受N多特权，畅游MOYO";
    }
    MY_TTLNewPeopleGuideView *guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rectInTableView buttonImgName:nil imgFrame:imgRect guideImgName:@"个人主页指示箭头" promptString:promptstr corneRadius:0 Alpha:0.8];
    [guideView show];
    _peopleModel.firstSetPlay = YES;
    NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:_peopleModel];
    ADDNewPeopleFirstCome(peopleData);
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - UI相关
- (void)createUI{
    
    [self addNavBtn:nil isLeft:NO target:self action:@selector(editInfoClick) bgImageName:@"editInfo"];
    _lastDate = [NSDate date];

    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, - StatusHeight - 44, SCREEN_WIDTH, SCREEN_HEIGHT -  TabbarHeight + StatusHeight + 44) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    self.myTableView.bounces = NO;
    self.myTableView.tableFooterView = [UIView new];
    self.myTableView.backgroundColor =  [Utility colorWithHexString:@"f8f8f8" alpha:1];
    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    
//    self.myTableView.estimatedSectionFooterHeight = 0.0;
//    self.myTableView.estimatedSectionHeaderHeight = 0.0;
    
//    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
//
//    if ([phoneVersion integerValue] >= 11) {
//        self.myTableView.contentOffset = CGPointMake(0, -64);// -64
//        self.myTableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);//-64
//
//    }else{
////        self.myTableView.frame = CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT + 64);
//         self.automaticallyAdjustsScrollViewInsets = NO;
////        self.myTableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
////        self.myTableView.contentOffset = CGPointMake(0, -64);
//    }
//
//    if (SCREEN_HEIGHT > 800) {
//        self.myTableView.contentOffset = CGPointMake(0, -(NavigationHeight + StatusHeight));// -64
//        self.myTableView.contentInset = UIEdgeInsetsMake(-(NavigationHeight + StatusHeight), 0, 0, 0);//-64
//
//        CGRect rect = self.myTableView.frame;
//        rect.size.height = ScreenHeight - TabbarHeight ;//+ StatusHeight
//        self.myTableView.frame = rect;
//    }
//
//    if (@available(iOS 11.0, *)) {
//        self.myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
//    }else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
//
//    [self.myTableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
}


#pragma mark - 代理相关
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        if (indexPath.row == 0) {
            return 232;
        }
        else if (indexPath.row == 1)
        {
            return ScaleWidth(94.0);
        }else if(indexPath.row == 2){
            return 50;
        }
        else{
            return 65;
        }
    }
    else
        return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *ary = self.arrayTitle[section];
    return ary.count;
//    if (section == 0) {
//        return 3;
//    }
//    else{
//        if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
//            return 11;
//
//        }else{
//            return 10;
//        }
//    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
//    return section == 1 ? 0 : 10;
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return 0;
//}


-(UIScrollView *)findScrollView{
    UIScrollView*scrollView;
    for(id subview in self.view.subviews){
        if([subview isKindOfClass:UIScrollView.class]){
            scrollView=subview;
            break;
        }
    }
    return scrollView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            static NSString *cellID = @"MY_TTLMyHeaderTableViewCell";
            MY_TTLMyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil] lastObject];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(secretchange:)];
                [cell.secretLabel addGestureRecognizer:tap];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell showData:self.model];
            [cell.videoBtn addTarget:self action:@selector(videoClick) forControlEvents:UIControlEventTouchUpInside];
            [cell.selfIngoBtn addTarget:self action:@selector(selfIngoClick) forControlEvents:UIControlEventTouchUpInside];
            cell.secretLabel.userInteractionEnabled = YES;
            
            return cell;
            //  上首页 、 邀请好友、赚现金、成为贵族 一栏
        }else if(indexPath.row == 1){
            
            static NSString *MY_TTLSkillCenterTableViewCellID = @"MY_GLMainTopicTableViewCell";
            MY_GLMainTopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MY_TTLSkillCenterTableViewCellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_GLMainTopicTableViewCell" owner:self options:nil] lastObject];
            }
            NSArray * ary = @[@"上首页",@"邀请好友",@"成为贵族",@"玩法攻略"];
#warning Andrew
//            if ([Utility isAuditEnvironment]) {
//                 ary = @[@"上首页",@"玩法攻略"];
//            }
            [cell setUIWithArray:ary];
            
            cell.buttonClick = ^(NSInteger index) {
              
                switch (index) {
                    case 0:
                        {
                            MY_TTLUpHomePageViewController* homeVc = [[MY_TTLUpHomePageViewController alloc]init];
//                            homeVc.hidesBottomBarWhenPushed = YES;
                            [self.navigationController pushViewController:homeVc animated:YES];
                            //                                [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"invite"];
                            break;
                        }
                    case 1:
                    {
                        if ([Utility isAuditEnvironment]) {
//                            ary = @[@"上首页",@"玩法攻略"];
                            MY_TTLPlayViewController* playVc = [[MY_TTLPlayViewController alloc]init];
//                            playVc.hidesBottomBarWhenPushed = YES;
                            playVc.webURL =  [Utility getH5Url:PlayGameURL];
                            playVc.strTitle = @"玩法攻略";
                            [self.navigationController pushViewController:playVc animated:YES];
                            
                        }else{
                            
                            CRWebViewController* inviVc = [[CRWebViewController alloc]init];
//                            inviVc.hidesBottomBarWhenPushed = YES;
                            inviVc.webURL =  [Utility getH5Url:InvitedFriendsURL(USERID)];
                            inviVc.strTitle = @"邀请好友";
                            inviVc.stringfrom = @"邀请好友";
                            [self.navigationController pushViewController:inviVc animated:YES];
                        }
                        
                        break;
                    }case 2:
                    {
                        //  成为贵族
                        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"toben"];
                        MY_TTLToBeNobilityViewController* noVc = [[MY_TTLToBeNobilityViewController alloc]init];
//                        noVc.hidesBottomBarWhenPushed = YES;
                        [self.navigationController pushViewController:noVc animated:YES];
                        break;
                    }case 3:
                    {
                        MY_TTLPlayViewController* playVc = [[MY_TTLPlayViewController alloc]init];
//                        playVc.hidesBottomBarWhenPushed = YES;
                        playVc.webURL =  [Utility getH5Url:PlayGameURL];
                        playVc.strTitle = @"玩法攻略";
                        [self.navigationController pushViewController:playVc animated:YES];
                        
                        break;
                    }
                        
                    default:
                        break;
                }
            };
            
            return cell;
            //  充值约、收益、一栏
        }else if (indexPath.row == 2)
        {
            static NSString *MyTableViewCellID = @"MyTableViewCell";
            MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:self options:nil] lastObject];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.rightBedgeView.hidden = YES;
            cell.iconImv.image = [UIImage imageNamed:self.arrayIcon[indexPath.section][indexPath.row]];
            cell.titleLabel.text = self.arrayTitle[indexPath.section][indexPath.row];
            cell.titleLabel.font = [UIFont systemFontOfSize:14];
            cell.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
            cell.detaileLabel.text = @"";
            cell.detaileLabel.hidden = YES;
            
            return cell;
        }
        //  我的账户
        else{
            static NSString *MY_TTLSkillCenterTableViewCellID = @"MY_TTLSkillCenterTableViewCell";
            MY_TTLSkillCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MY_TTLSkillCenterTableViewCellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle]loadNibNamed:@"MY_TTLSkillCenterTableViewCell" owner:self options:nil] lastObject];
                cell.leftTitle.userInteractionEnabled = YES;
                cell.rightView.userInteractionEnabled = YES;
                UITapGestureRecognizer* leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftSingleTap:)];
                [cell.leftTitle addGestureRecognizer:leftTap];
                UITapGestureRecognizer* rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightSingleTap:)];
                [cell.rightView addGestureRecognizer:rightTap];
            }
            
            [cell showDetail:self.model];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }
    }
    else{
        static NSString *MyTableViewCellID = @"MyTableViewCell11";
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTableViewCell" owner:self options:nil] lastObject];
        }
        NSString *imgString = self.arrayIcon[indexPath.section][indexPath.row];
        cell.iconImv.image = [UIImage imageNamed:imgString];
        cell.titleLabel.text = self.arrayTitle[indexPath.section][indexPath.row];
        cell.titleLabel.font = [UIFont systemFontOfSize:14];
//        cell.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
        if (_uModel.sex == 1) {
            if ([imgString isEqualToString:@"playModle"]) {
                _playIndexPath = indexPath;
            }else if ([imgString isEqualToString:@"inviteFriend"]) {
                _friendIndexPath = indexPath;
            }else if ([imgString isEqualToString:@"guizu"]) {
                _guizuIndexPath = indexPath;
            }
        }else if(_uModel.sex == 0){
            if ([imgString isEqualToString:@"playModle"]) {
                _playIndexPath = indexPath;
            }else if ([imgString isEqualToString:@"upHome"]) {
                _friendIndexPath = indexPath;
            }else if ([imgString isEqualToString:@"inviteFriend"]) {
                _guizuIndexPath = indexPath;
            }
        }
        
        
        cell.detaileLabel.text = @"";
        cell.detaileLabel.hidden = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.rightBedgeView.hidden = YES;
//        if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
////            if (indexPath.row<4) {
////                cell.titleLabel.textColor = GOLDCOLOR;
////            }else{
//            cell.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
////            }
//            if(indexPath.row == 3)
//            {
//                if (![[NSUserDefaults standardUserDefaults] valueForKey:@"toben"])
//                {
//                    [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"toben"];
//                    cell.rightBedgeView.hidden = NO;
//                }
//                else
//                {
//                    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"toben"] isEqualToString:@"YES"])
//                    {
//                        cell.rightBedgeView.hidden = YES;
//                    }
//                    else
//                    {
//                        cell.rightBedgeView.hidden = NO;
//                    }
//                }
//            }
//        }else{
//            if (indexPath.row<3) {
//                cell.titleLabel.textColor = GOLDCOLOR;
//            }else{
//                cell.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
//            }
//        }
//        if(indexPath.row == 2)
//        {
//
//            if (![[NSUserDefaults standardUserDefaults] valueForKey:@"invite"])
//            {
//                [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"invite"];
//                cell.rightBedgeView.hidden = NO;
//            }
//            else
//            {
//                if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"invite"] isEqualToString:@"YES"])
//                {
//                    cell.rightBedgeView.hidden = YES;
//                }
//                else
//                {
//                    cell.rightBedgeView.hidden = NO;
//                }
//            }
//        }
        
        
        
        return cell;
    }
}

//  视频认证
-(void)videoClick
{    
    MY_TTLVideoIDentViewController* viVc = [[MY_TTLVideoIDentViewController alloc]init];
//    viVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viVc animated:YES];
}

//  编辑资料
-(void)editInfoClick
{
//    NSTimeInterval interval = [_lastDate timeIntervalSinceDate:[NSDate date]];
//    if (   interval > 1) {
//
//        _lastDate = [NSDate date];
//        MY_TTLEditInfoViewController* editVc = [[MY_TTLEditInfoViewController alloc]init];
//        editVc.model = self.model;
//        editVc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:editVc animated:YES];
//    }
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 截止时间字符串格式
    NSString *expireDateStr = [dateFomatter stringFromDate:_lastDate];
    // 当前时间字符串格式
    NSString *nowDateStr = [dateFomatter stringFromDate:nowDate];
    // 截止时间data格式
    NSDate *expireDate = [dateFomatter dateFromString:expireDateStr];
    // 当前时间data格式
    nowDate = [dateFomatter dateFromString:nowDateStr];
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:expireDate toDate:nowDate options:0];
    
    //  时间差 大于1  跳转
    if ( 1 < fabsf(dateCom.second)) {
        
        _lastDate = [NSDate date];
        
        MY_TTLEditInfoViewController* editVc = [[MY_TTLEditInfoViewController alloc]init];
        editVc.model = self.model;
//        editVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:editVc animated:YES];
    }

    
    
    
    
}

//  个人中心
-(void)selfIngoClick
{
    MY_TTLSelfCenterViewController* infoVc = [[MY_TTLSelfCenterViewController alloc]init];
//    infoVc.hidesBottomBarWhenPushed = YES;
    infoVc.userID = USERID;
    [self.navigationController pushViewController:infoVc animated:YES];
}

-(void)leftSingleTap:(UITapGestureRecognizer *)sender
{
    RechargeViewController* chargeVc = [[RechargeViewController alloc]init];
//    chargeVc.hidesBottomBarWhenPushed = YES;
    chargeVc.balanceString = [NSString stringWithFormat:@"%@",self.model.money];
    [self.navigationController pushViewController:chargeVc animated:YES];
}

-(void)rightSingleTap:(UITapGestureRecognizer *)sender
{
    MY_TTLChangeMoneyViewController* changeVc = [[MY_TTLChangeMoneyViewController alloc]init];
//    changeVc.hidesBottomBarWhenPushed = YES;
    changeVc.model = self.model;
    [self.navigationController pushViewController:changeVc animated:YES];
    //    CGPoint point = [sender locationInView:self.view];
    //
    //    NSLog(@"handleSingleTap!pointx:%f,y:%f",point.x,point.y);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//      @[@"红包记录",@"我的俱乐部",@"加V认证",@"我的VIP",@"我的动态",@"客服中心",@"设置"]];

    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            MY_TTLChangeMoneyViewController* changeVc = [[MY_TTLChangeMoneyViewController alloc]init];
//            changeVc.hidesBottomBarWhenPushed = YES;
            changeVc.model = self.model;
            [self.navigationController pushViewController:changeVc animated:YES];
        }
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //  红包记录
            MY_TTLPacketsRecordViewController* pacVc = [[MY_TTLPacketsRecordViewController alloc]init];
//            pacVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:pacVc animated:YES];
            
        }else if (indexPath.row == 1) {
            //  我的俱乐部
            if([[NSString stringWithFormat:@"%@",self.model.isCreateClub] integerValue] == 1)
            {
                MY_GLClubListViewController * clubListVC = [[MY_GLClubListViewController alloc]init];
                [self.navigationController pushViewController:clubListVC animated:YES];
            }
            else
            {
                MY_LLCreateClubsViewController* inviVc = [[MY_LLCreateClubsViewController alloc]init];
//                inviVc.hidesBottomBarWhenPushed = YES;
                //            inviVc.model = self.model;
                [self.navigationController pushViewController:inviVc animated:YES];
                
            }
        }else if (indexPath.row == 2){
            //  加 V 认证
            [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"invite"];
            
            MY_TTLBodyInformationViewController* atVc = [[MY_TTLBodyInformationViewController alloc]init];
//            atVc.hidesBottomBarWhenPushed = YES;
            atVc.model = self.model;
            [self.navigationController pushViewController:atVc animated:YES];
            
        }else if (indexPath.row == 3){
            //  我的VIP
            VTimeWKWebViewController* webVc = [[VTimeWKWebViewController alloc]init];
//            webVc.hidesBottomBarWhenPushed = YES;
            webVc.strTitle = @"我的VIP";
            
            webVc.webURL = [NSString stringWithFormat:@"%@?userId=%@",[Utility getH5Url:@"/VEra/mylevel.html"],USERID];
            [self.navigationController pushViewController:webVc animated:YES];
            
            }else if (indexPath.row == 4){
                //  我的动态
                MY_TTLMyDynamicViewController* dyVc = [[MY_TTLMyDynamicViewController alloc]init];
//                dyVc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:dyVc animated:YES];
                
            }else if (indexPath.row == 5) {
                //  客服中心
                MY_LLCustomerServiceViewController* cusVc = [[MY_LLCustomerServiceViewController alloc]initWithConversationChatter:@"kefu1" conversationType:EMConversationTypeChat];
                cusVc.title = @"客服";
//                cusVc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:cusVc animated:YES];
                
            }else if (indexPath.row == 6 ){
                //  设置
                MY_TTLMySetViewController* setVc = [[MY_TTLMySetViewController alloc]init];
//                setVc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:setVc animated:YES];
                
            }
        }
}


-(void)skillCenterClick:(UIButton *)btn
{
    
}

-(void)secretchange:(id)sender{
    MY_TTLStealthSettingViewController* setVc = [[MY_TTLStealthSettingViewController alloc]init];
    [self.navigationController pushViewController:setVc animated:YES];
}

- (NSMutableArray *)dynamicArray
{
    if (!_dynamicArray) {
        _dynamicArray = [[NSMutableArray alloc]init];
    }
    return _dynamicArray;
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
