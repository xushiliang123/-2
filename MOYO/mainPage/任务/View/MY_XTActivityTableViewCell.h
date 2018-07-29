//
//  MY_XTActivityTableViewCell.h
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MY_LYTaskListModel.h"

@interface MY_XTActivityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *GZImg;//加V认证
@property (weak, nonatomic) IBOutlet UIButton *UserHeadImgBtn;
@property (weak, nonatomic) IBOutlet UILabel *UserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserVipLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimeAndDistanceLabel;//发布任务的时间和 距离
//@property (weak, nonatomic) IBOutlet UIImageView *ActTypeImg;
@property (weak, nonatomic) IBOutlet UILabel *ActTimeLabel;// 活动的日期、时间
@property (weak, nonatomic) IBOutlet UILabel *PeopleLimitLabel;//男女限制
@property (weak, nonatomic) IBOutlet UILabel *ActPlace;//地区
@property (weak, nonatomic) IBOutlet UILabel *RedPTypelabel;// money
@property (weak, nonatomic) IBOutlet UILabel *ActNameLabel;// 描述信息

@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;
    
@property (weak, nonatomic) IBOutlet UIButton *closeTaskBtn;
@property (weak, nonatomic) IBOutlet UIButton *taskStatusBtn;
    
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *taskStauteWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nickWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nickHeight;
@property (weak, nonatomic) MY_LYTaskListModel * taskModel;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewMineTask;

-(void)setValueWithModel:(MY_LYTaskListModel *)model;
    
@property(copy)void(^taskblock)(MY_XTActivityTableViewCell * taskCell,UIButton * btn);// isTag 0 领取任务 1 进行中 不可点击 2 已报名 不可点 3  已报名XX人  4 中止任务 （3、4 我发布的）

@end
