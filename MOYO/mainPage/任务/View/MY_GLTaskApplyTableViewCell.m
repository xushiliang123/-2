//
//  MY_GLTaskApplyTableViewCell.m
//  VTIME
//
//  Created by gll on 2017/12/16.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLTaskApplyTableViewCell.h"

@implementation MY_GLTaskApplyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//  同意报名
- (IBAction)agreeButtonClick:(UIButton *)sender {
    
    //  如果是未同意 点击变为已同意         //  状态  status  int 1同意 2未同意 3拒绝

    if(2 == [_model.status integerValue]){
        
        ALERT_SHOW(nil, @"您如果同意当前用户领取您的任务将不能同意其他人", self, @"再想想", @"确定");
    }
}

#pragma mark - - alertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // 终止任务
    if([alertView.message isEqualToString:@"您如果同意当前用户领取您的任务将不能同意其他人"]){
        
        if (1 == buttonIndex) {
            
            if(self.taskApplyBlock){
                self.taskApplyBlock(self);
            }
        }
    }
    
}
    
-(void)setModel:(MY_LYTaskApplyModel *)model{
    
    _model = model;
    
    /*
     @property (weak, nonatomic) IBOutlet UIImageView *headerImg;
     @property (weak, nonatomic) IBOutlet UILabel *nickName;
     @property (weak, nonatomic) IBOutlet UILabel *descributionInfo;
     @property (strong, nonatomic) MY_GLTaskApplyModel * model;
     @property (weak, nonatomic) IBOutlet UIButton *statusBtn;
     */
    
    //  头像
    if(![Utility isBlankString:_model.headIcon]){
        NSURL * url = [NSURL URLWithString:_model.headIcon];
        [self.headerImg sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"占位图"]];
    }
    //  昵称
    if(![Utility isBlankString:_model.nickName]){
        
        self.nickName.text = _model.nickName;
    }
    
    NSString * colorBg = nil;//背景色
    NSString * colorTitle = nil;//文字颜色
    NSString * titleStr = nil;//文字
    
    //  状态  status  int 1同意 2未同意 4拒绝
    if(1 == [_model.status integerValue]){
        
        titleStr = @"已同意";
        colorBg = @"ffffff";
        colorTitle = @"DAB878";
        
    }else if (2 == [_model.status integerValue]){
        
        titleStr = @"同意";
        colorBg = @"DAB878";
        colorTitle = @"2F2F2F";

    }else if (4 == [_model.status integerValue]){
        
        titleStr = @"已拒绝";
        colorBg = @"ffffff";
        colorTitle = @"999999";
    }
    
    //  背景颜色
    UIColor * bgColor = [Utility colorWithHexString:colorBg alpha:1.0];
    UIColor * titleColor = [Utility colorWithHexString:colorTitle alpha:1.0];
    
    [self.statusBtn setTitle:titleStr forState:(UIControlStateNormal)];
    [self.statusBtn setTitleColor:titleColor forState:(UIControlStateNormal)];
    [self.statusBtn setBackgroundColor:bgColor];

    
}
    

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
