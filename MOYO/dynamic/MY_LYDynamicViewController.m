//
//  FindViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/15.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_LYDynamicViewController.h"

#import "EssenceViewController.h"
#import "NearViewController.h"
#import "AttentionViewController.h"
#import "MY_TTLDynamicIssueViewController.h"

#import "GuideTitleView.h"//导航标题
#import "HeadReadNewView.h"                 //  未读动态相关提示
#import "MyInfomationViewController.h"


@interface MY_LYDynamicViewController ()<GuideTitleViewDelegate,UIPageViewControllerDataSource,UIPageViewControllerDelegate>
{
    HeadReadNewView * _headReadView;
    NSInteger _readNewCount;
    BOOL _isShowBadgeView;
    
}
@property (strong, nonatomic) UIPageViewController  * pageViewController;
@property (strong, nonatomic) NSArray               * viewControllers;
@property (strong, nonatomic) GuideTitleView        * guideTitleView;
@property (nonatomic, strong) NSDictionary          * dyamicDict;
@property (nonatomic, strong) NSMutableArray        * isShowBadgeAry;

@end

@implementation MY_LYDynamicViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
        
        [defaultCenter addObserver:self selector:@selector(hiddenRedBadgeView:) name:@"hiddenRedBadgeView" object:nil];
        
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FindRefreshData" object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //  设置UI
    [self createReadNewView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshDynamic) name:KRefresDynamicNotification object:nil];
    [self createUI];
    
    [self.isShowBadgeAry addObjectsFromArray:@[@(0),@(0)]];
}
- (void)refreshDynamic{

    [_guideTitleView changeCurrentSelectedIndex:defaultSelectInteger];
    _guideTitleView.currentSelectedIndex = defaultSelectInteger;

     NearViewController      * nearVC  = self.viewControllers[0];
    [nearVC headerRefreshing];
}
//  动态消息未读提醒
- (void)createReadNewView{
    
    _headReadView = [[HeadReadNewView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    [_headReadView.readNewBtn addTarget:self action:@selector(readNewBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headReadView];
}

#pragma mark ++ 点击导航标题delegate
-(void)guideTitleView:(GuideTitleView *)guideView SelectedIndex:(NSInteger)currentIndex{
    
    //    点击关注 移除红点
    if (1 == currentIndex || 2 == currentIndex) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hiddenRedBadgeView" object:nil];
        [guideView hideRedPoint:YES];
    }
    
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

#pragma mark - UI相关
- (void)createUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addNavBtn:nil isLeft:NO target:self action:@selector(rightBarButtonClick) bgImageName:@"releaseDynamic"];

    //    CGFloat origin_x = SCREEN_WIDTH/2 - (SCREEN_WIDTH/2)/2;
    CGFloat origin_y = 20;
    
    //    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(origin_x, origin_y, SCREEN_WIDTH/2, origin_y*2)];
    
    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(70, origin_y, SCREEN_WIDTH * 0.7, origin_y*2)];
    
    [_guideTitleView setGuideWithTitle:@[@"附近", @"精华", @"关注"]];
    _guideTitleView.guideDelegate = self;
    self.navigationItem.titleView = _guideTitleView;
    
    //    if (self.pageViewController) {
    [self.view addSubview:self.pageViewController.view];
    //    }
}

-(UIPageViewController*)pageViewController{
    
    if (!_pageViewController) {
        
        EssenceViewController   * essenceVC     = [[EssenceViewController alloc]init];
        NearViewController      * nearVC        = [[NearViewController alloc]init];
        AttentionViewController * attentionVC   = [[AttentionViewController alloc]init];
        
        essenceVC.controllerView = self;
        nearVC.controllerView = self;
        attentionVC.controllerView = self;
        
        _viewControllers = @[nearVC, essenceVC, attentionVC];
        
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.dataSource  = self;
        _pageViewController.delegate    = self;
        
        [_pageViewController setViewControllers:@[_viewControllers[0]] direction:0 animated:NO completion:nil];
        _pageViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        if (self.dyamicDict) {
            
            [self showHeadReadNewWith:self.dyamicDict];
        }
        
    }
    return _pageViewController;
}


#pragma mark - 事件相关
- (void)rightBarButtonClick{
    
    MY_TTLDynamicIssueViewController * dynamicDetailsVC = [[MY_TTLDynamicIssueViewController alloc]init];
//    dynamicDetailsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dynamicDetailsVC animated:YES];
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

//  点击头部动态未读消息事件
- (void)readNewBtnClick{
    
    
    if ([self.isShowBadgeAry[0] integerValue] == 0) {
        
        //    隐藏tabbar红点
        [self.tabBarController.tabBar hideBadgeOnItemIndex:1];
    }
    
    [self.isShowBadgeAry replaceObjectAtIndex:0 withObject:@(0)];
    
    _readNewCount = 0;
    MyInfomationViewController * infoVC = [[MyInfomationViewController alloc] init];
    infoVC.vcTitle = @"消息";
    [self.navigationController pushViewController:infoVC animated:YES];
}

//#pragma mark - 极光推送动态消息
//- (void)networkDidReceiveMessage:(NSNotification *)not{
//
//    NSDictionary * userInfo = not.userInfo;
//
//    if ([userInfo[@"title"] isEqualToString:@"动态消息"]) {
//
//        NSString *content = [userInfo valueForKey:@"content"];
//
//        NSData *jsonData = [content dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *dicData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
//
//        _readNewCount++;
//        [self showHeadReadNewWith:dicData];
//    }
//
//}

#pragma mark - 极光推送动态消息
- (void)networkDidReceiveMessage:(NSNotification *)not{
    
    NSDictionary * userInfo = not.userInfo;
    
    if ([userInfo[@"title"] isEqualToString:@"用户点赞"]) {
        
        NSDictionary * dicData = nil;
        if ([userInfo[@"extras"] isKindOfClass:[NSDictionary class]]) {
            dicData = userInfo[@"extras"];
            
            NSNumber * count = dicData[@"count"];
            _readNewCount = [count integerValue];
            
            [self showHeadReadNewWith:dicData];
            self.dyamicDict = dicData;
            
            [self.tabBarController.tabBar showBadgeOnItemIndex:1];
            
            [self.isShowBadgeAry replaceObjectAtIndex:0 withObject:@(1)];
            
            [_guideTitleView hideRedPoint:NO];
        }
    }
    else if ([userInfo[@"title"] isEqualToString:@"关注的人有新动态"]) {
        
        [self.tabBarController.tabBar showBadgeOnItemIndex:1];
        
        [self.isShowBadgeAry replaceObjectAtIndex:1 withObject:@(1)];
        
        [_guideTitleView hideRedPoint:NO];
    }
}


- (void)showHeadReadNewWith:(NSDictionary *)dict{
    
    _headReadView.readNewCount = _readNewCount;
    
    UIImage * placeholderImage = [UIImage imageNamed:@"占位_头像"];
    NSURL * url = [NSURL URLWithString:dict[@"headIcon"]];
    [_headReadView.headIcon sd_setImageWithURL:url placeholderImage:placeholderImage options:SDWebImageAllowInvalidSSLCertificates];
    _pageViewController.view.frame = CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 113);
    
    //  改变pageViewCotroller里面controller的tableView的高度
    NSArray * vcArray = _pageViewController.viewControllers;
    for (BaseViewController *vc in vcArray) {
        CGRect rect = vc.tableView.frame;
        rect.size.height = SCREEN_HEIGHT - 64 - 49 - 60;
        vc.tableView.frame = rect;
    }
}

//  隐藏红点和头部未读
- (void)hiddenRedBadgeView:(NSNotification *)not{
    
    _pageViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49);
    
    //  改变pageViewCotroller里面controller的tableView的高度
    NSArray * vcArray = _pageViewController.viewControllers;
    for (BaseViewController *vc in vcArray) {
        CGRect rect = vc.tableView.frame;
        rect.size.height = SCREEN_HEIGHT - 64 - 49;
        vc.tableView.frame = rect;
    }
    
    if ([self.isShowBadgeAry[0] integerValue] == 0) {
        
        //    隐藏tabbar红点
        [self.tabBarController.tabBar hideBadgeOnItemIndex:1];
    }
    
    [self.isShowBadgeAry replaceObjectAtIndex:1 withObject:@(0)];
    
    //  隐藏关注按钮上  红点
    [_guideTitleView hideRedPoint:YES];
}

-(NSMutableArray*)isShowBadgeAry{
    
    if (_isShowBadgeAry) {
        _isShowBadgeAry = [NSMutableArray arrayWithCapacity:0];
    }
    return _isShowBadgeAry;
}

- (void)refreshDataHideRedPoint{
    //  隐藏关注按钮上  红点
    [_guideTitleView hideRedPoint:YES];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
