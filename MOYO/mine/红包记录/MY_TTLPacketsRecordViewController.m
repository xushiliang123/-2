//
//  MY_TTLHomePageViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/6.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLPacketsRecordViewController.h"
#import "GuideTitleView.h"//导航标题
#import "MY_TTLPacketsSendViewController.h"
#import "MY_TTLPacketsGetViewController.h"


@interface MY_TTLPacketsRecordViewController ()<GuideTitleViewDelegate,UIPageViewControllerDataSource,UIPageViewControllerDelegate>
@property (strong, nonatomic) UIPageViewController  * pageViewController;
@property (strong, nonatomic) NSArray               * viewControllers;
@property (strong, nonatomic) GuideTitleView        * guideTitleView;

@property (nonatomic, strong)UIButton * navLeftBtn;


@end

@implementation MY_TTLPacketsRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self uiConfig];
}
#pragma mark - UI相关
- (void)uiConfig{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //    CGFloat origin_x = SCREEN_WIDTH/2 - (SCREEN_WIDTH/2)/2;
    CGFloat origin_y = 20;
    
    //    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(origin_x, origin_y, SCREEN_WIDTH/2, origin_y*2)];
    
    _guideTitleView = [[GuideTitleView alloc]initWithFrame:CGRectMake(70, origin_y, SCREEN_WIDTH - 140, origin_y*2)];
    
    [_guideTitleView setGuideWithTitle:@[@"我收到的", @"我发出的"]];
    _guideTitleView.guideDelegate = self;
    self.navigationItem.titleView = _guideTitleView;
    
    if (self.pageViewController) {
        [self.view addSubview:self.pageViewController.view];
    }
}


-(UIPageViewController*)pageViewController{
    if (!_pageViewController) {
        MY_TTLPacketsSendViewController * sendVc       = [[MY_TTLPacketsSendViewController alloc]init];
        MY_TTLPacketsGetViewController  * getVC        = [[MY_TTLPacketsGetViewController alloc]init];
        
        sendVc.controllerView = self;
        getVC.controllerView = self;
        
        _viewControllers = @[getVC,sendVc];
        
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
