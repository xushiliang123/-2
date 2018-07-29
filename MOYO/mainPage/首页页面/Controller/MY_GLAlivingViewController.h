//
//  MY_GLAlivingViewController.h
//  VTIME
//
//  Created by gll on 2018/1/18.
//  Copyright © 2018年 MadridLee. All rights reserved.
//

#import "BaseViewController.h"

@interface MY_GLAlivingViewController : BaseViewController

@property (strong, nonatomic) UIViewController* controllerView;


@property (strong, nonatomic) NSMutableDictionary* selecteDictionary;
@property (strong, nonatomic)MY_LYPersonInfoModel *userModel; //我自己的信息
- (void)headerRefreshing;

@end
