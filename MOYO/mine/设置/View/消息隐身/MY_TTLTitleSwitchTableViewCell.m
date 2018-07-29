//
//  MY_TTLTitleSwitchTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2016/12/29.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLTitleSwitchTableViewCell.h"

@implementation MY_TTLTitleSwitchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _switchIm.onTintColor = GOLDCOLOR;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
