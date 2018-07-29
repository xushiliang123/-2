//
//  MY_LLClubsReportViewController.h
//  VTIME
//
//  Created by tingting on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseViewController.h"

@interface MY_LLClubsReportViewController : BaseViewController

@property (nonatomic, strong)NSString * reportOfImageUrl;// 被举报的图片链接
@property (nonatomic, strong)NSString * reportOfPerson;// 被举报的昵称
@property (nonatomic, assign)NSInteger  repotrOfUserId;// 被举报的用户ID
@property (nonatomic ,assign) int ClubID;
@end
