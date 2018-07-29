//
//  MY_TTLRepordTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2016/12/30.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLRepordTableViewCell.h"

@implementation MY_TTLRepordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.imgvIcon.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
