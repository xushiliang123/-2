//
//  RootBaseViewController.m
//  TogetherLu
//
//  Created by Louie on 16/12/24.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "RootBaseViewController.h"
#import "MY_LYLoginViewController.h"
#import "AppDelegate.h"
// 世界频道
//#import "CRSuspensionView.h"

@interface RootBaseViewController ()

//@property(strong,nonatomic)CRSuspensionView *suspensionView;

@end

@implementation RootBaseViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
    // 显示世界频道 在登录的前提下
    
//    if (USERID) {
//        [self addSuspensionView];
//    }
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
//    // 把世界频道从父视图移除
//    [self.suspensionView removeFromSuperview];
    
}

//- (void)addSuspensionView {
//
//    if (![self.suspensionView superview]) {
//        UIWindow * window = [UIApplication sharedApplication].keyWindow;
//
//        self.suspensionView = [[CRSuspensionView alloc] initWithFrame:CGRectMake(5, SCREEN_HEIGHT - 60, 190, 60)];
//        //    suspensionView.model = self.ownerModel;
//
//        [window addSubview:self.suspensionView];
//    }
//
//}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = BGCOLOR;
    
}

- (void)addNavBtn:(NSString *)title isLeft:(BOOL)isLeft target:(id)target action:(SEL)action bgImageName:(NSString *)bgImageName{
    
    //创建按钮
    UIBarButtonItem * item = nil;
    if (title) {
        
        item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    }else{
        
        item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:bgImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:target action:action];
    }
    
    if (isLeft) {
        //左边
        self.navigationItem.leftBarButtonItem = item;
    }else{
        //右边
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)addNavBtn:(NSString *)title target:(id)target action:(SEL)action
{
    [self addNavBtn:title isLeft:YES target:target action:action bgImageName:@"backButton"];
    
}

#pragma mark - 界面->tableView
- (void)createTableView{
    
    //  关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49) style:UITableViewStylePlain];
    [self.tableView setSeparatorColor:[Utility colorWithHexString:@"efefef" alpha:1]];
    self.tableView.showsVerticalScrollIndicator = NO;
    //    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}



#pragma mark - 界面->头部提示弹框
- (void)addCustomAlertViewWithMessge:(NSString *)messge{
    
    UIView * alerView = [[UIView alloc] initWithFrame:CGRectMake(0, -90, SCREEN_WIDTH, 90)];
    alerView.backgroundColor = [UIColor redColor];
    
    UILabel * alerLabel = [Utility createLabeltitleColor:[UIColor blackColor] frame:CGRectMake(0, 0, 0, 0) BackgroundColor:nil textSize:15];
    
    [alerView addSubview:alerLabel];
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:alerView];
    
//  弹出动画
    alerView.center = CGPointMake(SCREEN_WIDTH / 2, 32);
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
    animation.keyPath =@"position";
    animation.duration = 0;
//    animation.delegate =self;
    animation.values =@[
                        [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2, -32)],
                        [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2, 36)],
                        [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2, 30)],
                        [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2, 36)],
                        [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2, 32)],
                        
//                        [NSValue valueWithCGPoint:CGPointMake(277*ProportionAdapter,450*ProportionAdapter)],
//                        [NSValue valueWithCGPoint:CGPointMake(277*ProportionAdapter,468*ProportionAdapter)]
                        ];
    
    animation.timingFunctions =@[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                 ];
    //  设置每个关键帧的时长
    //@0.0第0s
    //@0.2从开始的第0s，过后的0.2s开始执行
    animation.keyTimes =@[@0.0, @0.1, @0.2, @0.3, @0.4, @6];
    
//    alerView.layer.position = CGPointMake(SCREEN_WIDTH / 2, -32);
    
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = @[animation];
    group.duration = animation.duration;
    group.speed = 0.2;
    
    [alerView.layer addAnimation:group forKey:nil];
    
//    UISwipeGestureRecognizer * swipeGestureRecognizer=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
//    
////    [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
//    
//    [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
//    
//    [alerView addGestureRecognizer:swipeGestureRecognizer];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [alerView addGestureRecognizer:tap];
    
    [UIView animateWithDuration:0.1 delay:5 options:UIViewAnimationOptionTransitionNone animations:^{

//        alerView.frame = CGRectMake(0, -70, SCREEN_WIDTH, 70);
        
    } completion:^(BOOL finished) {
        
    }];
    
//    [UIView animateWithDuration:0.2 animations:^{
//        
//        alerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
//    
//        }completion:^(BOOL finished) {
//    
//            [UIView animateWithDuration:0.5 // 动画时长
//                                  delay:0.0 // 动画延迟
//                 usingSpringWithDamping:0.5 // 类似弹簧振动效果 0~1
//                  initialSpringVelocity:10.0 // 初始速度
//                                options:UIViewAnimationOptionCurveEaseOut // 动画过渡效果
//                             animations:^{
//                                 
//                                 alerView.transform = CGAffineTransformMakeScale(1, 1.05);
//                                 
//                             } completion:^(BOOL finished) {
//
//                                     [UIView animateKeyframesWithDuration:3.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear  animations:^{
//                                 
//                                         [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:3.0 animations:^{
//                                 
//                                             alerView.transform = CGAffineTransformMakeScale(1, 1);
//                                             
//                                             alerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
//                                         }];
//                              
//                                     }completion:^(BOOL finished) {
//                                         
//                                         [UIView animateWithDuration:0.2 animations:^{
//                                             alerView.frame = CGRectMake(0, -64, SCREEN_WIDTH, 64);
//                                             
//                                         }];
//                                     }];
//                             }];
//        }];
}



- (void)handleSwipeFrom:(UITapGestureRecognizer *)swipeGesture{
    

    UIView * alerView = [swipeGesture view];

    [UIView animateWithDuration:0.2 animations:^{
            
        alerView.frame = CGRectMake(0, -64, SCREEN_WIDTH, 64);
    }];

}



#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"子类必须实现这个方法%s",__func__);
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"子类必须实现这个方法%s",__func__);
    return nil;
}

//获取字体高度
+(CGFloat)GetFontHeight:(CGFloat)fontSize withBold:(BOOL)isBold{
    UIFont* font = nil;
    if (isBold) {
        font = [UIFont systemFontOfSize:fontSize];
    } else {
        font = [UIFont systemFontOfSize:fontSize];
    }
    CGSize size = [@"测试" sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]];
    
    return size.height;
}

+(CGSize)GetStringRect:(NSString*)strText withWidth:(float)width withFont:(UIFont *)font{

    if (strText == nil)
    {
        return CGRectZero.size;
    }
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    CGRect rect = [strText boundingRectWithSize:CGSizeMake(width, 1000)  options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil];

    return rect.size;
}

- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *str = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    return str;
}

- (void)serviceError:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSString *error = [userInfo valueForKey:@"error"];
    NSLog(@"%@", error);
}

- (void)addNotificationCount {
    _notificationCount++;
}

- (void)addMessageCount {
    _messageCount++;
}

- (void)loginOut{
    
   

    EMError *error = [[EMClient sharedClient] logout:YES];
//    if (!error) {
        UserRemObject(Key);
        UserRemObject(UserId);
        REMHB;
        MY_LYLoginViewController * loginVC = [[MY_LYLoginViewController alloc] init];
        BaseNavigationController * nav = [[BaseNavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
        
//        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
//        [self presentViewController:nav animated:YES completion:nil];
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }
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
