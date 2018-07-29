//
//  MyTableViewCell.m
//  TogetherLu
//
//  Created by Louie on 16/12/17.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.redBadgeView.hidden = YES;
    self.rightBedgeView.hidden = YES;
    
    self.iconImv.contentMode = UIViewContentModeScaleAspectFit;
}


- (void)showBadgeView{
    
//    self.redBadgeView.hidden = NO;
    self.rightBedgeView.hidden = NO;

}

- (void)hiddenBadgeView{
//    self.redBadgeView.hidden = YES;
    self.rightBedgeView.hidden = YES;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
