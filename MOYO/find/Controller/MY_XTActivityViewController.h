//
//  MY_XTActivityViewController.h
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MY_XTActivityViewController : UIViewController
@property (strong, nonatomic) UIViewController* controllerView;

@property (strong, nonatomic) UITableView* tableView;

@property (strong, nonatomic) NSMutableDictionary* selecteDictionary;

@end
