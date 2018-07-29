//
//  MY_TTLClubHomeTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubHomeTableViewCell.h"

@implementation MY_TTLClubHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    self.vipLevel.backgroundColor = GOLDCOLOR;
    self.numAreaLabel.textColor = GOLDCOLOR;
    
    self.iconImgv.layer.masksToBounds = YES;
    self.iconImgv.layer.cornerRadius  = self.iconImgv.frame.size.height/2;
  
    self.vipLevel.layer.masksToBounds = YES;
    self.vipLevel.layer.cornerRadius  = self.vipLevel.frame.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
