//
//  MY_XTRefuceInviteTableViewCell.m
//  VTIME
//
//  Created by tingting on 2017/10/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTRefuceInviteTableViewCell.h"

@implementation MY_XTRefuceInviteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.InviterHeadImageV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(inviterHeadImgClick)];
    [self.InviterHeadImageV addGestureRecognizer:tapG];
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
