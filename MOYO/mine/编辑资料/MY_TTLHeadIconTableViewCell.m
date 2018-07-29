//
//  MY_TTLHeadIconTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/3/21.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLHeadIconTableViewCell.h"

@implementation MY_TTLHeadIconTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.layer.cornerRadius = 50/2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
