//
//  MY_LLSystemMessageCell.m
//  VTIME
//
//  Created by Louie on 2017/9/20.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLSystemMessageCell.h"

@implementation MY_LLSystemMessageCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    
    if (self){
        
        [self setUI];
    }
    return self;
}



- (void)setUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    UIView * grayView = [[UIView alloc] init];
//    grayView.backgroundColor = [UIColor whiteColor];
    grayView.layer.masksToBounds = YES;
    grayView.layer.cornerRadius = 22 * 0.2;
    [self.contentView addSubview:grayView];
    
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left).mas_offset(25);
        make.right.equalTo(self.contentView.mas_right).mas_offset(-25);
        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-15);
    }];
    
    self.messageLabel = [[UILabel alloc] init];
//    self.messageLabel.textColor = [Utility colorWithHexString:@"#ffffff" alpha:1.0];
    self.messageLabel.textColor = GOLDCOLOR;
    self.messageLabel.backgroundColor = [UIColor clearColor];
    self.messageLabel.font = [UIFont systemFontOfSize:12];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.numberOfLines = 0;
    [self.contentView addSubview:self.messageLabel];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(grayView).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
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
