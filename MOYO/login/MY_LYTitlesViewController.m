//
//  MY_TTLTitlesViewController.m
//  VTIME
//
//  Created by 听听 on 2017/12/26.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LYTitlesViewController.h"

@interface MY_LYTitlesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIButton *contactBtn;

@end

@implementation MY_LYTitlesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.contactBtn.layer.cornerRadius = 40/2;
    self.contactBtn.layer.masksToBounds = YES;
    self.view.backgroundColor = [UIColor colorWithRed:85/255 green:85/255 blue:85/255 alpha:1];
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
- (IBAction)contactCustomerService:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter]postNotificationName:KNoticationIsForbidden object:nil];
}


@end
