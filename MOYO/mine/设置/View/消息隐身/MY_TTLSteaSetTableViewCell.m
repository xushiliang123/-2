//
//  MY_TTLSteaSetTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2016/12/29.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MY_TTLSteaSetTableViewCell.h"

@implementation MY_TTLSteaSetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _switchI.onTintColor = GOLDCOLOR;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
