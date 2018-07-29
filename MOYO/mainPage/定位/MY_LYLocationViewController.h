//
//  MY_GLLocationViewController.h
//  VTIME
//
//  Created by gll on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^CHANGELOCATIONBLOCK)(NSString *);

@interface MY_LYLocationViewController : BaseViewController

@property (nonatomic, assign) BOOL isHomePage;

@property (nonatomic, copy)CHANGELOCATIONBLOCK changeLocationBlock;
@end
