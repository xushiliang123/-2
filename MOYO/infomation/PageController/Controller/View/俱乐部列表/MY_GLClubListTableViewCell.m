//
//  MY_GLClubListTableViewCell.m
//  VTIME
//
//  Created by gll on 2017/10/21.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_GLClubListTableViewCell.h"

@implementation MY_GLClubListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.headerButton.layer.cornerRadius = 35 * 0.5;
//    self.headerButton.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MY_GLClubModel *)model {

    _model = model;
    
    NSURL * imgUrl = [NSURL URLWithString:_model.roomHeadIcon];
    
    __weak typeof(self) weakSwlf = self;
    
    [self.headerButton sd_setImageWithURL:imgUrl forState:(UIControlStateNormal) completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [weakSwlf.headerButton setImage:[Utility circleImage:image borderWidth:0 borderColor:0] forState:(UIControlStateNormal)];
        
    }];
    
//    [self.headerButton sd_setImageWithURL:imgUrl forState:(UIControlStateNormal) placeholderImage:[UIImage imageNamed:@"占位图"] options:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//
//                [weakSwlf.headerButton setImage:[Utility circleImage:image borderWidth:0 borderColor:0] forState:(UIControlStateNormal)];
//
//    }];
    
    
    if (![Utility isBlankString:_model.roomName]) {
    self.clubNameLabel.text = _model.roomName;
    }
    if (![Utility isBlankString:_model.roomInfo]) {
        self.InfoClubLabel.text = _model.roomInfo;
    }
    
}

@end
