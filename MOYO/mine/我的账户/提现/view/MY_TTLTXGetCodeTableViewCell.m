//
//  MY_TTLTXGetCodeTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/25.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLTXGetCodeTableViewCell.h"

@implementation MY_TTLTXGetCodeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.btnCode.layer.masksToBounds = YES;
    self.btnCode.layer.cornerRadius  = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
