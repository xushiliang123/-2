//
//  MY_LLSexConsumerView.m
//  VTIME
//
//  Created by Louie on 2017/9/18.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#import "MY_LLSexConsumerView.h"

@interface MY_LLSexConsumerView()

@property (nonatomic, strong) UILabel * VIPLabel;
@property (nonatomic, strong) UIImageView * sexImgV;
@property (nonatomic, strong) UILabel * ageLabel;

@end

@implementation MY_LLSexConsumerView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setUI];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [self setUI];
    }
    return self;
}



- (void)setUI {
  
    self.VIPLabel = [[UILabel alloc] init];
    self.VIPLabel.layer.masksToBounds = YES;
    self.VIPLabel.layer.cornerRadius = 14 / 2;
    self.VIPLabel.textColor = [Utility colorWithHexString:@"ffffff" alpha:1.0];
    self.VIPLabel.font = [UIFont boldSystemFontOfSize:9];
    self.VIPLabel.textColor = GOLDCOLOR;
    self.VIPLabel.textAlignment = NSTextAlignmentCenter;
    self.VIPLabel.layer.borderColor = GOLDCOLOR.CGColor;
    self.VIPLabel.layer.borderWidth = 1;
    [self addSubview:self.VIPLabel];
    
    //  35 * 15
    [self.VIPLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).mas_offset(40);
        make.width.mas_equalTo(34);
        make.height.mas_equalTo(14);
    }];
    
    self.sexImgV = [[UIImageView alloc] init];
    self.sexImgV.image = [UIImage imageNamed:@"icon_woman"];
    [self addSubview:self.sexImgV];
    
    [self.sexImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left);
        make.width.mas_equalTo(35);
        make.height.mas_equalTo(15);
    }];
    
    
    self.ageLabel = [[UILabel alloc] init];
    self.ageLabel.textColor = [Utility colorWithHexString:@"#fffc00" alpha:1.0];
    self.ageLabel.font = [UIFont boldSystemFontOfSize:10];
    self.ageLabel.textAlignment = NSTextAlignmentCenter;
    [self.sexImgV addSubview:self.ageLabel];
    
    [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.sexImgV.mas_centerY);
        make.right.equalTo(self.sexImgV.mas_right);
        make.width.mas_equalTo(20);
        make.height.equalTo(self.sexImgV.mas_height);
    }];
}


- (void)setSex:(NSInteger)sex age:(NSInteger)age vip:(NSInteger)vip {
    
    switch (sex) {
        case 1:
        {
            self.sexImgV.image = [UIImage imageNamed:@"icon_man"];
        }
            break;
            
        default:
        {
            self.sexImgV.image = [UIImage imageNamed:@"icon_woman"];
        }
            break;
    }
    
    self.ageLabel.text = [NSString stringWithFormat:@"%td", age];
    
    
    if (vip >= 0) {
        self.VIPLabel.hidden = NO;
        self.VIPLabel.text = GetVipLevel(vip);
        
//        [self.sexImgV mas_updateConstraints:^(MASConstraintMaker *make) {
//
//            make.left.equalTo(self.mas_left).mas_offset(40);
//        }];
    }
    else {
        self.VIPLabel.hidden = YES;
        
//        [self.sexImgV mas_updateConstraints:^(MASConstraintMaker *make) {
//
//            make.left.equalTo(self.mas_left);
//        }];
    }
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
