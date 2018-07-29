//
//  MY_TTLClubRedHeadTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/10/14.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubRedHeadTableViewCell.h"
#import "UIView+WebVideoCache.h"

@implementation MY_TTLClubRedHeadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImgv.layer.cornerRadius = 79/2.0;
    self.iconImgv.layer.masksToBounds = YES;
}

-(void)setModel:(MY_GLClubRedInfoModel *)model{
    
    _model = model;
    
    NSURL * imgUrl = [NSURL URLWithString:_model.headIcon];

    [self.iconImgv sd_setImageWithURL:imgUrl placeholderImage:[UIImage imageNamed:@"aa"]];
    
    NSString * priceString = [NSString stringWithFormat:@"%@元",[_model.totalMoney stringValue]];
    NSMutableAttributedString * priceAttribut = [[NSMutableAttributedString alloc]initWithString:priceString];
    [priceAttribut addAttributes:@{NSForegroundColorAttributeName:ERDCOLOR,NSFontAttributeName:[UIFont systemFontOfSize:40]} range:NSMakeRange(0, [priceString length] - 1)];
    [priceAttribut addAttributes:@{NSForegroundColorAttributeName:ERDCOLOR,NSFontAttributeName:[UIFont systemFontOfSize:40]} range:NSMakeRange([priceString length] - 1, 1)];

    self.priceLabel.attributedText = priceAttribut;
    
    if (![Utility isBlankString:_model.nickName]) {
       self.nameLabel.text = _model.nickName;
    }
    
    NSString * titleStr = [NSString stringWithFormat:@"%td个红包，已被抢完，总金额¥%@",[_model.num longValue],[_model.totalMoney stringValue]];
    if ([_model.grepNum integerValue] != [_model.num integerValue]) {
        titleStr = [NSString stringWithFormat:@"%td个红包，已抢%td个，总金额¥%@",[_model.num longValue],[_model.grepNum integerValue],[_model.totalMoney stringValue]];
    }
    
    self.titleLabel.text = titleStr;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
