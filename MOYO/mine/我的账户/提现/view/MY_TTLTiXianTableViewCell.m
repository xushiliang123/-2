//
//  MY_TTLTiXianTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/24.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLTiXianTableViewCell.h"

@implementation MY_TTLTiXianTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.cardLabel.textColor        = [Utility colorWithHexString:@"333333" alpha:1];
    self.numberLabel.textColor      = [Utility colorWithHexString:@"333333" alpha:1];
    [self.changeBtn setTitleColor:GOLDCOLOR forState:UIControlStateNormal];
    self.tixianLabel.textColor      = [Utility colorWithHexString:@"333333" alpha:1];
    self.textField.textColor        = [Utility colorWithHexString:@"333333" alpha:1];
    self.viewLine.backgroundColor   = [Utility colorWithHexString:@"e5e5e5" alpha:1];
    self.stateLabel.textColor       = [Utility colorWithHexString:@"999999" alpha:1];
    self.textField.placeholder      = @"请输入提现金额";
    NSString * aStr = @"还未绑定银行卡，立即前往绑定";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",aStr]];
    [str addAttribute:NSForegroundColorAttributeName value:[Utility colorWithHexString:@"999999" alpha:1] range:NSMakeRange(0,aStr.length - 2)];
    [str addAttribute:NSForegroundColorAttributeName value:GOLDCOLOR range:NSMakeRange(aStr.length - 2 , 2)];
    [self.bindBtn setAttributedTitle:str forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
