//
//  ViewController.m
//  VTIME
//
//  Created by MadridLee on 2017/9/5.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backL"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClcik)];
    item.tintColor = [Utility colorWithHexString:@"000000" alpha:1];
    self.navigationItem.leftBarButtonItem = item;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[Utility colorWithHexString:@"000000" alpha:1]}];
    self.navigationController.navigationBar.translucent = NO;
    
}
-(void)backButtonClcik{
    [self.navigationController popViewControllerAnimated:YES];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
