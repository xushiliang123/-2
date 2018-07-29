//
//  MY_LLInfoController.m
//  VTIME
//
//  Created by Louie on 2017/9/9.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLInfoController.h"

#import "MY_LLInfomationViewController.h"
#import "MY_LYAddressListViewController.h"

#import "MY_LYLoginViewController.h"

@interface MY_LLInfoController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>
{
    
    NSMutableArray* _vcArray;
    UIView* _viewHeader;
    NSInteger _selectedIndex;//标记上一次选中的tag
}

@end



@implementation MY_LLInfoController


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addRedPoint:) name:@"messageCount" object:nil];
        
        //  获取未读消息
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUnreadMessageCount) name:@"setupUnreadMessageCount" object:nil];
    }
    return self;
}


- (void)addRedPoint:(NSNotification *)not{
    
    NSDictionary * dict = not.userInfo;
    
    NSInteger unreadCount = [dict[@"unreadCount"] intValue];
    
    if (unreadCount > 0) {
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%li",(long)unreadCount];
    }else{
        self.tabBarItem.badgeValue = nil;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _vcArray = [[NSMutableArray alloc]init];
    _selectedIndex = 10001;
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    [self.view addSubview:view];
    [self createHeader];
    [self createPageView];
    
}



-(void)createHeader
{
    CGFloat origin_x = SCREEN_WIDTH/2 - (SCREEN_WIDTH/2)/2;
    CGFloat origin_y = 20;
    _viewHeader = [[UIView alloc]initWithFrame:CGRectMake(origin_x, origin_y, SCREEN_WIDTH/2, origin_y*2)];
    self.navigationItem.titleView = _viewHeader;
    UIFont * btnNormalFont = [UIFont systemFontOfSize:16.0];
    UIFont * btnSelectedFont = [UIFont systemFontOfSize:18.0];
    
    NSArray* array = @[@"信息",@"通讯录"];
    //    初始化 发现等 按钮
    for(int i = 0; i < array.count; i++) {
        
        CGRect rect = CGRectMake(_viewHeader.bounds.size.width/2 * i, 0, _viewHeader.bounds.size.width/2, _viewHeader.bounds.size.height);
        UIButton* button = [Utility createButtonWithFrame:rect setImage:nil target:self action:@selector(clickButton:)];
        [button setTitle:array[i] forState:(UIControlStateNormal)];
        button.alpha = 0.5;
        [button setTitleColor:COlOR999 forState:(UIControlStateNormal)];
        button.titleLabel.font = btnNormalFont;
        button.tag = i + 10001;
        if (0 == i ) {
            button.titleLabel.font = btnSelectedFont;
            button.alpha = 1.0;
            [button setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
        [_viewHeader addSubview:button];
    }
}

-(void)clickButton:(UIButton*)sender{
    
    if (sender.tag == 10001) {
        [_pageViewController setViewControllers:@[_vcArray[0]] direction:1 animated:YES completion:nil];
    } else {
        [_pageViewController setViewControllers:@[_vcArray[1]] direction:0 animated:YES completion:nil];
    }
    [self changeCurrentSelectedIndex:sender.tag];
}
-(void)changeCurrentSelectedIndex:(NSInteger)index{
    
    if (index != _selectedIndex) {
        
        UIFont * btnNormalFont = [UIFont systemFontOfSize:16.0];
        UIFont * btnSelectedFont = [UIFont systemFontOfSize:18.0];
        
        UIButton * btn = [_viewHeader viewWithTag:index];
        btn.titleLabel.font = btnSelectedFont;
        btn.alpha = 1.0;
        [btn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
        
        UIButton * lastBtn = [_viewHeader viewWithTag:_selectedIndex];
        lastBtn.titleLabel.font = btnNormalFont;
        lastBtn.alpha = .5;
        [lastBtn setTitleColor:COlOR999 forState:(UIControlStateNormal)];
    }
    _selectedIndex = index;
    
}

#pragma mark - UI相关
-(void)createPageView
{
    MY_LLInfomationViewController* infoVc = [[MY_LLInfomationViewController alloc]init];
    MY_LYAddressListViewController* addVc = [[MY_LYAddressListViewController alloc]init];
    infoVc.controllerView = self;
    addVc.controllerView  = self;
    infoVc.index = 10001;
    addVc.index  = 10002;
    [_vcArray addObject:infoVc];
    [_vcArray addObject:addVc];
    
    _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:1 navigationOrientation:0 options:nil];
    _pageViewController.dataSource = nil;
    _pageViewController.delegate = nil;
    //    _pageViewController
    [_pageViewController setViewControllers:@[_vcArray[0]] direction:0 animated:NO completion:nil];
    _pageViewController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:_pageViewController.view];
}

#pragma mark - 代理相关
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    //
    //    NSInteger index = [_vcArray indexOfObject:viewController];
    //    if (index == 0) {
    //        return nil;
    //    }
    return nil;
}
//
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    //    NSInteger index = [_vcArray indexOfObject:viewController];
    //    if (index == _vcArray.count - 1) {
    //        return nil;
    //    }
    return nil;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    //    UIViewController *vc = pageViewController.viewControllers[0];
    //    NSInteger index = [_vcArray indexOfObject:vc];
    //    UISegmentedControl *seg = (UISegmentedControl *)self.navigationItem.titleView;
    //    seg.selectedSegmentIndex = index;
    //    [self changeCurrentSelectedIndex:index + 10001];
}


#pragma mark - 统计未读消息
-(void)setupUnreadMessageCount
{
//    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
//    NSInteger unreadCount = 0;
//    for (EMConversation *conversation in conversations) {
//        if (conversation.type == EMConversationTypeChat) {
//            unreadCount += conversation.unreadMessagesCount;
//        }
//    }
//
////    NSDictionary * dict = [NSDictionary dictionaryWithObject:@(unreadCount) forKey:@"unreadCount"];
////    UIApplication *application = [UIApplication sharedApplication];
////    [application setApplicationIconBadgeNumber:unreadCount];
//    TabBarController * tabCrl = (TabBarController *)self.tabBarController;
//
//    if (unreadCount > 0) {
//        [tabCrl.tabBar showBadgeOnItemIndex:3 badgeValue:unreadCount];
//    }
//    else {
//        [tabCrl.tabBar hideBadgeOnItemIndex:3];
//    }
}

////  小圆点初始化
//- (RCDTabBarBtn *)teamRCDbtn{
//    if (_teamRCDbtn == nil) {
//        _teamRCDbtn = [[RCDTabBarBtn alloc] initWithFrame:CGRectMake(50, 78, 20, 20)];
//        _teamRCDbtn.layer.cornerRadius = 9;//圆形
//        _teamRCDbtn.tag = 1001;
//        [_viewHeader addSubview:_teamRCDbtn];
//    }
//    return _teamRCDbtn;
//}


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
