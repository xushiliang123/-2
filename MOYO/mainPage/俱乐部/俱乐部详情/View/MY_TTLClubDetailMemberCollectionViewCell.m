//
//  MY_TTLClubDetailMemberCollectionViewCell.m
//  VTIME
//
//  Created by MadridLee on 2017/10/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_TTLClubDetailMemberCollectionViewCell.h"

@implementation MY_TTLClubDetailMemberCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.iconImgv.layer.masksToBounds = YES;
    self.iconImgv.layer.cornerRadius  = self.iconImgv.frame.size.height/2;

}

@end
