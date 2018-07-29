//
//  MY_TTLAddVCerTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/19.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLAddVCerTableViewCell.h"

@implementation MY_TTLAddVCerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.iconImgv.layer.cornerRadius  = 8;
    self.iconImgv.layer.masksToBounds = YES;
    
    self.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
