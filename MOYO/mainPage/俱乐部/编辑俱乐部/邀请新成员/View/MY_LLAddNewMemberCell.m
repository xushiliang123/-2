//
//  MY_LLAddNewMemberCell.m
//  VTIME
//
//  Created by tingting on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLAddNewMemberCell.h"

@implementation MY_LLAddNewMemberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.headIcon.layer.masksToBounds = YES;
    self.headIcon.layer.cornerRadius = 35 / 2;
    
    [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"creClubsArgN"] forState:UIControlStateNormal];
    [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"paySelect"] forState:UIControlStateSelected];
}
- (IBAction)selectBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
