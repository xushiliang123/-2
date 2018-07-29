//
//  MY_XTActivityTableViewCell.m
//  VTIME
//
//  Created by tingting on 2017/11/7.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTActivityTableViewCell.h"

#define MY_XTActivityNickNameHeight 15
#define MY_XTActivityDisplayNameHeight 20
@implementation MY_XTActivityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.UserVipLevelLabel.layer.cornerRadius = 6;
//    self.UserVipLevelLabel.layer.masksToBounds = YES;
    self.UserVipLevelLabel.hidden = YES;
    self.layer.cornerRadius = 12.5;
    self.layer.masksToBounds = YES;
    
}

// 终止任务
- (IBAction)closeTask:(UIButton *)sender {
    
    ALERT_SHOW(nil, @"任务进行中，是否终止？", self, @"再想想", @"确认");
}

//  已加入人数 领取任务 / 已领取
- (IBAction)attendNumber:(UIButton *)sender {
    
    if(self.taskblock){
                
        self.taskblock(self,sender);
    }
}
    
// 加载数据
-(void)setValueWithModel:(MY_LYTaskListModel *)model{
    self.taskModel = model;
    //  是否匿名 匿名不显示名字
    if([model.isAnonymously integerValue]){
        self.UserNameLabel.backgroundColor = [UIColor blackColor];
        self.UserNameLabel.text = @"  匿名  ";
        self.UserNameLabel.textColor = GOLDCOLOR;
        self.UserNameLabel.layer.cornerRadius = MY_XTActivityNickNameHeight/2;
        self.UserNameLabel.layer.masksToBounds = YES;
        self.UserNameLabel.font = [UIFont systemFontOfSize:10];
        self.nickWidth.constant = 45.0;
        self.nickHeight.constant = MY_XTActivityNickNameHeight;
        [self.UserHeadImgBtn setBackgroundImage:[UIImage imageNamed:@"anonymityTaskIcon"] forState:UIControlStateNormal];
        
    }else{
        
        self.UserNameLabel.backgroundColor = [UIColor whiteColor];
        self.UserNameLabel.layer.cornerRadius = 0.0;
        self.UserNameLabel.font = [UIFont systemFontOfSize:16];
        self.UserNameLabel.textColor = COlOR666;
        self.nickHeight.constant = MY_XTActivityDisplayNameHeight;
        CGSize nickSize =  [Utility stringSizeWithString:model.nickName textSize:16 width:0 height:MY_XTActivityDisplayNameHeight];
        self.nickWidth.constant = nickSize.width;
       
        if(![Utility isBlankString:model.nickName]){
            
            self.UserNameLabel.text = model.nickName;
        }
        
        if(![Utility isBlankString:model.headIcon]){
            NSURL * url = [NSURL URLWithString:model.headIcon];
            [self.UserHeadImgBtn sd_setBackgroundImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"占位图"]];
//            [self.UserHeadImgBtn sd_setImageWithURL:url forState:(UIControlStateNormal) placeholderImage:[UIImage imageNamed:@"占位图"]];
        }
    }
    
    //  加V认证
    if([model.isAuthen integerValue]){
        self.GZImg.hidden = NO;
    }else{
        self.GZImg.hidden = YES;
    }
    
    // 性别  0 女 1 男
    NSString * sexStr = @"女";
    if([model.sex integerValue]){
        sexStr = @"男";
    }
    self.sexImageView.image = [UIImage imageNamed:sexStr];
    
    self.UserVipLevelLabel.text = NiBGetVipLevel([model.consumptionLevel integerValue]);
    
    self.ActNameLabel.text = model.taskInfo;
    
//    MY_LLPersonInfoModel * userModel = [[MessageInfoModel sharedManager] loadPersonModelWithID: [USERID integerValue]];
    NSString * where = [NSString stringWithFormat:@"userId = %td",[USERID integerValue]];
    NSArray *arry = [[MY_LLDBManager sharedManager] selectClass:[MY_LYPersonInfoModel class] withWhere:where];
    MY_LYPersonInfoModel *userModel = arry.firstObject;
    //  距离 + 发布时间
    NSString * region = nil;
    if (model.distanceStatus.integerValue) {
        region = @"隐身";
     }else{
         if (![userModel.region isEqualToString:userModel.selectRegion] ||  [model.region isEqualToString:@"角落里"]) {
             region =  model.region;
             
         }else{
             if ([userModel.region isEqualToString:model.region]) {
                 
                 if([model.distance floatValue] >= 300)
                 {
                     region =  model.region;
                 }
                 else
                 {
                     region  = [NSString stringWithFormat:@"%.1fkm",[model.distance floatValue]];
                 }
             }else{
                 region =  model.region;
             }
         }
     }
    
    NSString * timeStr = [Utility isBlankString:model.createTime.stringValue]?@"1分钟前": [Utility getStringDate:model.createTime.longLongValue];
    self.TimeAndDistanceLabel.text =  [NSString stringWithFormat:@"%@ | %@", region, timeStr];
    
    // 显示日期
    NSString * monthDay = [NSString stringWithFormat:@"%@",[Utility getDateShowMonthDayString:[model.expireTime longLongValue]]];
	NSString * HourMinute = [NSString stringWithFormat:@"%@",[Utility getDateShowHourMinuteString:[model.expireTime longLongValue]]];

    self.ActTimeLabel.text = [NSString stringWithFormat:@"•    %@ | %@",monthDay,HourMinute];
    
    // 性别限制 limitSex 0女 1 男 2男女不限
	NSString * PeopleLimit = @"限女士";
    if(1 == [model.limitSex integerValue]){
        PeopleLimit = @"限男士";
    }else if (2 == [model.limitSex integerValue]){
        PeopleLimit = @"男女不限";
    }
    self.PeopleLimitLabel.text = [NSString stringWithFormat:@"•    %@",PeopleLimit];// | %@人,[model.limitNum stringValue]
    
    //  地区
    self.ActPlace.text =  [NSString stringWithFormat:@"•    %@",model.location];
    
    //  钱 ￥1000
    self.RedPTypelabel.text = [NSString stringWithFormat:@"•    ￥ %td",[model.money integerValue]];
    
    // tag  int    0 与我无关 1 我参与的 2 我报名的 3 我发布的
    NSString * taskState = nil;
    self.closeTaskBtn.hidden = YES;

    switch ([model.tagNum integerValue]) {
        case 1:{
            
            taskState = @"进行中";
            [self.imgViewMineTask setImage:[UIImage imageNamed:@"task_doingTask"]];

            break;
        }case 2:{
            
            taskState = @"已报名";
            [self.imgViewMineTask setImage:[UIImage imageNamed:@"task_attend"]];

            break;
        }case 3:{
            
            //  如果是我发布的 显示报名人数
            if([model.userId integerValue] == [USERID integerValue]){
                taskState = [NSString stringWithFormat:@"% td人已报名 ",[model.pickNum integerValue]];
             
//                self.taskStauteWidth.constant = [Utility stringSizeWithString:taskState textSize:12 width:0 height:14].width;
            }
            self.closeTaskBtn.hidden = NO;
            
            [self.imgViewMineTask setImage:[UIImage imageNamed:@"task_mine"]];
            
            break;
        }
        
        default:
            taskState = @"领取任务";
            [self.imgViewMineTask setImage:[UIImage imageNamed:@"nil"]];

        break;
    }
    //  closeTaskBtn 终止btn
    //  taskStatusBtn; 任务状态btn
    [self.taskStatusBtn setTitle:taskState forState:(UIControlStateNormal)];
    
}

#pragma mark - - alertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // 终止任务
    if([alertView.message isEqualToString:@"任务进行中，是否终止？"]){
        
        if (1 == buttonIndex) {
            
            if(self.taskblock){
                
                self.taskblock(self,self.closeTaskBtn);
            }
        }
    }
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
