//
//  MY_LLClubsManagerViewController.h
//  VTIME
//
//  Created by tingting on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseViewController.h"

@interface MY_LLClubsManagerViewController : BaseViewController

@property (nonatomic ,assign) int ClubID;

@property (nonatomic ,copy) NSDictionary *clubInfoDic;

@property(nonatomic,assign) BOOL isManager;

@end
