//
//  MY_TTLCerMetailTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLCerMetailTableViewCell.h"

@implementation MY_TTLCerMetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.labelTitle.textColor = [Utility colorWithHexString:@"999999" alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
