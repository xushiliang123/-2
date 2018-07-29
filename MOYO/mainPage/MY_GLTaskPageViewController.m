//
//  MY_GLTaskPageViewController.m
//  VTIME
//
//  Created by gll on 2017/12/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLTaskPageViewController.h"

#import "MY_LYActivityViewController.h"
#import "MY_LYCreateAnActivityViewController.h"
#import "GuideTitleView.h"//  导航标题
#import "MY_TTLToBeNobilityViewController.h"
#import "MY_TTLUpHomePageViewController.h"
#import "CRWebViewController.h"
//  弹框提示
#import "PublishTaskTipView.h"


//垃圾袋
#import "MY_LYCustomerLable.h"
#import "MY_LYCustomerButton.h"
#import "MY_LYEvaluationCell.h"
#import "MY_LYHeadIconCell.h"
#import "XCRatingBar.h"



@interface MY_GLTaskPageViewController ()<GuideTitleViewDelegate,UIPageViewControllerDataSource,UIPageViewControllerDelegate>
@property (strong, nonatomic) UIPageViewController  * pageViewController;
@property (strong, nonatomic) NSArray               * viewControllers;
@property (nonatomic, strong) MY_LYPersonInfoModel * personalModel;
@property (strong, nonatomic) GuideTitleView        * guideTitleView;
@property (strong, nonatomic) MY_TTLNewPwopleGuideModel        * peopleModel;

@end

@implementation MY_GLTaskPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    _personalModel = arry.firstObject;
//    _personalModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    
    [self uiConfig];
    if ([Utility isAuditEnvironment] == NO) {   //非审核创建按钮
#warning 新手指导
        [self addNewPwopleComeView];
    }
    [self  addLaJiDaiMa];
}
- (void)addLaJiDaiMa{
    MY_LYCustomerLable *culbl =  [[MY_LYCustomerLable alloc]init];
    MY_LYHeadIconCell *icCell = [[MY_LYHeadIconCell alloc]init];
    MY_LYCustomerButton *cuBtn = [[MY_LYCustomerButton alloc]init];
    MY_LYEvaluationCell *evCell = [[MY_LYEvaluationCell alloc]init];
    
}
#pragma mark - UI相关
- (void)uiConfig{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addNavBtn:@"发起" isLeft:NO target:self action:@selector(rightChooseClick) bgImageName:nil];

    //    CGFloat origin_x = SCREEN_WIDTH/2 - (SCREEN_WIDTH/2)/2;
    CGFloat origin_y = 20;
    
    //    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(origin_x, origin_y, SCREEN_WIDTH/2, origin_y*2)];
    
    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(70, origin_y, SCREEN_WIDTH * 0.4, origin_y*2)];
    
    [_guideTitleView setGuideWithTitle:@[@"任务", @"我的"]];// 注意此处空格不删
    _guideTitleView.guideDelegate = self;
    self.navigationItem.titleView = _guideTitleView;
    
    if (self.pageViewController) {
        [self.view addSubview:self.pageViewController.view];
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
    if (!_peopleModel.firstRenwuFaqi && _personalModel.sex == 1) {
//        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
//        CGRect rect=[_HongBaoBtn convertRect: _HongBaoBtn.bounds toView:window];
        CGRect rect = CGRectMake(SCREEN_WIDTH - 58, StatusHeight - 2, 50, 50);
        CGRect imgRect = CGRectMake(SCREEN_WIDTH - ScaleWidth(58) - 58, rect.origin.y+50, ScaleWidth(58), ScaleWidth(46));
        MY_TTLNewPeopleGuideView *guideView = [[MY_TTLNewPeopleGuideView alloc] initWithButtonFrame:rect buttonImgName:nil imgFrame:imgRect guideImgName:@"发布任务指示箭头" promptString:@"点此发布任务" corneRadius:rect.size.height/2 Alpha:0.8];
//        __weak typeof(self) weakSelf = self;
        [guideView show];
        _peopleModel.firstRenwuFaqi = YES;
        NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:_peopleModel];
        ADDNewPeopleFirstCome(peopleData);
    }else if (!_peopleModel.firstRenwuFaqi) {
        _peopleModel.firstRenwuFaqi = YES;
        NSData *peopleData = [NSKeyedArchiver archivedDataWithRootObject:_peopleModel];
        ADDNewPeopleFirstCome(peopleData);
    }
}
    //发起任务
-(void)rightChooseClick{
    
//    TaskIdentity
//    [LQProgressHud showLoading:nil];
    [TLHTTPRequest MY_postWithBaseUrl:TaskIdentity parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {

//        [LQProgressHud hide];

        if ([[data objectForKey:@"ret"] boolValue] == 0) {
            //  表示有未完成的任务
            if (1 == [[data[@"info"] objectForKey:@"unfinishedTask"] integerValue]) {
                
                [LQProgressHud showMessage:@"您还有未完成的任务"];
                return;
            }else{
                //  如果 只有上首页的 或 贵族才能发起活动
                if (0 < [[data[@"info"] objectForKey:@"isIndex"] integerValue] || 0 < [[data[@"info"] objectForKey:@"nobleLevel"] integerValue]) {

                    MY_LYCreateAnActivityViewController * vc = [MY_LYCreateAnActivityViewController new];
                    [self.navigationController pushViewController:vc animated:YES];

                }else{
                
                    ALERT_SHOW(nil, @"很抱歉，只有贵族才能发起活动", self, @"再想想", @"成为贵族");
                    
//                    PublishTaskTipView * taskTip = [[NSBundle mainBundle] loadNibNamed:@"PublishTaskTipView" owner:nil options:nil].lastObject;
//                    UIWindow * mWindow = [UIApplication sharedApplication].keyWindow;
//                    [mWindow addSubview:taskTip];
//                    taskTip.goToVCBlock = ^(NSInteger index,PublishTaskTipView * tipView) {
//
//                        [UIView animateWithDuration:0.2 animations:^{
//
//                            tipView.alpha = 0.0;
//
//                        } completion:^(BOOL finished) {
//
//                            [tipView removeFromSuperview];
//
//                        }];
//
//                        // 1:成为贵族 2:上首页 3:邀请好友
//                        if (1 == index) {
//
//                            MY_TTLToBeNobilityViewController * gzVC = [[MY_TTLToBeNobilityViewController alloc]init];
//                            [self.navigationController pushViewController:gzVC animated:YES];
//
//                        }else if (2 == index){
//
//                            MY_TTLUpHomePageViewController * gzVC = [[MY_TTLUpHomePageViewController alloc]init];
//                            [self.navigationController pushViewController:gzVC animated:YES];
//
//                        }else{
//
//                            CRWebViewController* inviVc = [[CRWebViewController alloc]init];
////                            inviVc.hidesBottomBarWhenPushed = YES;
//                            inviVc.webURL = [NSString stringWithFormat:@"%@?userId=%@",[Utility getH5Url:@"/VEra/friend_share.html"],userID]
//                            inviVc.strTitle = @"邀请好友";
//                            inviVc.stringfrom = @"邀请好友";
//                            [self.navigationController pushViewController:inviVc animated:YES];
//                        }
//
//                    };
//
//                    [taskTip mas_makeConstraints:^(MASConstraintMaker *make) {
//
////                        make.center.mas_equalTo(mWindow.center);
//                        make.centerX.equalTo(mWindow.mas_centerX);
//                        make.centerY.equalTo(mWindow.mas_centerY);
//
//                        make.width.mas_equalTo(SCREEN_WIDTH);
//                        make.height.mas_equalTo(SCREEN_HEIGHT);
//
//                    }];
                }
            }
            
        } else{
            
            if ([data objectForKey:@"msg"]) {
                [LQProgressHud showMessage:[data objectForKey:@"msg"]];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        [LQProgressHud showMessage:@"请求失败,请检查网络"];
    }];
    
   
}


#pragma mark - - alertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // 终止任务
    if([alertView.message isEqualToString:@"很抱歉，只有贵族才能发起活动"]){

        if (1 == buttonIndex) {
            
            MY_TTLToBeNobilityViewController * gzVC = [[MY_TTLToBeNobilityViewController alloc]init];
            [self.navigationController pushViewController:gzVC animated:YES];
        }
        
    }
    
}



    
-(UIPageViewController*)pageViewController{
    if (!_pageViewController) {
        MY_LYActivityViewController * actVc    = [[MY_LYActivityViewController alloc]init];
        MY_LYActivityViewController * myVC   = [[MY_LYActivityViewController alloc]init];

        [actVc.selecteDictionary setObject:@(1) forKey:@"type"];
        [myVC.selecteDictionary setObject:@(2) forKey:@"type"];
        
        actVc.controllerView = self;
        myVC.controllerView = self;
        
        _viewControllers = @[actVc, myVC];
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.dataSource  = self;
        _pageViewController.delegate    = self;
        [_pageViewController setViewControllers:@[_viewControllers[0]] direction:0 animated:NO completion:nil];
        _pageViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _pageViewController;
}
    
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
    
}
    
#pragma mark ++ 点击导航标题delegate
-(void)guideTitleView:(GuideTitleView *)guideView SelectedIndex:(NSInteger)currentIndex{
    
    if (currentIndex < guideView.currentSelectedIndex - defaultSelectInteger) {
        [_pageViewController setViewControllers:@[_viewControllers[currentIndex]]
                                      direction:1 animated:YES completion:nil];
        
    }
    else if (currentIndex > guideView.currentSelectedIndex - defaultSelectInteger){
        [_pageViewController setViewControllers:@[_viewControllers[currentIndex]]
                                      direction:0 animated:YES completion:nil];
        
    }
    else return;
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
