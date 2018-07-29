//
//  MY_GLFindRootViewController.m
//  VTIME
//
//  Created by gll on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLFindRootViewController.h"
#import "GuideTitleView.h"//导航标题
#import "MY_TTLFindViewController.h"//地图
#import "MY_GLWorldTVViewController.h"//世界频道
#import "MY_LYActivityViewController.h"//活动
#import "MY_LYCreateAnActivityViewController.h"
@interface MY_GLFindRootViewController ()
<GuideTitleViewDelegate,
UIPageViewControllerDataSource,
UIPageViewControllerDelegate>

@property (strong, nonatomic) NSArray               * viewControllers;
@property (strong, nonatomic) GuideTitleView        * guideTitleView;

@end

@implementation MY_GLFindRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationSelect:) name:@"addheight" object:nil];
    [self uiConfig];
    
    

}

-(void)notificationSelect:(NSNotification*)nito{
    
    CGFloat height = [[nito.userInfo objectForKey:@"height"] integerValue];
    
    CGRect rect = _pageViewController.view.frame;
    if (self.tabBarController.tabBar.hidden == YES) {
        rect.size.height = height;
    }
    else{
        rect.size.height = height + 49;
    }
    _pageViewController.view.frame = rect;
}

#pragma mark - UI相关
- (void)uiConfig{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //    CGFloat origin_x = SCREEN_WIDTH/2 - (SCREEN_WIDTH/2)/2;
    CGFloat origin_y = 20;
    
    //    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(origin_x, origin_y, SCREEN_WIDTH/2, origin_y*2)];
    
    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(70, origin_y, SCREEN_WIDTH - 140, origin_y*2)];
    
    [_guideTitleView setGuideWithTitle:@[@"地图",@"活动"]];
    _guideTitleView.guideDelegate = self;
    self.navigationItem.titleView = _guideTitleView;
    
    if (self.pageViewController) {
        [self.view addSubview:self.pageViewController.view];
    }
    
}

-(UIPageViewController*)pageViewController{
    
    if (!_pageViewController) {
        MY_TTLFindViewController   * actVc     = [[MY_TTLFindViewController alloc]init];
//        MY_GLWorldTVViewController * joinVC    = [[MY_GLWorldTVViewController alloc]init];
        MY_LYActivityViewController * joinVC    = [[MY_LYActivityViewController alloc]init];

        actVc.controllerView = self;
        joinVC.controllerView = self;
        
        _viewControllers = @[actVc, joinVC];
        
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.dataSource  = nil;
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
        [self addNavBtn:nil isLeft:NO target:self action:nil bgImageName:nil];

    }
    else if (currentIndex > guideView.currentSelectedIndex - defaultSelectInteger){
        [_pageViewController setViewControllers:@[_viewControllers[currentIndex]]
                                      direction:0 animated:YES completion:nil];
        [self addNavBtn:@"发起" isLeft:NO target:self action:@selector(StatAActivity) bgImageName:nil];
        self.navigationItem.leftBarButtonItem.tintColor = [Utility colorWithHexString:@"#666666" alpha:1];
    }
    else return;
}

-(void)StatAActivity
{
    MY_LYCreateAnActivityViewController *ca = [[MY_LYCreateAnActivityViewController alloc] init];
//    ca.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ca animated:YES];
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
