//
//  MY_GLBeGZViewController.h
//  VTIME
//
//  Created by gll on 2017/11/1.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "BaseViewController.h"

#import "MY_TTLMeModel.h"

@interface MY_GLBeGZViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UILabel *inviteFrendlabel;
@property (weak, nonatomic) IBOutlet UILabel *inviteDetailLabel;
@property (weak, nonatomic) IBOutlet UIButton *Godetailbtn;
@property (weak, nonatomic) IBOutlet UIButton *connectkefubtn;

@property (strong,nonatomic)NSString * pullNum;// 邀请人数

@property (strong,nonatomic)NSString * inviteNum ;// 已邀请人数

@property (strong,nonatomic)NSString * available;// 是否可查看首页 0 NO 1 YES

@property (strong,nonatomic)MY_TTLMeModel * model;

@property (nonatomic ,strong)NSString *from;

@end
