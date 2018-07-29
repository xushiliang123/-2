//
//  MY_TTLPacketRecordTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLPacketRecordTableViewCell.h"

@implementation MY_TTLPacketRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(void)showData:(MY_TTLPacketRecordModel *)model
{
    
    NSArray * titleAry = @[@"招呼红包",@"邀请红包",@"群红包",@"小红包",@"动态红包",@"任务红包"];
    if ([model.type integerValue] <= titleAry.count && [model.type integerValue] > 0 ) {
        self.titleLabel.text = titleAry[[model.type integerValue]-1];
    }else{
        self.titleLabel.text = @"";
    }
    
    if (model.createTime != nil) {
        self.timeLabel.text = [Utility getStringDate:[model.createTime longLongValue]];
    }
    else{
        self.timeLabel.text = @"";
    }
    
    if (model.money != nil) {
        self.priceLabel.text = [NSString stringWithFormat:@"%.2f元",[model.money doubleValue] ];
    }else{
        self.priceLabel.text = @"";
    }
    
    self.numberLabel.text = [NSString stringWithFormat:@"%@/%@个",model.grepNum,model.num];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
