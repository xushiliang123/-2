//
//  MY_TTLTXLabelTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/25.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLTXLabelTableViewCell.h"

@implementation MY_TTLTXLabelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    self.detailLabel.textColor = [Utility colorWithHexString:@"c9c9c9" alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
