//
//  MY_TTLClubNoticeEndTableViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/10/13.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubNoticeEndTableViewCell.h"

@implementation MY_TTLClubNoticeEndTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImgv.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(inviterHeadImgClick)];
    [self.iconImgv addGestureRecognizer:tapG];
}

- (void)inviterHeadImgClick{
    if (self.HeadImgBlock) {
        self.HeadImgBlock();
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
