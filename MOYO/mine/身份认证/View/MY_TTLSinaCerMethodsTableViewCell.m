//
//  MY_TTLSinaCerMethodsTableViewCell.m
//  TogetherLu
//
//  Created by MadridLee on 2017/4/20.
//  Copyright © 2017年 TogetherLu. All rights reserved.
//

#import "MY_TTLSinaCerMethodsTableViewCell.h"

@implementation MY_TTLSinaCerMethodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.textColor = [Utility colorWithHexString:@"333333" alpha:1];
    self.detailLabel.textColor = [Utility colorWithHexString:@"ff6262" alpha:1];
    self.textField.placeholder = @"请输入您的微博昵称";
    self.textField.textColor = [Utility colorWithHexString:@"333333" alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
