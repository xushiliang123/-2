//
//  MY_TTLPacketGetTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/9/19.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLPacketGetTableViewCell.h"

@implementation MY_TTLPacketGetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)showData:(MY_TTLPacketRecordModel *)model
{
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:model.headIcon] placeholderImage:[UIImage imageNamed:@"占位图"]];
    if (![Utility isBlankString:model.nickName]) {
        self.titleLabel.text = model.nickName;
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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
