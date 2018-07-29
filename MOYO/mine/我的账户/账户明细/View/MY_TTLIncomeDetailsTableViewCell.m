//
//  MY_TTLIncomeDetailsTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/9/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLIncomeDetailsTableViewCell.h"

@implementation MY_TTLIncomeDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)showDetail:(MY_TTLIncomeModel *)model
{
    if (![Utility isBlankString:model.des]) {
        self.titleLabel.text = model.des;
    }else{
        self.titleLabel.text = @"";
    }
    
    self.timeLabel.text = [Utility getDateShowMonthDayHourMinuteString:[model.createTime longLongValue]];
    
    NSString * money = nil;
    if ([model.moneyBackChange doubleValue] > 0) {  // >0 收入 <0 消费
        money = [NSString stringWithFormat:@"+%.2f",[model.moneyBackChange doubleValue]];
    }else{
        money = [NSString stringWithFormat:@"%.2f",[model.moneyBackChange doubleValue]];
    }
    self.moneyLabel.text = money;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
