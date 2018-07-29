//
//  LocationTableViewCell.m
//  TogetherLu
//
//  Created by Louie on 16/12/28.
//  Copyright © 2016年 TogetherLu. All rights reserved.
//

#import "LocationTableViewCell.h"

static NSInteger HomePageTAG = 1000;

@implementation LocationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UIColor * borderColor = [Utility colorWithHexString:@"#f0f0f0" alpha:1.0];
    
    CGFloat height = self.cityBtn1.frame.size.height / 2;
    
    self.cityBtn1.layer.masksToBounds = YES;
    self.cityBtn1.layer.cornerRadius = height;
    self.cityBtn1.tag = HomePageTAG + 100;
    self.cityBtn1.layer.borderWidth = 1.0;
    self.cityBtn1.layer.borderColor = borderColor.CGColor;
    [self.cityBtn1 addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cityBtn2.layer.masksToBounds = YES;
    self.cityBtn2.layer.cornerRadius = height;
    self.cityBtn2.tag = HomePageTAG + 101;
    self.cityBtn2.layer.borderWidth = 1.0;
    self.cityBtn2.layer.borderColor = borderColor.CGColor;
    [self.cityBtn2 addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cityBtn3.layer.masksToBounds = YES;
    self.cityBtn3.layer.cornerRadius = height;
    self.cityBtn3.tag = HomePageTAG + 102;
    self.cityBtn3.layer.borderWidth = 1.0;
    self.cityBtn3.layer.borderColor = borderColor.CGColor;
    [self.cityBtn3 addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cityBtn4.layer.masksToBounds = YES;
    self.cityBtn4.layer.cornerRadius = height;
    self.cityBtn4.tag = HomePageTAG + 103;
    self.cityBtn4.layer.borderWidth = 1.0;
    self.cityBtn4.layer.borderColor = borderColor.CGColor;
    [self.cityBtn4 addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cityBtn5.layer.masksToBounds = YES;
    self.cityBtn5.layer.cornerRadius = height;
    self.cityBtn5.tag = HomePageTAG + 104;
    self.cityBtn5.layer.borderWidth = 1.0;
    self.cityBtn5.layer.borderColor = borderColor.CGColor;
    [self.cityBtn5 addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cityBtn6.layer.masksToBounds = YES;
    self.cityBtn6.layer.cornerRadius = height;
    self.cityBtn6.tag = HomePageTAG + 105;
    self.cityBtn6.layer.borderWidth = 1.0;
    self.cityBtn6.layer.borderColor = borderColor.CGColor;
    [self.cityBtn6 addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}


//  赋值
- (void)setCityArray:(NSArray *)cityArray{
    
    _cityArray = cityArray;
    
    [self.cityBtn1 setTitle:_cityArray[0] forState:UIControlStateNormal];
    [self.cityBtn2 setTitle:_cityArray[1] forState:UIControlStateNormal];
    [self.cityBtn3 setTitle:_cityArray[2] forState:UIControlStateNormal];
    [self.cityBtn4 setTitle:_cityArray[3] forState:UIControlStateNormal];
    [self.cityBtn5 setTitle:_cityArray[4] forState:UIControlStateNormal];
    [self.cityBtn6 setTitle:_cityArray[5] forState:UIControlStateNormal];
    
}


//  点击事件
- (void)cityBtnClick:(UIButton *)cityBtn{
    
    self.cellClickBlock(cityBtn.tag - HomePageTAG - 100);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
