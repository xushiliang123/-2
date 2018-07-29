//
//  MY_XTGuideViewController.m
//  VTIME
//
//  Created by tingting on 2017/11/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTGuideViewController.h"
#import "TabBarController.h"
#import "AppDelegate.h"
#import "EAIntroView.h"
#import "MY_LYLoginViewController.h"
#import "CRWebViewController.h"

#import "MY_GLEditMyInfoViewController.h"// 编辑资料
#import "CounterMarkViewController.h"// 设置标签
@interface MY_XTGuideViewController ()<EAIntroDelegate>
{
    UIButton *_experienceBtn;
    UIButton *_NoExperienceBtn;
    BOOL ispushDV;
//    BOOL ispushEditVC;

}
@property(nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int timeNumber;

@end

@implementation MY_XTGuideViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.timeNumber = 3;
    [self downloadIntroPage];
    [self addNavBtn:nil isLeft:YES target:self action:@selector(backClick) bgImageName:@"aa"];
    
}

-(void)gotoEditOrCounterMark{
    //                    [self dismissViewControllerAnimated:YES completion:nil];
    
    //  跳转编辑资料
    if (1 == self.isEditInfo || 3 == self.isEditInfo) {
        
        MY_GLEditMyInfoViewController * vc = [MY_GLEditMyInfoViewController new];
        vc.isEditInfo = self.isEditInfo;
        //        UINavigationController * begzNav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [self.navigationController pushViewController:vc animated:YES];
        //        [self presentViewController:begzNav animated:NO completion:nil];
        
    }else if (2 == self.isEditInfo){
        // 跳转标签
        CounterMarkViewController * vc = [CounterMarkViewController new];
        //        UINavigationController * markNav = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [self.navigationController pushViewController:vc animated:YES];
        //        [self presentViewController:markNav animated:YES completion:nil];
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
            [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationRequestLocation" object:nil];
            [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationDaiyan object:nil];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"KNoticaationFirstComeHome" object:nil];
        }];
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
    
    //    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //
    //    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    //    self.navigationController.navigationBar.translucent = YES;
    
    ispushDV = NO;
    
    if(USERKEY)
    {
        if(self.timeNumber == 0)
        {
            //  如果没有编辑资料 跳转编辑资料
            [self gotoEditOrCounterMark];
            
        }
    }else
    {
        if(self.timeNumber == 0)
        {
            MY_LYLoginViewController *loginControl = [[MY_LYLoginViewController alloc]init];
            [self.navigationController pushViewController:loginControl animated:YES];
        }
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    ispushDV = YES;
    self.navigationController.navigationBarHidden = NO;
    
    //    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //
    //    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setShadowImage:nil];
    //    self.navigationController.navigationBar.translucent = NO;
    
}

-(void)downloadIntroPage
{
    [TLHTTPRequest MY_getWithBaseUrl:getAdvertisement parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull data) {
        
        if ([[data objectForKey:@"ret"] integerValue] == 0) {
            //            NSArray * dataArray = [data objectForKey:@"info"];
            //            for (NSDictionary* dic in dataArray)
            //            {
            //                [self.dataArray addObject:dic];
            //            }
            NSDictionary* dic = [data objectForKey:@"info"];
            [self.dataArray addObject:dic];
            
            _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
            [self showIntroWithCrossDissolve];
        }
        else
        {
            
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        
        [self showIntroWithCrossDissolve];
    }];
}

- (void)showIntroWithCrossDissolve {
    //    EAIntroPage *page1       = [EAIntroPage page];
    //    page1.customView         = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"邀请男女.jpg"]];
    //    page1.customView.frame   = self.view.bounds;
    //
    //
    //    EAIntroPage *page2       = [EAIntroPage page];
    //    page2.customView         = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"邀请男女.jpg"]];
    //    page2.customView.frame   = self.view.bounds;
    //
    //    EAIntroPage *page3       = [EAIntroPage page];
    //    page3.customView         = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登录-底图.jpg"]];
    //    page3.customView.frame   = self.view.bounds;
    //
    //    EAIntroPage *page4       = [EAIntroPage page];
    //    page4.customView         = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"邀请男女.jpg"]];
    //    page4.customView.frame   = self.view.bounds;
    
    
    NSMutableArray *pagearray = [[NSMutableArray alloc]init];
    
    if(self.dataArray.count == 0)
    {
        EAIntroPage *page       = [EAIntroPage page];
        page.customView         = [[UIView alloc] init];
        page.customView.frame   = self.view.bounds;
        UIImageView  * Imageview= [[UIImageView  alloc]initWithFrame:page.customView.bounds];
        Imageview.contentMode   = UIViewContentModeScaleAspectFill;
        Imageview.image         = [UIImage imageNamed:@"LaunchImage"];
        [page.customView addSubview:Imageview];
        [pagearray addObject:page];
    }
    else
    {
        for (int i = 0; i < [self.dataArray count]; i++) {
            NSDictionary *imgDict = self.dataArray[i];
            EAIntroPage *page       = [EAIntroPage page];
            page.customView         = [[UIView alloc] init];
            page.customView.frame   = self.view.bounds;
            UIImageView  * Imageview= [[UIImageView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, page.customView.frame.size.height-83)];
            Imageview.contentMode   = UIViewContentModeScaleAspectFill;
            [Imageview sd_setImageWithURL:[NSURL URLWithString: imgDict[@"advertisement"][@"imgUrl"]] placeholderImage:[UIImage imageNamed:@"LaunchImage"]options:SDWebImageRefreshCached];

            UIImageView  * Imageviewlogo= [[UIImageView  alloc]initWithFrame:CGRectMake(0, page.customView.frame.size.height - 120, SCREEN_WIDTH, 120)];
//            Imageviewlogo.contentMode   = UIViewContentModeScaleAspectFill;
            Imageviewlogo.image = [UIImage imageNamed:@"bottom"];
            
            if(self.isfirstLogin == YES)
            {
                
            }else
            {
                [Imageview setUserInteractionEnabled:YES];
                [Imageview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAdv:)]];
            }
            
            [page.customView addSubview:Imageview];
            [page.customView addSubview:Imageviewlogo];
            [pagearray addObject:page];
        }
    }
    
    
    EAIntroView *intro          = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:pagearray];
    intro.skipButton.hidden     = YES;
    intro.swipeToExit           = NO;
    intro.pageControlY          = 750;
    //    intro.pageControl.pageIndicatorTintColor = [UIColor colorFromHex:@"#4D4D4D"];
    //    intro.pageControl.currentPageIndicatorTintColor = [UIColor colorFromHex:@"#FFB700"];
    //    _experienceBtn              = [UIUtil drawDefaultButton:page4.pageView title:@"开启洗车之旅" target:self action:@selector(experienceButtonClick:)];
    //    _experienceBtn.bottom       = self.view.bottom-Main_Screen_Height*73/667;
    //    _experienceBtn.width        = Main_Screen_Width*200/375;
    //    _experienceBtn.centerX      = Main_Screen_Width/2;
    //    _experienceBtn.layer.cornerRadius   = _experienceBtn.height/2;
    //    _experienceBtn.hidden       = YES;
    _NoExperienceBtn              = [UIButton buttonWithType:UIButtonTypeCustom];
    [_NoExperienceBtn addTarget:self action:@selector(experienceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _NoExperienceBtn.frame = CGRectMake(SCREEN_WIDTH - SCREEN_WIDTH * 85/375, SCREEN_HEIGHT*32/667, SCREEN_WIDTH*65/375, SCREEN_HEIGHT*25/667);
    [_NoExperienceBtn setTitle:@"3 跳过" forState:UIControlStateNormal];
    _NoExperienceBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_NoExperienceBtn setTitleColor:[Utility colorWithHexString:@"#FFFFFF" alpha:1] forState:UIControlStateNormal];
    [_NoExperienceBtn setBackgroundColor:[Utility colorWithHexString:@"#000000" alpha:0.2f]];
    _NoExperienceBtn.layer.cornerRadius   = _NoExperienceBtn.frame.size.height/2;
    _NoExperienceBtn.layer.masksToBounds  = YES;
    [intro addSubview:_NoExperienceBtn];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.3];
    
}

-(void)clickAdv:(UITapGestureRecognizer *)gestureRecognizer
{
    if (USERID) {
        CRWebViewController * vc = [[CRWebViewController alloc] init];
        vc.strTitle = [[self.dataArray objectAtIndex:0] objectForKey:@"des"];
        if (![Utility isBlankString:[[self.dataArray objectAtIndex:0] objectForKey:@"link"]]) {
            vc.webURL = [[[self.dataArray objectAtIndex:0] objectForKey:@"link"] stringByAppendingFormat:@"?userId=%@",USERID];
        }
        else{
            vc.webURL = @"";
        }
        vc.stringfrom = @"代言";
//        vc.hidesBottomBarWhenPushed = YES;
        ispushDV = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)intro:(EAIntroView *)introView pageAppeared:(EAIntroPage *)page withIndex:(NSUInteger)pageIndex{
    if (pageIndex == introView.pages.count-1) {
        _experienceBtn.hidden = NO;
        //        MY_TTLLoginViewController *loginControl = [[MY_TTLLoginViewController alloc]init];
        //        UINavigationController *nav         = [[UINavigationController alloc]initWithRootViewController:loginControl];
        //        [self.view.window.rootViewController presentViewController:nav animated:NO completion:nil];
        
    }else{
        //        _experienceBtn.hidden = YES;
    }
}

- (void) skipButtonClick:(id)sender {
    
    
}
- (void) experienceButtonClick:(id)sender {
    
    
    if(USERKEY)
    {
        //  如果没有编辑资料 跳转编辑资料
        [self gotoEditOrCounterMark];
        
    }
    else{
        
        //    NSString *key = (NSString *)kCFBundleVersionKey;
        //    NSString *currentAppVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        //    [[NSUserDefaults standardUserDefaults]setValue:currentAppVersion forKey:kBDFirstLanchKey];
        //    [[NSUserDefaults standardUserDefaults]synchronize];
        
        //    [UIApplication sharedApplication].keyWindow.rootViewController = nil;
        ispushDV = YES;
        
        MY_LYLoginViewController *loginControl = [[MY_LYLoginViewController alloc]init];
        //    UINavigationController *nav         = [[UINavigationController alloc]initWithRootViewController:loginControl];
        //    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:NO completion:nil];
        
        [self.navigationController pushViewController:loginControl animated:YES];
        //    MenuTabBarController *menuTabBarController    = [[MenuTabBarController alloc] init];
        //    [AppDelegate sharedInstance].window.rootViewController =menuTabBarController;
    }
}

#pragma mark --定时器方法
- (void)autoMove {
    
    _timeNumber--;
    [_NoExperienceBtn setTitle:[NSString stringWithFormat:@"%d 跳过",_timeNumber] forState:UIControlStateNormal];
    if (_timeNumber == 0) {
        [_timer invalidate];
        
        [_NoExperienceBtn setTitle:[NSString stringWithFormat:@"跳过"] forState:UIControlStateNormal];
        
        if(USERKEY)
        {
            if(ispushDV == YES)
            {
                
            }
            
            else{
                
                //  如果没有编辑资料 跳转编辑资料
                [self gotoEditOrCounterMark];
            }
            
        }else
        {
            
            if(ispushDV == YES)
            {
                
            }
            
            else{
                MY_LYLoginViewController *loginControl = [[MY_LYLoginViewController alloc]init];
                [self.navigationController pushViewController:loginControl animated:YES];
                
            }
            
            
        }
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
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
