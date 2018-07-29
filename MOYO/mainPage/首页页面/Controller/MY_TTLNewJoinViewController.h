//
//  MY_TTLNewJoinViewController.h
//  VTIME
//
//  Created by MadridLee on 2017/9/6.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "ViewController.h"

@interface MY_TTLNewJoinViewController : BaseViewController

@property (strong, nonatomic) UIViewController* controllerView;


@property (strong, nonatomic) NSMutableDictionary* selecteDictionary;
@property (strong, nonatomic)MY_LYPersonInfoModel *userModel; //我自己的信息
- (void)headerRefreshing;

@end
