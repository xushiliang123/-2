//
//  MY_TTLSkillCenterTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/8/15.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLSkillCenterTableViewCell.h"

@implementation MY_TTLSkillCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
  
}

-(void)showDetail:(MY_TTLMeModel *)model{
    if (model.money != nil) {
        [self.leftTitle showTitle:[NSString stringWithFormat:@"%.2f",[model.money floatValue]] withDetail:@"充值余额"];
    }
    else{
        [self.leftTitle showTitle:@"0" withDetail:@"充值余额"];
    }
    if (model.hongbaoGetMoney != nil) {
        [self.rightView showTitle:[NSString stringWithFormat:@"%.2f",[model.moneyBack floatValue]] withDetail:@"收益"];
    }
    else{
        [self.rightView showTitle:@"0" withDetail:@"收益"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
