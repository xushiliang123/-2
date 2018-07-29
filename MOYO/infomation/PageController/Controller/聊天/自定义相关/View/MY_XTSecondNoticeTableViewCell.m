//
//  MY_XTSecondNoticeTableViewCell.m
//  VTIME
//
//  Created by tingting on 2017/10/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_XTSecondNoticeTableViewCell.h"

@implementation MY_XTSecondNoticeTableViewCell

-(void)layoutForCell
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, 50)];
    view.backgroundColor = [UIColor colorWithRed:221/255.f green:221/255.f blue:221/255.f alpha:1.0f];
    [self.contentView addSubview:view];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
