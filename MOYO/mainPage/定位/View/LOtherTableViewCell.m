//
//  LOtherTableViewCell.m
//  TogetherLu
//
//  Created by Louie on 16/12/28.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "LOtherTableViewCell.h"

@implementation LOtherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    
    if (self){
        
        [self createCellUI];
    }
    
    return self;
}

- (void)createCellUI{
    
    UIColor * nameColor = [Utility colorWithHexString:@"#333333" alpha:1.0];
    
    CGSize nameSize = [Utility stringSizeWithString:@"未定位" textSize:14 width:0 height:14];
    
    self.nameLabel = [Utility createLabeltitleColor:nameColor frame:CGRectMake(15, 0, nameSize.width, 45) BackgroundColor:nil textSize:14];
    
    [self.contentView addSubview:self.nameLabel];
    
    UIColor * locationColor = [Utility colorWithHexString:@"#999999" alpha:1.0];
    
    CGSize locationSize = [Utility stringSizeWithString:@"GPS定位" textSize:12 width:0 height:12];
    
    self.locationLabel = [Utility createLabeltitleColor:locationColor frame:CGRectMake(CGRectGetMaxX(self.nameLabel.frame) + 6, 0, locationSize.width, 45) BackgroundColor:nil textSize:12];
    
    [self.contentView addSubview:self.locationLabel];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 44.5, SCREEN_WIDTH, 0.5)];
    view.backgroundColor = [Utility colorWithHexString:@"e5e5e5" alpha:1.0];
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
